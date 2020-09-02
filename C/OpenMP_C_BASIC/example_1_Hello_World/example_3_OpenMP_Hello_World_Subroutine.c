/******************************************************************************
The "pragma omp parallel" directives creates a section of code that is run from all available threads.
Compile

 $ gcc -fopenmp -o out example_2_OpenMP_Hello_World_Subroutine.c
Set environment variable 
 $ export OMP_NUM_THREADS=16
Execute
 $ ./out
---------------------------------------------------------------------*/
#include <stdio.h>
#include <omp.h>  

int hello(int );

int main() {
   int threads_id;
  #pragma omp parallel 
  {
      threads_id = omp_get_thread_num(); // obtain thread number
      hello( threads_id );
   }
   return 0;
/*-------------------------------------------------------------------*/
int hello(int tid){
    printf( "Hello, World !!!, From thread %d!\n", tid);
}
