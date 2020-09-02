! $ gfortran -g -Wall -fopenmp -o out example_5_OpenMP_Hello_World_Subroutine.f90
! $ export OMP_NUM_THREADS=16
! $ ./out
!  hello world from thread =            2
!  hello world from thread =            5
!  hello world from thread =           11
!  hello world from thread =           10
!  hello world from thread =            6
!  hello world from thread =            8
!  hello world from thread =           14
!  hello world from thread =           12
!  hello world from thread =           15
!  hello world from thread =            4
!  hello world from thread =            3
!  hello world from thread =            7
!  hello world from thread =            1
!  hello world from thread =            9
!  hello world from thread =            0
!  number of threads =           16
!  hello world from thread =           13
! -------------------------------------------------------------------

program hello

  call hellofunc

end
! -------------------------------------------------------------------
subroutine hellofunc

  use omp_lib 
  integer :: nthreads, tid
  !integer :: nthreads, tid, omp_get_num_threads, omp_get_thread_num

! fork a team of threads giving them their own copies of variables
!$omp parallel private(nthreads, tid)

  ! obtain thread number
  tid = omp_get_thread_num()
  write(*,*) 'hello world from thread = ', tid

  ! only master thread does this
  if (tid .eq. 0) then
    nthreads = omp_get_num_threads()
    write(*,*) 'number of threads = ', nthreads
  end if
!$omp end parallel
! all threads join master thread and disband

end 
