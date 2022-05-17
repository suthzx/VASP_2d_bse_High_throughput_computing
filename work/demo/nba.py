data = []
fileHandler  =  open  ("./OUTCAR.DFT",  "r")
while  True:
    # Get next line from file
    line  =  fileHandler.readline()
    # If line is empty then end of file reached
    if  not  line  :
        break;
    #print(line.strip())
    data.append(line.strip())
    # Close Close 
    #fileHandler.close()
for i in data:
    if "NBANDS" in i:
        #print(i)
        tar = str(i)
print(tar)       
nba = int(tar.split()[-1])
print(nba)
nba = 8*nba
def change(a,b,incartype):
    with open('INCAR'+incartype,'r',encoding='utf-8') as f:   
        lines=[] 
        for line in f.readlines():
            if line!='\n':
                lines.append(line)
    f.close()
    with open('INCAR'+incartype,'w',encoding='utf-8') as f:
        for line in lines:
            if a in line:
                line = b 
                f.write('%s\n' %line)
            else:
                f.write('%s' %line) 

for i in [".DIAG",".GW0",".NONE",".BSE"]:
    change("NBANDS","NBANDS="+str(nba),incartype = i)

