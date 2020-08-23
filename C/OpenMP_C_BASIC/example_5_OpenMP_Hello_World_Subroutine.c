/*  
 Compile
 $ gcc -g -Wall -fopenmp -o out example_5_OpenMP_Hello_World_Subroutine.c
Execute
 $ ./out <number of threads>
 */
#include <stdio.h>
#include <stdlib.h>
#include <omp.h>   

void Hello(void);  /* Thread function */

/*main--------------------------------------------------------------------*/
int main(int argc, char* argv[]) {
    
   Hello();

   return 0; 
} 

/*-------------------------------------------------------------------
 * Function:    Hello
 * Purpose:     Thread function that prints message
 */
void Hello(void) {
    
  int nthreads, tid;
  
// fork a team of threads giving them their own copies of variables
  #pragma omp parallel private(nthreads, tid)
  {
// obtain thread number
     tid = omp_get_thread_num();
     printf("hello world from thread = %d\n", tid);

// only master thread does this
     if (tid == 0) {
        nthreads = omp_get_num_threads();
        printf("number of threads = %d\n", nthreads);
     }
  }// all threads join master thread and disband
} 
