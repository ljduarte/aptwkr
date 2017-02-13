# Atomic Polar Tensor Worker 
This is a little dummy program which performs calculations of the invariants of Atomic Polar Tensors.

# To compile: 
gfortran -o aptwkr.x aptwkr.f90 -O3

# Input example:
Create a file named "tensors.inp" with the molecule's name and the APT. You can put any number of tensors in this file
//Example:

CH4 // Molecule 1

-0.01581476     -0.00037874     0.00023652

-0.00092163     -0.01541506    -0.00097321

 0.00093966     -0.00043460    -0.01498229

CF4 //Molecule 2

1.99022760      -0.04213574     0.00608118

0.00653364       2.12460797    -0.03191953

0.04662024      -0.03154929     2.08249062


# References:
B.B. Neto, M.M.C Ferreira, I.S. Scarminio, R.E. Bruns, J. Phys. Chem. 1989, 93, 1728-1733.
I.S. Scarminio, B.B Neto, A.E Oliveira, R.L.A. Haiduke, R.E. Bruns, J. Mol. Struct. 2001, 539, 149-157.
W.E. Richter, L.J. Duarte, A.F. Silva, R.E. Bruns, J. Braz. Chem. Soc. 2016, 27, 979-991.

