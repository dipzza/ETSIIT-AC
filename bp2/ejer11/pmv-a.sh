#!/bin/bash
#Todos los scripts que se hagan para atcgrid deben incluir lo siguiente:
#1. Se asigna al trabajo el nombre pmva
#PBS -N pmva
#2. Se asigna el trabajo a la cola ac
#PBS -q ac
#3. Se imprime información del trabajo usando variables de entorno de PBS
echo "Id. usuario del trabajo: $PBS_O_LOGNAME"
echo "Id.  del trabajo: $PBS_JOBID"
echo "Nombre  del trabajo especificado por usuario: $PBS_JOBNAME"
echo "Directorio en el que se ha ejecutado qsub: $PBS_O_WORKDIR"
echo "Directorio de trabajo: $PBS_JOBDIR"
echo "Cola: $PBS_QUEUE"
echo "Nodo que ejecuta qsub: $PBS_O_HOST"
echo "Nodos asignados al trabajo:"
cat $PBS_NODEFILE
# FIN del trozo que deben incluir todos los scripts

for ((N=1;N<13;N=N+1))
do
	export OMP_NUM_THREADS=$N
	./bp2/ejer11/pmv-a 10000 
	./bp2/ejer11/pmv-a 50000
done
