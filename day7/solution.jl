import StatsBase: countmap

CARDS = ['A', 'K', 'Q', 'J', 'T', '9', '8', '7', '6', '5', '4', '3', '2']

function getHandType(hand::Vector{Int})::Int
    if length(hand) == 1
        return 7
    elseif length(hand) == 2
        return 4 in hand ? 6 : 5
    elseif length(hand) == 3
        return 3 in hand ? 4 : 3
    else
        return length(hand) == 4 ? 2 : 1
    end
end

function play(x, y)::Bool
    left_hand = collect(values(countmap(x)))
    right_hand = collect(values(countmap(y)))
    left_hand_value = getHandType(left_hand)
    right_hand_value = getHandType(right_hand)
    if left_hand_value == right_hand_value
        return findfirst(x -> x == left_hand[1], CARDS) > findfirst(x -> x == right_hand[1], CARDS)
    end
    return left_hand_value < right_hand_value
end

function part1()
    games = Dict()
    for line in eachline("/Users/ddemidov/workspace/aoc2023/day7/test.txt")
        (hand, bid) = split(line)
        games[hand] = parse(Int, bid)
    end
    ordered_games = sort(collect(keys(games)), lt=play)
    result = 0
    for g in ordered_games
        result += i * games[g]
    end
    return result
end

println(part1())