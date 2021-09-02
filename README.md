## SINGLE-CYCLE-RISC-V in VHDL

![image](https://user-images.githubusercontent.com/88595269/128730771-560da5b6-f33b-410c-bc03-2dc68f2c748e.png)

## Requirements

1. GHDL
2. GTKWave
3. VHDL

## Quick Instructions

### cloning repository

$ git clone https://github.com/MKrekker/SINGLE-CYCLE-RISC-V.git  
$ cd  SINGLE-CYCLE-RISC-V  

### compiling VHDL code and looking wave diagrams in GTKWave

      $ ghdl -s test_file.vhdl                 #Syntax Check  
      $ ghdl -a test_file.vhdl                 #Analyse  
      $ ghdl -e test_file.vhdl                 #Build   
      $ ghdl -r test_file --vcd=testbench.vcd  #VCD-Dump  
      $ gtkwave testbench.vcd                  #Start GTKWave  

Also you can compile and look on wave diagrams in GTKWave with command  
  
      $ bash script.sh test_file.vhdl test_file_testbench.vhdl  
 
Last file must be testbench !!!   

## References

1. David M. Harris and Sarah L. Harris, "Digital Design and Computer Architecture, RISC-V Edition" 
http://pages.hmc.edu/harris/class/e85/lect23.pdf

2. David A. Patterson, John L. Hennessy, “Computer Organization and Design RISC-V Edition: The Hardware Software Interface”, Morgan Kaufmann, 2017.

3. https://github.com/ghdl/ghdl  

4. http://gtkwave.sourceforge.net/
