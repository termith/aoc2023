function getGameId(s::String)::Int
    return parse(Int, split(split(s, ':')[1])[2])
end

function part1()
    # only 12 red cubes, 13 green cubes, and 14 blue cubes
    result = 0
    for line in eachline("/Users/ddemidov/workspace/aoc2023/day2/input.txt")
        is_valid_game = true
        game_id = getGameId(line)
        for cubes in split(split(line, ':')[2], ';')
            round = Dict([("red", 0), ("green", 0), ("blue", 0)])
            for colors in split(cubes, ',')
                value, color = split(colors)
                round[color] += parse(Int, value)
            end
            if round["red"] > 12 || round["green"] > 13 || round["blue"] > 14
                is_valid_game = false
                break
            end
        end
        if is_valid_game
            result += game_id 
        end
    end
    return result
end

function part2()
    result = 0
    for line in eachline("/Users/ddemidov/workspace/aoc2023/day2/input.txt")
        max_red = 0
        max_green = 0
        max_blue = 0
        for cubes in split(split(line, ':')[2], ';')
            for colors in split(cubes, ',')
                value, color = split(colors)
                number = parse(Int, value)
                if color == "red"
                    max_red = max(max_red, number)
                elseif color == "green"
                    max_green = max(max_green, number)
                elseif color == "blue"
                    max_blue = max(max_blue, number)
                end
            end
            
        end
        game_power = max_red * max_green * max_blue
        result += game_power
    end
    return result
end

println(part1())
println(part2())