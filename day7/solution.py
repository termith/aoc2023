from collections import Counter
from functools import cmp_to_key, partial

CARDS = ['A', 'K', 'Q', 'J', 'T', '9', '8', '7', '6', '5', '4', '3', '2']

def getHandType(hand):
    if len(hand) == 1:
        return 7
    elif len(hand) == 2:
        return 6 if 4 in hand else 5
    elif len(hand) == 3:
        return 4 if 3 in hand else 3
    else:
        return 2 if len(hand) == 4 else 1

def getHandTypeWithJoker(hand):
    types = []
    if 'J' in hand:
        for c in hand:
            if c != 'J':
                new_hand = replace(hand, 'J', c)
                types.append(getHandType(new_hand))
        return max(types)
    else:
        return getHandType(hand)

    
def play(x, y, type_getter=getHandType):
    left_hand = list(Counter(x).values())
    right_hand = list(Counter(y).values())
    left_hand_value = type_getter(left_hand)
    right_hand_value = type_getter(right_hand)
    if left_hand_value < right_hand_value:
        return -1
    if left_hand_value > right_hand_value:
        return 1
    for i in range(len(x)):
        if CARDS.index(x[i]) > CARDS.index(y[i]):
            return -1
        elif CARDS.index(x[i]) < CARDS.index(y[i]):
            return 1
    return 0

def solution(part):
    result = 0
    games = {}
    with open("/Users/ddemidov/workspace/aoc2023/day7/input.txt") as f:
        for line in f:
            hand, bid = line.split()
            games[hand] = int(bid)
    ordered_games = list(games.keys())
    type_getter = play if part == 1 else partial(play, type_getter=getHandTypeWithJoker)
    if part == 1:

        ordered_games.sort(key=cmp_to_key(play))

    for i, g in enumerate(ordered_games):
        result += (i + 1) * games[g]
    print(result)


solution(1)
solution(2)