#!/bin/sh
#QSUB -queue i18cpu
#QSUB -node 18
#QSUB -mpi 18
#QSUB -omp 24
#PBS -N Fe_relax
#PBS -j oe

PPN=18
NP=432

cd ${PBS_O_WORKDIR}

cat ${PBS_NODEFILE}

mpijob ${HOME}/espresso-5.0.3/bin/pw.x < Fe.vc-relax.in > Fe.vc-relax.out
