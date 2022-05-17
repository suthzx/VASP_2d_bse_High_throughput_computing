# VASP_2d_bse_High_throughput_computing
高通量计算c2db的2d材料bse用到的高通量计算、数据处理流。
具体计算流程文件见demo(已删除CHGCAR、WAVECAR等大文件)  
需要使用vaspkit程序辅助使用：vaspkit -task 103 与 echo -e "922\n18" | vaspkit  
流程包括：stdout_dft、stdout_diag、stdout_GW0、stdout_none与stdout_bse计算。  
数据处理部分见demo中extract_chi.sh和extract_optics.sh，输入文件涉及6个INCAR，默认参数在demo里给出。  
GW0所需要的指定空带数如nab.py处理传送给各个INCAR中，如需增加额外的空带修改对应位置即可(默认8*nab)。  
