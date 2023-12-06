function part2()
    result = 0
    symbols = ['/', '-', '*', '&', '=', '@', '#', '%', '$', '+']
    raw_scheme = readlines("/Users/ddemidov/workspace/aoc2023/day3/input.txt")
    scheme = map(line -> collect(line), raw_scheme)
    asterisks = []
    for (i, line) in enumerate(scheme)
        j = length(line)
        while j > 0
            if line[j] == '.' || line[j] in symbols
                if line[j] == '*'
                    append!(asterisks, (i,j))
                end
                j -= 1
            else
                pow = 0
                number = 0
                while j > 0 && line[j] != '.' && !(line[j] in symbols)
                    digit = parse(Int, line[j])
                    number += digit * 10^pow
                    pow += 1
                    j -= 1
                end
                j += 1
            end
        end
    end
    return result
end


function part1()
"""
|X|X|X|X|X|
|X|1|2|3|X|
|X|X|X|X|X|

|X|X|X|X|
|X|1|2|X|
|X|X|X|X|

|X|X|X|
|X|1|X|
|X|X|X|
"""
    result = 0
    symbols = ['/', '-', '*', '&', '=', '@', '#', '%', '$', '+']
    raw_scheme = readlines("/Users/ddemidov/workspace/aoc2023/day3/input.txt")
    scheme = map(line -> collect(line), raw_scheme)
    for (i, line) in enumerate(scheme)
        j = length(line)
        while j > 0
            if line[j] == '.' || line[j] in symbols
                j -= 1
            else
                pow = 0
                number = 0
                while j > 0 && line[j] != '.' && !(line[j] in symbols)
                    digit = parse(Int, line[j])
                    number += digit * 10^pow
                    pow += 1
                    j -= 1
                end
                pow -= 1
                j += 1
                if j != 1 && line[j-1] in symbols
                    result += number
                elseif j != 1 && i != 1 && scheme[i-1][j-1] in symbols
                    result += number
                elseif j != 1 && i != length(scheme) && scheme[i+1][j-1] in symbols
                    result += number
                elseif i != 1 && scheme[i-1][j] in symbols
                    result += number
                elseif i != length(scheme) && scheme[i+1][j] in symbols
                    result += number
                elseif i != 1 && scheme[i-1][j] in symbols
                    result += number
                elseif i != 1 && pow != 0 && (scheme[i-1][j+pow-1] in symbols || scheme[i-1][j+pow] in symbols)
                    result += number
                elseif i != length(scheme) && pow != 0 && (scheme[i+1][j+pow-1] in symbols || scheme[i+1][j+pow] in symbols)
                    result += number
                elseif j + pow + 1 <= length(line) && line[j+pow+1] in symbols
                    result += number
                elseif j + pow + 1 <= length(line) && i != 1 && scheme[i-1][j+pow+1] in symbols
                    result += number
                elseif j + pow + 1 <= length(line) && i != length(scheme) && scheme[i+1][j+pow+1] in symbols
                    result += number
                end
                j -= 1
            end
        end
    end
    return result
end


println(part1())
println(part2())