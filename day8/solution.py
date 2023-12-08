import math
import itertools


def lcm(a, b):
    return (a * b) // math.gcd(a, b)



def part1():
    with open("/Users/ddemidov/workspace/aoc2023/day8/input.txt") as f:
        raw_data = f.readlines()
    commands = raw_data[0].strip()
    mapping = {}
    for line in raw_data[2:]:
        splitted_line = line.strip().split(' = ')
        left, right = splitted_line[1].lstrip('(').rstrip(')').split(',')
        mapping[splitted_line[0]] = (left.strip(), right.strip())
    current_node = 'AAA'
    path_iterator = itertools.cycle(commands) 
    steps = 0
    while current_node != 'ZZZ':
        path = next(path_iterator)
        current_node = mapping[current_node][0] if path == 'L' else mapping[current_node][1]
        steps += 1
    print(steps)

def part2():
    with open("/Users/ddemidov/workspace/aoc2023/day8/input.txt") as f:
        raw_data = f.readlines()
    commands = raw_data[0].strip()
    mapping = {}
    for line in raw_data[2:]:
        splitted_line = line.strip().split(' = ')
        left, right = splitted_line[1].lstrip('(').rstrip(')').split(',')
        mapping[splitted_line[0]] = (left.strip(), right.strip())
    current_nodes = [k for k in mapping.keys() if k.endswith('A')]
    steps_list = []
    for current_node in current_nodes:
        steps = 0
        path_iterator = itertools.cycle(commands) 
        while not current_node.endswith('Z'):
            path = next(path_iterator)
            current_node = mapping[current_node][0] if path == 'L' else mapping[current_node][1]
            steps += 1
        steps_list.append(steps)
    print(math.lcm(*steps_list))

part1()
part2()