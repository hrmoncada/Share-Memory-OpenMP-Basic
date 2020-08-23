! The "!$omp parallel" and "!$omp end parallel" directives creates a section of code that is run from all available threads.
! Compile
! $ gfortran -fopenmp -o out example_2_OpenMP_Hello_World_Subroutine.f90 
! Set environment variable 
! $ export OMP_NUM_THREADS=16
! Execute 
! $ ./out 

 program hello_world
 ! Include OpenMP header file, invoke openmp functionality.
   use omp_lib
   implicit none

!$omp parallel 
   call hello(omp_get_thread_num()) ! obtain thread number
!$omp end parallel

end program

subroutine hello(tid)
   integer tid
   write(*,*) 'hello World !!!, From Thread = ', tid
end subroutine 
