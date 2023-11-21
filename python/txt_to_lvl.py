import re 

class Level:
    tiles = {' ' : 'Ground', '#' : 'Wall', '*': 'Wall', '@' : 'Ground', '.' : 'Storage', '$' : 'Box'}
    def __init__(self, num):
        self.num = num
        self.line_buff = list()
    def add_buff(self, next_line):
        self.line_buff.append(next_line)
    def print_level(self):
        self.line_buff.reverse()
        player_x = 0
        player_y = 0
        for y in range(len(self.line_buff)):
            for x in range(len(self.line_buff[y])):
                if(self.line_buff[y][x] == '@'):
                    player_x = x 
                    player_y = y
                    break
        print("bad_maze_" + str(self.num) + " = Maze (C 0 0) mazeF_" + str(self.num) )
        print()
        print("bad_mazeF_"+str(self.num)+" (C x y)")

        for y in range(len(self.line_buff)):
            # print(self.line_buff[y])
            last_same = 0
            for x in range(len(self.line_buff[y])):
                if x == len(self.line_buff[y]) - 1 or self.line_buff[y][x] != self.line_buff[y][x+1]:
                    print("    | y == " + str(y - player_y) + " && x >= " + str(last_same - player_x) + " && x <= " + str(x - player_x) + " = " + self.tiles.get(self.line_buff[y][x]))
                    last_same = x + 1
        print("    | otherwise = Blank")
        print()
                    

    
f = open('levels.txt', 'r')
lvl_list = list()
while 1:
    line = f.readline()
    if not line: break
    line = line.strip().split() 
    lvl = Level(int(line[1]))
    while 1:
        line = f.readline() 
        if not line: break 
        line = list(line.rstrip())
        if line == []: break 
        lvl.add_buff(line) 
    lvl_list.append(lvl) 

for level in lvl_list:
    level.print_level()

