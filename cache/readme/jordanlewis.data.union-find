# data.union-find

A Clojure implementation of persistent disjoint-set forests using Tarjan's
union-find algorithm.

Available in Leiningen via [Clojars](https://clojars.org/org.jordanlewis/data.union-find):

    [org.jordanlewis/data.union-find "0.1.0"]

## Usage

Make a new union-find data structure containing its arguments as singleton sets:

    user=> (use 'jordanlewis.data.union-find)
    user=> (def uf (union-find 1 2 3 4 5))
    user=> uf
    {5 [5], 4 [4], 3 [3], 2 [2], 1 [1]}

Add a new element as a singleton set with conj or cons:

    user=> (conj uf 8)
    {8 [8], 5 [5], 4 [4], 2 [3 2], 1 [1]}

Union two sets:

    user=> (def uf (union uf 2 3))
    user=> uf
    {5 [5], 4 [4], 2 [3 2], 1 [1]}

Look up the canonical element for an element:

    user=> (get-canonical uf 3)
    2

Get the number of connected components:

    user=> (count-sets uf)
    4 ;; 5 elements, but only 4 connected components

Getting the count of a union-find data structure returns the number of elements
in the universe of the union-find.

    user=> (count uf)
    5

Treating a union-find data structure as a seq similarly returns all of the
elements that have been added to the structure.

    user=> (seq uf)
    (5 4 3 2 1)

union-find also implements ILookup and IFn as canonical element lookups, so you
can use get on it or apply it to an element like you would with a vector or a
map.

    user=> (uf 3)
    2
    user=> (get uf 3)
    2
    user=> (uf 10)
    nil
    user=> (uf 10 :not-found)
    :not-found


## License

Copyright © 2012 Jordan Lewis

Distributed under the Eclipse Public License, the same as Clojure.
