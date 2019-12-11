# EVER
EVER designed by ljx
#Key steps for EVER algorithm
Choose appropriate crystal structure of RECPTOR and LIGAND, run cavity to detect the key residues in pocket, MOVE the /parameters, /defaults directory in $PATH/Cavity to current directory and modify input file
# cavity64 cavity-AA.input
generate fasta fromat file of pocket aminoacids, delete the HEAD AND TAIL of PDBID_cavity_NUM.pdb, only keep rows head with ATOM
# cp -rf PATH_OF_prog_GA/prog_pocket/* ./
# ./pocket.sh
the pocket sequence is saved from initialsequence.txt, andthe codon sequences are obtained from NCBI, saved as protein.fasta
prepare the docking configuration file
# from now on are the loopable steps (for each generation) 
MOVE the parental fasta format sequences in working directory
# cp -rf PATH_OF_pre_sequence/script/*./
# ./intialized.sh
generate a number of mutated sequences,and convert the DNA sequences to protein sequences, save in generation_all, with DNA sequence, RNA sequence and AA sequence, splitted by ' '.
# ./translate.sh
delete the repeating sequences and keep AA sequence
# ./delanduniq.sh
calculate the number of mutated AA for each mutant
# ./mutation_numbers.sh
# python gen_mutlist.py
# ./gen_dirlist.sh
generate scap list and mutated proten structure, save into different directories
# cp -rf PATH_OF_prog_GA/prog_generation/* ./
# ./split.sh
generate different folders to split 1000 mutated sequences to work in paralel
# ./work.sh
use scap to generate structures and use vina to calculate binding affinity
# ./mv.sh
# ./result_analysis.sh
thus, the docking result saved in dock_generation.txt
# cp -rf PATH_OF_prog_GA/prog_result/* ./
NOTE that if the binding free energy need to be COMPARED with that of ATP, the result.sh need to be edited for different generation, due to the output and input are written in gen*d_inihibitor/atp (* could be 1 2 3, etc.)
# sh result.sh
the total result are shown in inhibitor_gen*d.txt, and loop of former steps are needed if necessary.
