# parsargs

Parse convenient to specify function arguments into Clojure
data structures that are easy to process.

[![Build Status](https://travis-ci.org/friemen/parsargs.png?branch=master)](https://travis-ci.org/friemen/parsargs)

[![Clojars Project](http://clojars.org/parsargs/latest-version.svg)](http://clojars.org/parsargs)

Include a dependency as show above to your project.clj

[API docs](https://friemen.github.com/parsargs)

## Motivation

When creating an API there is always a tension between ease of its use
and its implementation. Ease-of-use demands a flexible and concise
notation for those who use the API, including specifying function arguments.

The API function implementation demands data structures that it can easily
work with. Although the notation of Clojure data structures is indeed
very light-weight there are times when you want to offer an even
simpler way for specifying arguments. 

As an example let's assume you're creating an API for mappings between
Clojure data and UI components. Obviously you need to specify
at least two things per mapping: the path within the data structure and
the path of the visual components property. So you could start
with a simple map:

```clojure
(def m {:name    ["Name" :text]
        :street  ["Street" :text]
        :zipcode ["Zipcode" :text]
        :city    ["City" :text]})
```
No visual noise, great. But unfortunately that is not enough. 
You'll need to also specify a parser and a formatter function to deal with 
dates and numeric data. 
Ideally the code that implements the mapping would work on something like this:
```clojure
(def m [{:data-path :name
         :signal-path ["Name" :text]
	     :formatter str
	     :parser identity},
	    ; ... 
	    ; more mapping specifications
	    ; ...
	])
```
But this is a lot of boilerplate to read and write because

 - in most cases formatter and parser would take default values `str` and `identity`.
 - the keywords like `:data-path` visually create more noise than signal.


Now you're in a dilemma.
Either the data structure representing the specification would become
cumbersome, or the data structure the data mapper works on would make
implementation more complicated and therefore harder to comprehend.

Here parsargs offers a way to specify how the concise notation is mapped
to an easy-to-work-with data structure.

```clojure
(require [parsargs.core :as p])

(def mapping-parser 
             (p/some
                (p/sequence :data-path (p/alternative
                                        (p/value vector?)
                                        (p/value keyword?))
							:signal-path (p/alternative
                                          (p/value #(and (vector? %) (string? (last %))))
                                          (p/value string?))			
                            :formatter (p/optval fn? str)
                            :parser (p/optval fn? identity))))

(defn mapping [& args]
  (p/parse mapping-parser args))

```

The mapping function is now your factory to create full blown data structures
from a concise notation:

```clojure
(def m (mapping :name    ["Name" :text]    
                :street  ["Street" :text]
                :zipcode ["Zipcode" :text] :parser to-number 
                :city    ["City" :text])) 
```


## API overview

The core namespace provides a set of parser generating functions
and the `parse` function that applies a parser function to a
sequence.

The following parser factories are provided:

 - **value** -- Return element if predicate holds, otherwise fail.
 - **optval** -- Return element if predicate holds, otherwise default value.  
 - **omit** -- Skip element if predicate holds.
 - **some** -- Apply parser-fn subsequently and create vector of parsed values.
 - **sequence** -- Apply parser-fns subsequently and create map of parsed values.
 - **alternative** -- Apply first matching parser-fn or fail.
 - **descent-with** -- Apply parser-fn to nested data structure.
 - **map** -- Apply parser-fn and apply transformation to the parsed value.
 - **optional** -- Apply parser-fn, continue if it fails.

See also [core.clj](src/parsargs/core.clj) for more details.


## License

Copyright 2013 F.Riemenschneider

Distributed under the Eclipse Public License, the same as Clojure.
