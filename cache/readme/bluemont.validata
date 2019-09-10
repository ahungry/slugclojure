validata
========

Validata is a Clojure library to validates maps. Its goals are:

  * provide a simple, idiomatic Clojure API
  * avoid using macros for the API
  * validate data, not transform or coerce it
  * make validation functions easy to compose
  * make validation functions easy to extend
  * use simple, easy-to-understand internals

There are many alternatives for validation in Clojure; I list some
alternatives below. My goal is to make validata clean and simple relative to
some of the other options.

[![Build Status](https://travis-ci.org/bluemont/validata.png)](https://travis-ci.org/bluemont/validata)

Usage
-----

Add this to your `project.clj` dependencies:

```clojure
[validata "0.1.8"]
```

Here is an example:

```clojure
(ns example.core
  (:require [validata.core :as v]))

(def validations
  {:uuid        [v/uuid-string v/required]
   :name        [v/string v/required]
   :notes       [v/string]
   :created-at  [v/timestamp-string]
   :updated-at  [v/timestamp-string]})

(v/errors {} validations)
; {:uuid ["key is required"], :name ["key is required"]}

(v/errors {:uuid "e0da523c-fdfc-46d5-bf6d-a895dd3235c1"} validations)
; {:name ["key is required"]}

(v/errors {:uuid "e0da523c-fdfc-46d5-bf6d-a895dd3235c1"
           :name "validata"
           :notes 2.7128} validations)
; {:notes ["value must be a string"]}

(v/errors {:uuid "e0da523c-fdfc-46d5-bf6d-a895dd3235c1"
           :name "validata"} validations)
; {}

(v/valid? {:uuid "e0da523c-fdfc-46d5-bf6d-a895dd3235c1"} validations)
; false

(v/valid? {:uuid "e0da523c-fdfc-46d5-bf6d-a895dd3235c1"
           :name "validata"} validations)
; true
```

To display errors for extra (unexpected keys), use this form of `errors`:

```clojure
(v/errors {:uuid "ed2b4b7d-1111-47e1-aa79-5b204758cd01"
           :name "validata"
           :junk 42} validations false)
; {:junk [:error "key is unexpected"]}

```


Limitations
-----------

  * only validates top-level keys and values
  * strings are not internationalized


Other Validation Libraries
--------------------------

Clojure has many validation libraries; here are a few I've looked at:

* [clj-decline][clj-decline]
* [clj-schema][clj-schema]
* [dvt][dvt]
* [valip][valip]
* [validateur][validateur]

The libraries have varying goals and approaches; take a look and give them a try. Please let me know if you see ideas that would benefit this project.

[clj-decline]: https://github.com/joodie/clj-decline
[clj-schema]: https://github.com/runa-dev/clj-schema
[dvt]: https://github.com/clpe04/dvt
[validateur]: https://github.com/michaelklishin/validateur
[valip]: https://github.com/cemerick/valip


License
-------

Copyright 2014 Bluemont Labs LLC

Distributed under the Eclipse Public License, the same as Clojure.
