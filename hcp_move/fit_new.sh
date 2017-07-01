#!/bin/sh
#QSUB -queue i18cpu
#QSUB -node 18
#QSUB -mpi 432
#PBS -N Fe_fit
#PBS -j oe

cd ${PBS_O_WORKDIR}

cat ${PBS_NODEFILE}

mpijob ${HOME}/espresso-5.0.3/bin/pw.x -npool 18 < Fe.scf.fit.in > Fe.scf.fit.out
