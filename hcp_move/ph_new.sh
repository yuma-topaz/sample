#!/bin/sh
#QSUB -queue F36cpu
#QSUB -node 36
#QSUB -mpi 864
#PBS -N Fe_ph
#PBS -j oe

cd ${PBS_O_WORKDIR}

cat ${PBS_NODEFILE}

mpijob ${HOME}/espresso-5.0.3/bin/ph.x -npool 36 < Fe.ph.in > Fe.ph.out
