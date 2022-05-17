import os
import time
mine = os.getcwd()
for i in os.listdir(mine):
    try:
        os.chdir(mine)
        #print(i)
        os.chdir(i+"/demo/")
        os.system("rm WAVECAR CHG CHGCAR *.tmp"+" -r")   
        os.chdir(mine)
    except:
        pass