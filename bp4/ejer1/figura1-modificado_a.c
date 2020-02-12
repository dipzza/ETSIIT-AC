#include <time.h>
#include <stdio.h>

struct 
{
	int a;
	int b;
} s[5000];

int X1, X2, R[40000];

int main()
{
	struct timespec cgt1,cgt2; 
	double ncgt;
	int i, ii;
	
	for (i=0; i<5000; ++i)
	{
		s[i].a = i*0.1;
		s[i].b = i*0.1;
	}
	
	clock_gettime(CLOCK_REALTIME,&cgt1);
	
	for (ii=0; ii<40000;++ii)
	{
		X1=0; X2=0; 
		for(i=0; i<5000; i+=4)
		{
			X1+=2*s[i].a+ii;
			X1+=2*s[i+1].a+ii;
			X1+=2*s[i+2].a+ii;
			X1+=2*s[i+3].a+ii;
		}
		for(i=0; i<5000; i+=4)
		{
			X2+=3*s[i].b-ii;
			X2+=3*s[i+1].b-ii;
			X2+=3*s[i+2].a-ii;
			X2+=3*s[i+3].a-ii;
		}
		
		if (X1<X2) R[ii]=X1; else R[ii]=X2;
	}

	clock_gettime(CLOCK_REALTIME,&cgt2);
	
	ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec) + (double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));
	
	printf("Tiempo:%11.9f\t R[0] = %d, R[39999] = %d\n", ncgt, R[0], R[39999]);
}
