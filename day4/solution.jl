function count_wins(game::String)::Int
    left, right = split(split(game, ':')[2], '|')
    wining_numbers = Set(map(x -> parse(Int, x), split(left)))
    numbers = Set(map(x -> parse(Int, x), split(right)))
    return length(intersect(wining_numbers, numbers))
end

function part1()
    result = 0
    for line in eachline("/Users/ddemidov/workspace/aoc2023/day4/input.txt")
        win_count = count_wins(line)
        if win_count > 0
            result += 2^(win_count - 1)
        end
    end
    return result
end

function part2()
    games = readlines("/Users/ddemidov/workspace/aoc2023/day4/input.txt")
    wins = map(x -> Int(x), ones(length(games)))
    for game in games
        game_number = parse(Int, split(split(game, ':')[1])[2])
        win_count = count_wins(game)
        i = win_count 
        while i != 0
            wins[game_number + i] += wins[game_number]
            i -= 1
        end
    end
    return sum(wins)
end

println(part1())
println(part2())