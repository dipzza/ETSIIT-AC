#!/bin/bash
#Todos los scripts que se hagan para atcgrid deben incluir lo siguiente:
#1. Se asigna al trabajo el nombre sumavectores
#PBS -N sumasecuencial
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

#para N potencia de 2 desde 2^16 a 2^26
for ((N=16384;N<67108865;N=N*2))
do
	time ./bp1/ejer10/sumasecuencial $N
done
