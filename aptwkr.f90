!
!	Atomic Polar Tensor Worker
!
! This is a little dummy program wich perform
! calculations of the invariants of Atomic polar
! tensors.
!
! Coded by L. J. Duarte
!

PROGRAM aptwkr

	IMPLICIT none
	

	DOUBLE PRECISION, DIMENSION(3,3) :: apt
	DOUBLE PRECISION, DIMENSION(3,3) :: apt_t
	DOUBLE PRECISION, DIMENSION(3,3) :: temp
	CHARACTER (LEN=15) :: name
	DOUBLE PRECISION :: Pbar
	DOUBLE PRECISION :: effch
	DOUBLE PRECISION :: an
	DOUBLE PRECISION :: det
	DOUBLE PRECISION :: cofac
	OPEN (unit = 1, file = "tensors.inp")
	OPEN (unit = 2, file = "tensors.out")
	
	DO WHILE (.TRUE.)
		READ (1,*) name
		READ (1,*) apt_t
		apt = transpose(apt_t)

! 	Mean Dipole Moment Derivative Calculation	

		Pbar = Tr(apt)/3

!	Effective Charge Calculation

		temp=apt*apt_t
		effch = SQRT(Tr(temp)/3)

!	Anisotropy Calculation 

		an = (apt(1,1)-apt(2,2))**2+(apt(2,2)-apt(3,3))**2+(apt(3,3)-apt(1,1))**2 &
			+3*(apt(1,2)**2+apt(1,3)**2+apt(2,1)**2+apt(2,3)**2+apt(3,1)**2+apt(3,2)**2)
		an=an/2.0
		an=SQRT(an)
	
!	Determinant Calculation

		det = apt(1,1)*(apt(2,2)*apt(3,3)-apt(2,3)*apt(3,2)) &
		    + apt(1,2)*(apt(2,3)*apt(3,1)-apt(3,3)*apt(2,1)) &
	   	    + apt(1,3)*(apt(2,1)*apt(3,2)-apt(2,2)*apt(3,1))
		det = cbrt(det)

!       Square root of the sum of cofactors.

		cofac = apt(1,1)*apt(2,2) + apt(2,2)*apt(3,3) + apt(3,3)*apt(1,1) &
		      + apt(2,1)*apt(1,2) + apt(3,2)*apt(2,3) + apt(1,3)*apt(3,1)
		cofac = SQRT(cofac) 

!	Print Output

		WRITE (2, *), name
		WRITE (2, *) "APT INPUT:"
		CALL pMatrix(apt, 3, 3, 2)
		WRITE (2,*) "INVARIANTS - OUTPUT:"
        	WRITE (2,*) "Mean Dipole Moment Derivative:", Pbar
        	WRITE (2,*) "Absolute Value of the Effective Charge:", effch
		WRITE (2,*) "Square Root of the Anisotropy:", an
       		WRITE (2,*) "Cubic Root of the Determinant :", det
        	WRITE (2,*) "Square Root of the Sum of Cofactors:", cofac
		Write(2,*) ""
	END DO


CONTAINS

! Function "Tr" to calculate the matrix trace

REAL FUNCTION Tr(matrix)
        IMPLICIT none
        DOUBLE PRECISION, INTENT(in) :: matrix(3,3)

        Tr = matrix(1,1)+matrix(2,2)+matrix(3,3)

END FUNCTION Tr

! Function cubic root. 

REAL FUNCTION cbrt(x)
	IMPLICIT none
	DOUBLE PRECISION, INTENT(in) :: x
	DOUBLE PRECISION :: temp
	DOUBLE PRECISION :: logx
	IF (x<=0) THEN
		temp=-1*x 
		logx = LOG(temp)
		cbrt = -1*EXP(logx/3.0)
	ELSE
		logx = LOG(x)
                cbrt = EXP(logx/3.0)
	END IF
END FUNCTION cbrt

END PROGRAM aptwkr


SUBROUTINE pMatrix(matrix, a, b, c)

	IMPLICIT none

	DOUBLE PRECISION, INTENT(in) :: matrix(a, b)
	INTEGER, INTENT(in) :: a, b, c 
	
	INTEGER :: i
	
	DO i = 1,a
		WRITE (c,*), matrix(i,:)
	END DO

END SUBROUTINE pMatrix

!
! REFERENCES:
! 
! B.B. Neto, M.M.C Ferreira, I.S. Scarminio, R.E. Bruns, J. Phys. Chem. 1989, 93, 1728-1733.
! I.S. Scarminio, B.B Neto, A.E Oliveira, R.L.A. Haiduke, R.E. Bruns, J. Mol. Struct. 2001, 539, 149-157.
! W.E. Richter, L.J. Duarte, A.F. Silva, R.E. Bruns, J. Braz. Chem. Soc. 2016, 27, 979-991.
!


