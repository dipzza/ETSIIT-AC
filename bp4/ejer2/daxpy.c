#include <stdlib.h>
#include <stdio.h>
#include <time.h>

#define MAX 100000000

double x[MAX], y[MAX];

int main(int argc, char** argv)
{
	if (argc<2)
	{
		printf("Faltan nº columnas de la matriz\n");
		exit(-1);
	}
	unsigned int N = atoi(argv[1]);
	if (N>=MAX) N=MAX - 1;
	
	
	struct timespec cgt1,cgt2; 
	double ncgt;
	
	//Inicializacion 
	for (int i=0; i<=N; ++i)
	{
		y[i] = N*0.1+i*0.1;
		x[i] = N*0.1+i*0.1;
	}
	
	//Nucleo
	clock_gettime(CLOCK_REALTIME,&cgt1);
	for (int i=1;i<=N;i++)
		y[i] = 2*x[i] + y[i];
	clock_gettime(CLOCK_REALTIME,&cgt2);
	
	ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec) + (double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

	printf("Tiempo:%11.9f\t / N:%u\t/ y[0] = %8.6f / y[%d] = %8.6f /\n", ncgt, N, y[0], N, y[N]);

	return 0;
}
