# clj-xml-validation

A fork of the [xml-validation](https://github.com/rkday/clj-xml-validation) library, created by [rkday](https://github.com/rkday).

A Clojure library designed to wrap the Java libraries for XML schema validation. create-validation-fn takes a schema, and returns a function that takes an XML string and returns true (if the string is valid according to the schema) or false.

Improves on the original implementation of this library by:

- Accept the schema to validate against using anything that [the StreamSource constructor](https://docs.oracle.com/javase/7/docs/api/javax/xml/transform/stream/StreamSource.html#constructor_summary) can handle (e.g an InputStream, Reader, File etc.) + URL
- Returns a ValidationResult object, that encloses the validation errors

## Install

[![Clojars Project](https://img.shields.io/clojars/v/clj-xml-validation.svg)](https://clojars.org/clj-xml-validation)

## Usage

```
(require '[clj-xml-validation.core :as xmlv])
(def is-valid-xml? (xmlv/create-validation-fn (clojure.java.io/resource "example.xsd")))

(xmlv/valid? (is-valid-xml? "<foo><bar/></foo>"))
;; => true or false

(xmlv/errors (is-valid-xml? "<foo><bar/></foo>"))
;; => vector of {}'s - for example:
;; {:message "cvc-complex-type.2.4.a: Invalid content was found starting with element 'heading'. One of '{from}' is expected."
;;  :line-number 1
;;  :column-number 50
;;  :source "...SNIP..."}

;; Validating malformed xml throws an exception
(is-valid-xml? "<foo><bar/>")
;; => throws clojure.lang.ExceptionInfo
```

## Building

lein do clean, test, install

## License

Forked by Brendan Bates - [ICM Consulting](icm-consulting.com.au)

Original Copyright © 2013 Rob Day

Distributed under the Eclipse Public License, the same as Clojure.
