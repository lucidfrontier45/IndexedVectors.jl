# IndexedVectors

[![Build Status](https://travis-ci.org/lucidfrontier45/IndexedVectors.svg?branch=master)](https://travis-ci.org/lucidfrontier45/IndexedVectors) [![Coverage Status](https://coveralls.io/repos/github/lucidfrontier45/IndexedVectors/badge.svg?branch=master)](https://coveralls.io/github/lucidfrontier45/IndexedVectors?branch=master)

Vectors that can be looked up by the specidied key.

Example

```julia
using IndexedVectors

# base data
data = [("a", 100), ("b", 200), ("c", 300)]

# create index by the first item
indexed_data = IndexedVector(data, x -> x[1])

# get by index
data[1] # ("a", 100)

# get by key
data["b"] # ("b", 200)

# slice index
data[1:2] # [("a", 100), ("b", 200)]
```
