import copy


def unbinay(bin):
    temp = copy.deepcopy(str(bin))
    temp = temp[2:len(temp)]
    return temp


def binary(notbin):
    return bin(int(notbin, 2))


def notter(notbin):
    temp = ""
    for i in range(len(notbin)):
        if (notbin[i] == "1"):
            temp = temp + "0"
        else:
            temp = temp + "1"
    return temp


def leftShif(notbin):
    notbin = notbin[1:len(notbin)]
    notbin = notbin + "0"
    return notbin


def rightShif(notbin):
    notbin = notbin[0:len(notbin) - 1]
    notbin = "0" + notbin
    return notbin


def addition(a, b):
    lenght = len(a) + 1
    sum = int(a, 2) + int(b, 2)
    sum = bin(sum)
    sum = unbinay(sum)
    lenght = lenght - len(sum)
    return backZeroPad(sum, lenght)


def minus(a, b):
    lenght = len(a) + 1
    b = notter(b)
    sum = int(a, 2) + int(b, 2)+1
    sum = bin(sum)
    sum = unbinay(sum)
    lenght = lenght - len(sum)
    return backZeroPad(sum, lenght)


def backZeroPad(notbin, length):
    for i in range(length):
        notbin = "0" + notbin
    return notbin


def instructionDecoder(indstruction):
    decode = {
        "0000": "0000000000000001",
        "0001": "0000000000000010",
        "0010": "0000000000000100",
        "0011": "0000000000001000",
        "0100": "0000000000010000",
        "0101": "0000000000100000",
        "0110": "0000000001000000",
        "0111": "0000000010000000",
        "1000": "0000000100000000",
        "1001": "0000001000000000",
        "1010": "0000010000000000",
        "1011": "0000100000000000",
        "1100": "0001000000000000",
        "1101": "0010000000000000",
        "1110": "0100000000000000",
        "1111": "1000000000000000"

    }
    return decode.get(indstruction, "0000000000000000")


def cycleDecoder(r, f, g):
    cycle = str(g) + "" + str(f) + "" + str(r)
    decode = {
        "000": "00001",
        "001": "00010",
        "010": "00100",
        "011": "01000",
        "100": "10000"
    }
    return decode.get(cycle, "00000")


def ScDecoder(sc):
    decode = {
        0: "0001",
        1: "0010",
        2: "0100",
        3: "1000",

    }
    return decode.get(sc, "00000")

def goToFetch():
    global r
    global f
    global g
    global clr_sc
    r = 0
    f = 0
    g = 0
    clr_sc = 1
def Ander(a,b):
    lenght=len(a)
    temp=int(a,2)&int(b,2)
    temp=unbinay(bin(temp))
    return backZeroPad(temp,lenght-len(temp))

def Orer(a,b):
    lenght = len(a)
    temp = int(a,2) | int(b,2)
    temp = unbinay(bin(temp))
    return backZeroPad(temp, lenght - len(temp))

def Xorer(a,b):
    lenght = len(a)
    temp = int(a,2) ^ int(b,2)
    temp = unbinay(bin(temp))
    return backZeroPad(temp, lenght - len(temp))

clk = 150
memory = [["0000000000000000"] for i in range(1000)]

"""memory[0]="1101010000000001"
memory[1]="0000000000000010"
memory[2]="0000000000001111"
memory[3]="0000000000001111"
memory[4]="0001100000000101"""

"""memory[0]="0001010000000001"
memory[1]="0001110000000010"
memory[2]="0000010000101011"
memory[3]="0000100000111111"
memory[4]="0000110000111111"
memory[5]="0001000000111111"""

"""memory[0]="0001010011111111"
memory[1]="0000000011111111"
memory[2]="0011010000000010"
memory[3]="0101010101010101"
memory[4]="0000010011111110"
memory[5]="0011000000000010"
memory[6]="0101010101010101"
memory[7]="0011110000000010"
memory[8]="0011010000001001"
memory[9]="0011000000001010"""""

"""memory[0]="0001010010101010"
memory[1]="0010000000000010"
memory[2]="0101010101010101"
memory[3]="0010110000000100"
memory[4]="0011110000000100"
memory[5]="0011110000001000"
memory[6]="0011110000010000"
memory[7]="0011110000100000"
memory[8]="1011110000000001"
memory[9]="1011110000000010"
memory[10]="1011110000000100"
memory[11]="1011110000001000"
memory[12]="1011110001000000"
memory[13]="1011110010000000"
memory[14]="1011110000000100"
memory[15]="0101010101010101"
memory[16]="1011110000001000"
memory[17]="0101010101010101"
memory[18]="1011110000010000"
memory[19]="1011110000100000"""""

"""memory[0]="0010010010101010"
memory[1]="1011110000100000"
memory[2]="0011110001000000"""
"""memory[0]="0010010000000001"
memory[2]="0010100000001010"""








startIndex = 1
clr_sc = 0
inf = 0
fgi = 0
fgo = 0
pc = "0000000000"
mar = "0000000000"
ac = "00000000"
mbr = "0000000000000000"
ar = "0000000000"
inpr = "10101010"
outr = "00000000"
#q = "0000000000000000"
sc = 0
#c = "00000"
t = 0
e = 0
clr_sc = 0
r = 0
f = 0
g = 0
cf = 0
zf = 0
i0 = 0
i1 = 0
opr = "0000"
cr = "00000000"
#en_cd = 0
#en_id = 0
reg = 0
p = 0
#q="0000000000000000"
opr="xxxx"

for i in range(clk):
    if (startIndex):
        if (clr_sc == 1):
            sc = 0
            clr_sc = 0
        t = ScDecoder(sc)
        q = instructionDecoder(opr)
        c = cycleDecoder(r, f, g)
        if ((not inf) and (t[3] == "1") and startIndex):
            if (c[4] == "1"):
                mar = copy.deepcopy(pc)
            elif (c[3] == "1"):
                mar = copy.deepcopy(ar)
            elif (c[2] == "1"):
                mar = copy.deepcopy(ar)
            elif (c[0] == "1"):
                mbr = mbr[0:6] + "" + copy.deepcopy(pc)
            elif ((q[15] == "1")) and (c[1] == "1"):
                sum = addition(ac, mbr[8:16])
                cf = int(sum[0])
                ac = copy.deepcopy(sum[1:len(sum)])
                if (ac == "00000000"): zf = 1
                goToFetch()
            elif ((q[14] == "1")) and (c[1] == "1"):
                sum = minus(ac, mbr[8:16])
                cf = int(sum[0])
                ac = copy.deepcopy(sum[1:len(sum)])
                if (ac == "00000000"): zf = 1
                goToFetch()
            elif ((q[13] == "1")) and (c[1] == "1"):
                ac=Ander(ac,mbr[8:16])
                goToFetch()
            elif ((q[12] == "1")) and (c[1] == "1"):
                ac = Orer(ac, mbr[8:16])
                goToFetch()
            elif ((q[11] == "1")) and (c[1] == "1"):
                ac = Xorer(ac, mbr[8:16])
                goToFetch()
            elif ((q[10] == "1")) and (c[1] == "1"):
                ac = copy.deepcopy(mbr[8:16])
                goToFetch()
            elif ((q[9] == "1")) and (c[1] == "1"):
                mar = copy.deepcopy(ar)
                mbr = mbr[0:8] + "" + copy.deepcopy(ac)
            elif ((q[8] == "1")) and (c[1] == "1"):
                pc = copy.deepcopy(ar)
                goToFetch()
            elif ((q[7] == "1")) and (c[1] == "1"):
                mbr = mbr[0:6] + "" + copy.deepcopy(pc)
                mar = ar
            elif ((q[6] == "1")) and (c[1] == "1"):
                #mbr = binary(mbr)
                #mbr = mbr - 0b0000000000000001
                mbr = minus(mbr, "0000000000000001")
                #mbr = unbinay(mbr)
                mbr=mbr[1:len(mbr)]
            elif ((q[5] == "1")) and (c[1] == "1"):
                cr = copy.deepcopy(mbr[8:16])
                goToFetch()
            elif ((q[4] == "1")) and (c[1] == "1"):
                pc = copy.deepcopy(memory[int(mar, 2)][6:16])
                goToFetch()
            elif ((q[3] == "1")) and (c[1] == "1"):
                if (zf):
                 pc = addition(pc, "0000000001")
                 pc = pc[1:len(pc)]
                else:
                    pc=copy.deepcopy(mbr[6:16])
                goToFetch()
            elif ((q[2] == "1")) and (c[1] == "1"):
                if (cf):
                 pc = addition(pc, "0000000001")
                 pc = pc[1:len(pc)]
                else:
                    pc = copy.deepcopy(mbr[6:16])
                goToFetch()
            elif ((reg == 1) and (mbr[15] == "1")):
                ac = "00000000"
                goToFetch()
            elif ((reg == 1) and (mbr[14] == "1")):
                zf = 0
                cf = 0
                goToFetch()
            elif ((reg == 1) and (mbr[13] == "1")):
                ac = notter(ac)
                goToFetch()
            elif ((reg == 1) and (mbr[12] == "1")):
                ac = rightShif(ac)
                goToFetch()
            elif ((reg == 1) and (mbr[11] == "1")):
                ac = leftShif(ac)
                goToFetch()
            elif ((reg == 1) and (mbr[10] == "1")):
                ac = addition(ac, "00000001")
                ac = ac[1:len(pc)]
                goToFetch()
            elif ((reg == 1) and (mbr[9] == "1")):
                startIndex = 0
                goToFetch()
            elif ((p == 1) and (mbr[15] == "1")):
                ac = copy.deepcopy(inpr)
                fgi = 0
                goToFetch()
            elif ((p == 1) and (mbr[14] == "1")):
                outr = copy.deepcopy(ac)
                fgo = 0
                goToFetch()
            elif ((p == 1) and (mbr[13] == "1")):
                if (fgi):
                    pc = addition(pc, "0000000001")
                    pc=pc[1:len(pc)]
                goToFetch()
            elif ((p == 1) and (mbr[12] == "1")):
                if (fgo):
                    pc = addition(pc, "0000000001")
                    pc = pc[1:len(pc)]
                goToFetch()
            elif ((p == 1) and (mbr[11] == "1")):
                inf = 1
                goToFetch()
            elif ((p == 1) and (mbr[10] == "1")):
                inf = 0
                goToFetch()
            elif ((p == 1) and (mbr[9] == "1")):
                fgi = 1
                goToFetch()
            elif ((p == 1) and (mbr[8] == "1")):
                fgo = 1
                goToFetch()
        elif ((not inf) and (t[2] == "1") and startIndex):
            if (c[4] == "1"):
                mbr = copy.deepcopy(memory[int(mar, 2)])
                pc = addition(pc,  "0000000001")
                pc = pc[1:len(pc)]
            elif (c[3] == "1"):
                mbr = copy.deepcopy(memory[int(mar, 2)])
            elif (c[2] == "1"):
                mbr = copy.deepcopy(memory[int(mar, 2)])
            elif (c[0] == "1"):
                pc = "0000000000"
                mar = "0000000000"
            elif ((q[9] == "1") and (c[1] == "1")):
                memory[int(mar, 2)]= memory[int(mar, 2)][0:8]+""+copy.deepcopy(mbr[8:16])
                goToFetch()
            elif ((q[7] == "1")) and (c[1] == "1"):
                memory[int(mar, 2)] = memory[int(mar, 2)][0:6]+""+copy.deepcopy(mbr[6:16])
                ar = addition(ar,  "0000000001")
                ar = ar[1:len(ar)]
            elif ((q[6] == "1")) and (c[1] == "1"):
                memory[int(mar, 2)]= memory[int(mar, 2)][0:8]+""+copy.deepcopy(mbr[8:16])
                ac = copy.deepcopy(mbr[8:16])
        elif ((not inf) and (t[1] == "1") and startIndex):
            if (c[4] == "1"):
                i1 = int(mbr[0])
                i0 = int(mbr[1])
                opr = copy.deepcopy(mbr[2:6])
                ar = copy.deepcopy(mbr[6:16])
            elif (c[3] == "1"):
                ar = copy.deepcopy(mbr[6:16])
            elif (c[2] == "1"):
                r=1
                f=1
                g=0
                clr_sc=1
            elif (c[0] == "1"):
                memory[int(mar, 2)] = copy.deepcopy(mbr)
                pc = addition(pc,  "0000000001")
                pc = pc[1:len(pc)]
            elif ((q[7] == "1")) and (c[1] == "1"):
                pc=copy.deepcopy(ar)
                goToFetch()
            elif ((q[6] == "1")) and (c[1] == "1"):
                if(ac=="00000000"):
                    pc = addition(pc,  "0000000001")
                    pc = pc[1:len(pc)]
                goToFetch()

        elif ((not inf) and (t[0] == "1") and startIndex):
            if((1 if i0 == 0 else 0)*int(c[4])):
                r=1
                f=1
                g=0
            elif ((1 if i1 == 0 else 0) *i0* int(c[4])):
                r = 0
                f = 1
                g = 0
            elif ( i1 * i0 * int(c[4])):
                r = 1
                f = 0
                g = 0
            elif(c[3]=="1"):
                r = 0
                f = 1
                g = 0
            elif (c[0] == "1"):
                r = 0
                f = 0
                g = 0
        elif (inf):
            if(t[3] == "1"):
                mbr=mbr[0:6]+""+copy.deepcopy(pc)
                r = 0
                f = 0
                g = 1
                inf=0


        reg = int(q[0]) * (1 if i0 == 0 else 0) * (1 if i1 == 0 else 0) * int(c[1])
        p = int(q[0]) * i1 * (1 if i0 == 0 else 0) * int(c[1])
        #en_id=1
        #sc=sc+1
        #if (ac == "00000000"): zf = 1
        if((sc+1)==4):sc=0
        else:sc=sc+1
print(memory)