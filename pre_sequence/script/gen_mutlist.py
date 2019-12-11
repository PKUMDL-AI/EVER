class mutation(object):
    def __init__(self, number, location, AA):
        self.number = number
        self.location = location
        self.AA = AA

f = open('rnadif')
k = 0
mut = []
while True:
    line = f.readline()
    if '---' in line:
        location = []
        AA =[]
        diffnumber = f.readline().split(' ')[7]
        for i in range(int(diffnumber)):
            while True:
                line = f.readline()
                if 'LOCATION' in line:
                    location.append(line.strip('\n').split(' ')[-1].strip('#'))
                elif 'DIFFERENCE' in line:
                    AA.append(line.strip('\n').split(' ')[-1].split('-->'))
                    f.readline()
                    break
        mut.append(mutation(int(diffnumber),location,AA))
        k+=1
    if line is '':
        break

w = open('mutlist','w')
for i in range(len(mut)):
    for j in range(mut[i].number):
        w.write(str(i)+' '+mut[i].AA[j][0]+mut[i].location[j]+mut[i].AA[j][1]+' '+'D,'+mut[i].location[j]+','+mut[i].AA[j][1]+'\n')
w.close()
