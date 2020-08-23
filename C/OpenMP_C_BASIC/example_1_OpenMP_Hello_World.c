/******************************************************************************
* Simple example:
*    1. The master thread forks a parallel region. 
*    2. All threads in the team obtain their unique thread number and print it.
*    3. The master thread only prints the total number of threads.
*    4. Two OpenMP library routines are used to obtain the number of threads and each
*       thread's number.
Compile :
$ gcc -fopenmp -o out omp_hello.c
Execute :
$ export OMP_NUM_THREADS=8
$ ./out
******************************************************************************/
#include <omp.h>
#include <stdio.h>
#include <stdlib.h>

int main (int argc, char *argv[])  {
  int nthreads, thead_id;

/* Fork a team of threads giving them their own copies of variables */
  #pragma omp parallel private(nthreads, thead_id)
  {
/* Obtain thread number */
     thead_id = omp_get_thread_num();
     printf("Hello World from thread = %d\n", thead_id);

/* Only master thread does this */
     if (thead_id == 0) {
       nthreads = omp_get_num_threads();
       printf("Number of threads = %d\n", nthreads);
     }
   }  
/* All threads join master thread and disband */
  return 0;
}
