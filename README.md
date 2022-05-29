# VASP_2d_bse_High_throughput_computing
Quick Use  :blush: Update and maintenance: thsu0407@gmail.com  
- [x] High throughput calculation c2DB 2d material BSE used for high throughput calculation, data processing flow  
- [x] Note that the structure position has been repositioned for 2D material  

`1`:For specific calculation process files, see demo (large files such as CHGCAR and WAVECAR have been deleted)    
`2`:Need to use the vaspkit program to assist use:：vaspkit -task 103 and echo -e "922\n18" | vaspkit  
`3`:The process includes：stdout_dft、stdout_diag、stdout_GW0、stdout_none and stdout_bse   
`4`:For the data processing part, see extract_chi.sh and extract_optics.sh in the demo    
`5`:The input file involves 6 INCARs, and the default parameters are given in the demo   
`6`:The specified number of empty bands required by GW0 is processed and transmitted to each INCAR as nab.py. If you need to add additional empty bands, you can modify the corresponding position (default 8*nab)  

