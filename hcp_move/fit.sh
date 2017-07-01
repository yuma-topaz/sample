#!/bin/sh
#PBS -N Fe
#PBS -q A-2
#PBS -j oe
#PBS -l nodes=1:ppn=16


ulimit -s unlimited

PPN=16
NP=16

#***********************************************************************************
NODELIST=`cat ${PBS_NODEFILE} | sort | uniq`
for node in ${NODELIST}
do
    FLAG_MPDPY=`ssh ${node} /bin/ps ux | /bin/grep python | /bin/grep mpd.py`

    if [ -n "${FLAG_MPDPY}" ]; then
	echo "mpd.py is already running on host" ${node}

	ssh ${node} mpdallexit
	FLAG_MPDPY=`ssh ${node} /bin/ps ux | /bin/grep python | /bin/grep mpd.py`
	if [ -z "${FLAG_MPDPY}" ]; then
	    echo "mpd.py on node" ${node} "was successfully killed."
	else 
	    echo "could not terminate mpd.py on node" ${node} 
	fi
    fi
done
#***********************************************************************************

cd ${PBS_O_WORKDIR}

cat ${PBS_NODEFILE}

mpdboot -n 1 -f ${PBS_NODEFILE}


mpiexec -ppn ${PPN} -np ${NP} ${HOME}/espresso-5.4.0/bin/pw.x < Fe.scf.fit.in > Fe.scf.fit.out
