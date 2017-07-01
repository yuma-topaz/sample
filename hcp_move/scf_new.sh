#!/bin/sh
#QSUB -queue i18cpu
#QSUB -node 18
#QSUB -mpi 18
#QSUB -omp 24
#PBS -N Fe_scf
#PBS -j oe

cd ${PBS_O_WORKDIR}

cat ${PBS_NODEFILE}

mpijob ${HOME}/espresso-5.0.3/bin/pw.x < Fe.scf.in > Fe.scf.out
