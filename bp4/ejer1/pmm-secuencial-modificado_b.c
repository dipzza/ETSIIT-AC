#include <stdlib.h>
#include <stdio.h>
#include <time.h>

#ifdef _OPENMP
	#include <omp.h>
#else
	#define omp_get_thread_num() 0
#endif

#define MAX 11580
double m1[MAX][MAX], m2[MAX][MAX], m3[MAX][MAX];

int main(int argc, char** argv)
{
	if (argc<2) 
	{	
		printf("Faltan nº columnas de la matriz\n");
		exit(-1);
	}

	unsigned int N = atoi(argv[1]);
	if (N>MAX) N=MAX;
 
	struct timespec cgt1,cgt2; 
	double ncgt;
	
	printf("Tamaño Matriz:%u x %u (%u B)\n", N, N, sizeof(unsigned int));
	//Inicializacion 
	for (int i=0; i<N; ++i)
	{
		for (int j=0; j<N; ++j)
		{
			m1[i][j] = N*0.1+i*0.1;
			m2[i][j] = N*0.1+i*0.1;
		}
	}
	//Multiplicacion
	clock_gettime(CLOCK_REALTIME,&cgt1);
	
	for (int i=0; i<N; ++i)
		for (int k=0; k<N; ++k)
			for (int j=0; j < N; ++j)
				m3[i][j] += m1[i][k] * m2[k][j];

	clock_gettime(CLOCK_REALTIME,&cgt2);
	
	//Salida del resultado y el tiempo de ejecucion
	ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec) + (double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

	printf("Tiempo:%11.9f\t / Tamaño columnas:%u\t/ m3[0][0] = %8.6f / / m3[%d][%d] = %8.6f /\n", ncgt, N, m3[0][0], N-1, N-1, m3[N-1][N-1]);

	return 0;
}
