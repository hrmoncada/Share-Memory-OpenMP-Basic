! Compile
! $ gfortran -g -Wall -fopenmp -o out example_4_OpenMP_Hello_World_Subroutine.f90 
! Set environment variable 
! $ export OMP_NUM_THREADS=16
! Execute 
! $ ./out 
! -------------------------------------------------------------------
 program hello_world
   use omp_lib
   implicit none
   integer:: thread_count
   character(100) :: num1char
   
   call get_command_argument(1,num1char)   !read the value
   read(num1char,*)thread_count            !then, convert them to integer
   print*,"Number of threads", thread_count
   
!$omp parallel num_threads(thread_count) 
   call hello( ) 
!$omp end parallel

end program
! -------------------------------------------------------------------
!  * Subroutine:  Hello
!  * Purpose:     Thread function that prints message
! ------------------------------------------------------------------- 
subroutine hello( )
   integer :: my_rank, thread_count, omp_get_num_threads, omp_get_thread_num 
   my_rank = omp_get_thread_num();
   thread_count = omp_get_num_threads();
   write(*,*) "Hello from thread", my_rank, " of ", thread_count
end subroutine 
