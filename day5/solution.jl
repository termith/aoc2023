function parseDataFromFile(path::String)
    maps::Vector{Vector{Vector{Int}}} = []
    seeds::Vector{Int} = []
    raw_data = readlines(path)
    i = 1
    while i != length(raw_data)
        line = raw_data[i]
        if length(line) == 0
            i += 1
        elseif startswith(line, "seeds")
            seeds = map(x -> parse(Int, x), split(split(line, ':')[2]))
            i += 1
        elseif endswith(line, "map:")
            current_maps::Vector{Vector{Int}} = []
            i += 1
            while i != length(raw_data) && raw_data[i] != ""
                push!(current_maps, Vector(map(x -> parse(Int, x), split(raw_data[i]))))
                i += 1
            end
            push!(maps, current_maps)
        end
    end
    return seeds, maps
end

function part1()
    seeds, maps = parseDataFromFile("/Users/ddemidov/workspace/aoc2023/day5/input.txt")
    min_location = Inf
    for seed in seeds
        current_value = seed
        for map_type in maps
            for map in map_type
                if map[2] + map[3] > current_value >= map[2]
                    current_value = map[1] + (current_value - map[2])
                    break
                end
            end
        end
        if current_value < min_location
            min_location = current_value
        end
    end
    return min_location
end

function part2()
    seeds, maps = parseDataFromFile("/Users/ddemidov/workspace/aoc2023/day5/input.txt")
    min_location = Inf
    @assert iseven(length(seeds))
    i = 1
    while i <= length(seeds)
        offset = 0
        while offset != seeds[i+1]
            current_value = seeds[i] + offset
            for map_type in maps
                for map in map_type
                    if map[2] + map[3] > current_value >= map[2]
                        current_value = map[1] + (current_value - map[2])
                        break
                    end
                end
            end
            if current_value < min_location
                min_location = current_value
            end
            offset += 1
        end
        i += 2
    end
    return min_location
end

println(part1())
println(part2())