! Compile
! $ gfortran -fopenmp -o out example_2_OpenMP_Hello_World_Subroutine.f90 
! Set environment variable 
! $ export OMP_NUM_THREADS=16
! Execute 
! $ ./out 
! -------------------------------------------------------------------
 program hello_world
   use omp_lib
   implicit none
   integer threads_id 
   
! The omp directives "!$omp parallel" and "!$omp end parallel" creates a section of code that is run from all available threads    

!$omp parallel 
   threads_id = omp_get_thread_num() ! obtain thread number
   call hello(threads_id) 
!$omp end parallel

end program
! -------------------------------------------------------------------
subroutine hello(tid)
   integer tid
   write(*,*) 'hello world !!!, from thread = ', tid
end subroutine 
