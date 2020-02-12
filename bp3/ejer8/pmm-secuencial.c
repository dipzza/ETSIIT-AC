#include <stdlib.h>
#include <stdio.h>
#include <time.h>

#ifdef _OPENMP
	#include <omp.h>
#else
	#define omp_get_thread_num() 0
#endif

//#define MATRIX_GLOBAL
#define MATRIX_DYNAMIC

#ifdef MATRIX_GLOBAL
#define MAX 20000
   
double m[MAX][MAX], v1[MAX], vf[MAX];
#endif
int main(int argc, char** argv)
{
	if (argc<2) 
	{	
		printf("Faltan nº columnas de la matriz\n");
		exit(-1);
	}

	unsigned int N = atoi(argv[1]);
	
	#ifdef MATRIX_GLOBAL
	if (N>MAX) N=MAX;
	#endif
	#ifdef MATRIX_DYNAMIC
	double **m1, **m2, **m3;
	
	m1 = (double**) malloc(N * sizeof(double*));
	m2 = (double**) malloc(N * sizeof(double*));
	m3 = (double**) malloc(N * sizeof(double*));
	
	for (int i=0; i<N; i++)
	{
		m1[i] = (double*)malloc(N * sizeof(double));
		m2[i] = (double*)malloc(N * sizeof(double));
		m3[i] = (double*)malloc(N * sizeof(double));
	}
	
	if ((m1 == NULL) || (m2 == NULL) || (m3 == NULL)) 
	{	
		printf("No hay suficiente espacio para reservar memoria \n");
		exit(-2);
	}
	#endif
 
	struct timespec cgt1,cgt2; 
	double ncgt;
	
	printf("Tamaño Matriz:%u x %u (%u B)\n", N, N, sizeof(unsigned int));
	//Inicializacion 
	for (int i=0; i<N; ++i){ 
		for (int j=0; j<N; ++j)
		{
			m1[i][j] = N*0.1+i*0.1;
			m2[i][j] = N*0.1+i*0.1;
		}
	} 

	//Multiplicacion
	clock_gettime(CLOCK_REALTIME,&cgt1);
	
	for (int i=0; i<N; ++i)
		for (int j=0; j<N; ++j)
			for (int k=0; k < N; ++k)
				m3[i][j] += m1[i][k] * m2[k][j];
 
	clock_gettime(CLOCK_REALTIME,&cgt2);
	
	//Salida del resultado y el tiempo de ejecucion
	ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+
       (double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

	
	printf("Tiempo:%11.9f\t / Tamaño columnas:%u\t/ m3[0] = %8.6f / / m3[%d] = %8.6f /\n", ncgt, N, m3[0][0], N-1, m3[N-1][N-1]);

	#ifdef MATRIX_DYNAMIC
		for(int i = 0; i < N; ++i)
		{
			free(m1[i]);
			free(m2[i]);
			free(m3[i]);
		}
		free(m1);
		free(m2);
		free(m3);
	#endif

	return 0;
}
