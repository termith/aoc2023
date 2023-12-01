function part1()
    result = 0
    for line in eachline("/Users/ddemidov/workspace/aoc2023/day1/input.txt")
        i = 1
        j = length(line)
        while !isnothing(i) || !isnothing(j)
            if !isnothing(i)
                try 
                    left_value = parse(Int, line[i])
                    result += left_value * 10
                    i = nothing
                catch 
                    i += 1
                end
            end
            if !isnothing(j)
                try 
                    right_value = parse(Int, line[j])
                    result += right_value
                    j = nothing
                catch
                    j -= 1
                end
            end
        end
    end
    return result
end

function parseNumber(s::String, position::Int)
    try
        value = parse(Int, s[position])
        return value
    catch 
        try
            if position + 2 < length(s) + 1 && s[position:position+2] == "one"
                return 1
            elseif position + 2 < length(s) + 1 && s[position:position+2] == "two"
                return 2
            elseif position + 4 < length(s) + 1 && s[position:position+4] == "three"
                return 3
            elseif position + 3 < length(s) + 1 &&  s[position:position+3] == "four"
                return 4
            elseif position + 3 < length(s) + 1 &&  s[position:position+3] == "five"
                return 5
            elseif position + 2 < length(s) + 1 &&  s[position:position+2] == "six"
                return 6
            elseif position + 4 < length(s) + 1 &&  s[position:position+4] == "seven"
                return 7
            elseif position + 4 < length(s) + 1 &&  s[position:position+4] == "eight"
                return 8
            elseif position + 3 < length(s) + 1 &&  s[position:position+3] == "nine"
                return 9
            end
        catch 
            return nothing
        end
    end
    return nothing
end

function parseNumberReverse(s::String, position::Int)
    try
        value = parse(Int, s[position])
        return value
    catch 
        try
            if position - 2 > 0 && s[position-2:position] == "one"
                return 1
            elseif position - 2 > 0 && s[position-2:position] == "two"
                return 2
            elseif position-4 > 0 && s[position-4:position] == "three"
                return 3
            elseif position-3 > 0 && s[position-3:position] == "four"
                return 4
            elseif position-3 > 0 && s[position-3:position] == "five"
                return 5
            elseif position - 2 > 0 && s[position-2:position] == "six"
                return 6
            elseif position-4 > 0 && s[position-4:position] == "seven"
                return 7
            elseif position-4 > 0 && s[position-4:position] == "eight"
                return 8
            elseif position-3 > 0 && s[position-3:position] == "nine"
                return 9
            end
        catch 
            return nothing
        end
    end
    return nothing

end

function part2()
    result = 0
    for line in eachline("/Users/ddemidov/workspace/aoc2023/day1/input.txt")
        i = 1
        j = length(line)
        value = 0
        while !isnothing(i) || !isnothing(j)
            if !isnothing(i)
                left_value = parseNumber(line, i)
                if !isnothing(left_value)
                    value += left_value * 10
                    i = nothing
                else
                    i += 1
                end
            end
            if !isnothing(j)
                right_value = parseNumberReverse(line, j)
                if !isnothing(right_value)
                    value += right_value
                    j = nothing
                else
                    j -= 1
                end
            end
        end
        result += value
    end
    return result
end

# println(part1())
println(part2())