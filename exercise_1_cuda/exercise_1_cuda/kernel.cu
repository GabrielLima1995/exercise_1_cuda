
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>

//
//Print value of threadIdx,blockIdx, gridDim variables for 3D  grid which has 4 threads in all X, Y and Z 
// dimention and thread block size will be 2 threads in each dimention. 


// Kernell function 

__global__ void print_variables()
{
	printf("threadIdx : %d blockIdx : %d gridDim : %d \n",
		threadIdx.x, blockIdx.x, gridDim.x);

}

// Host function 

int main()
{	
	int x, y, z;

	x = 4;
	y = 4;
	z = 4;
	
	dim3 grid(2,2,2);
	dim3 block(x/grid.x,y/grid.y,z/grid.z);

	print_variables << <grid,block >> > ();

	return 0;
}

	