module IndexedVectors

export IndexedVector

mutable struct IndexedVector{T, I} <: AbstractVector{T}
    _data::Vector{T}
    _map::Dict{I, Int}
end

function IndexedVector(data::AbstractVector, indexer::Function, copydata::Bool)
    if copydata
        data = copy(data)
    end
    n = length(data)
    _map = Dict(zip(map(indexer, data), 1:n))
    return IndexedVector(data, _map)
end

IndexedVector(data::AbstractVector, indexer::Function) = IndexedVector(data, indexer, false)

Base.getindex(v::IndexedVector, i::Int) = getindex(v._data, i)
Base.size(v::IndexedVector) = size(v._data)

function Base.getindex(v::IndexedVector{T, I}, key::I)::T where {T, I}
    idx = v._map[key]
    return v._data[idx]
end

function Base.sort!(v::IndexedVector; kws...)
    sorted_data = sort!(v._data; kws...)
    return IndexedVector(sorted_data, v._indexer)
end

function Base.sort(v::IndexedVector; kws...)
    sorted_data = sort(v._data; kws...)
    return IndexedVector(sorted_data, v._indexer)
end

end