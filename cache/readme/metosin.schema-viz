# Schema-viz [![Build Status](https://travis-ci.org/metosin/schema-viz.svg?branch=master)](https://travis-ci.org/metosin/schema-viz) [![Dependencies Status](https://jarkeeper.com/metosin/schema-viz/status.svg)](https://jarkeeper.com/metosin/schema-viz)

Plumatic [Schema](https://github.com/plumatic/schema) visualization using Graphviz.

[![Clojars Project](http://clojars.org/metosin/schema-viz/latest-version.svg)](http://clojars.org/metosin/schema-viz)

## Prerequisites

Install [Graphviz](http://www.graphviz.org/).

## Usage

Public functions in `schema-viz.core`:
* `visualize-schemas` displays schemas from a namespace in a window.
* `save-schemas` saves schema visualization in a file.

Both take an optional options-map to configure the rendering process.
See docs for details.

```clj
(require '[schema-viz.core :as svc])
(require '[schema.core :as s])

(s/defschema Country
  {:name (s/enum :FI :PO)
   :neighbors [(s/recursive #'Country)]})

(s/defschema Burger
  {:name s/Str
   (s/optional-key :description) s/Str
   :origin (s/maybe Country)
   :price (s/constrained s/Int pos?)
   s/Keyword s/Any})

(s/defschema OrderLine
  {:burger Burger
   :amount s/Int})

(s/defschema Order
  {:lines [OrderLine]
   :delivery {:delivered s/Bool
              :address {:street s/Str
                        :zip s/Int
                        :country Country}}})

(svc/visualize-schemas)
```

Produces the following:

![Schema](dev-resources/schema.png)

## License

Copyright © 2015-2016 [Metosin Oy](http://www.metosin.fi)

Distributed under the Eclipse Public License, the same as Clojure.
