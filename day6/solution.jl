function part1()
    raw_data = readlines("/Users/ddemidov/workspace/aoc2023/day6/input.txt")
    times = map(x -> parse(Int, x), split(split(raw_data[1], ':')[2]))
    distances = map(x -> parse(Int, x), split(split(raw_data[2], ':')[2]))
    @assert length(times) == length(distances)
    i = length(times)
    result = 1
    while i != 0
        race_time = times[i]
        race_record = distances[i]
        record_attempts = 0
        start_time = race_time
        while start_time != -1
            race_result = (race_time - start_time) * start_time
            if race_result > race_record
                record_attempts += 1
            end
            start_time -= 1
        end
        result *= record_attempts
        i -= 1
    end
    return result
end

function part2()
    raw_data = readlines("/Users/ddemidov/workspace/aoc2023/day6/input.txt")
    race_time = parse(Int, replace(split(raw_data[1], ':')[2], " " => ""))
    race_record = parse(Int, replace(split(raw_data[2], ':')[2], " " => ""))
    record_attempts = 0
    start_time = race_time
    while start_time != -1
        race_result = (race_time - start_time) * start_time
        if race_result > race_record
            record_attempts += 1
        end
        start_time -= 1
    end
    return record_attempts
end

println(part1())
println(part2())