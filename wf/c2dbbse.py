import pandas as pd
import os
import numpy as np
import time
def native_cp(str_log_open,str_new):
    import os
    import shutil
    str_log_open = str_log_open 
    shutil.copyfile(str_log_open, str_new)
pos = []
path1 = "/share/home/sutianhao/data_file/c2dbpos"
path2 = "/share/home/sutianhao/bse/demo"
#file_dir = ".\\test\\"
pos = []
filetype = 'POSCAR.' # 指定类型
for root, dirs, files in os.walk(path1):
    for name in files:  
        if filetype in name:  
            #print(name) 
            pos.append(name)
mine = os.getcwd()
for i in pos:
    scf = 0
    print(i)
    os.chdir(mine)
    os.system("mkdir "+str(i))
    os.system("cp "+str(path2)+" ./"+str(i)+" -r")   ##copy the demo
    os.system("cp "+path1+"/"+str(i)+" ./"+str(i))  ##remark the poscar
    #os.system("cp "+path1+"/"+str(i)+" ./"+str(i)+"/demo/POSCAR")
    native_cp(path1+"/"+str(i),"./"+str(i)+"/demo/POSCAR")
    time.sleep(5)
    scf = 0
    while abs(scf)<1:
        #if os.path.isfile("/share/home/sutianhao/bse/wf/POSCAR.Co2Se2_AB-12-i/demo/POSCAR"):
        if os.path.isfile("/share/home/sutianhao/bse/wf/"+str(i)+"/demo/POSCAR"):
            #scf = 0.5
            #print("submit"+str(i))
            os.chdir(mine+"/"+str(i)+"/demo")
            os.system("mkdir mark")
            os.system("bsub < doall.sh")
            print("submit"+str(i))
            os.chdir(mine)
            while abs(scf)<1:
                if os.path.isfile("/share/home/sutianhao/bse/wf/"+str(i)+"/demo/done_all"):
                    print("wait ending...")
                    scf = 1
                    import time
                else:
                    time.sleep(10)
        else:
            time.sleep(5)
