!******************************************************************************
! Simple example:
!    1. The master thread forks a parallel region. 
!    2. All threads in the team obtain their unique thread number and print it.
!    3. The master thread only prints the total number of threads.
*    4. Two OpenMP library routines are used to obtain the number of threads and each
*       thread's number.
! Compile
! $ gfortran -fopenmp -o out omp_hello.f90
! Execute
! $ export OMP_NUM_THREADS=16
! $ ./out 
!******************************************************************************

 program hello_world
 ! Include OpenMP header file, invoke openmp functionality.
  use omp_lib 
  implicit none
  integer nthreads, thead_id!, omp_get_num_threads, omp_get_thread_num
  
! Fork a team of threads giving them their own copies of variables

!$omp parallel private(nthreads, thead_id)

   thead_id = omp_get_thread_num()  ! obtain thread number
   print *, 'hello world from thread = ', thead_id

   if (thead_id .eq. 0) then    ! only master thread does this
        nthreads = omp_get_num_threads()
        print *, 'number of threads = ', nthreads
   end if
!$omp end parallel

! All threads join master thread and disband
end program
