#!/bin/bash

if [[ $EUID -ne 0 ]]; then
	echo "sudo this."
	exit 1
fi

in_folder="../OS_PJ1_Test"

dmesg -C

for i in TIME_MEASUREMENT FIFO_1 PSJF_2 RR_3 SJF_4;
do
	echo Demoing $i ...
	echo ""
	../main < $in_folder/$i.txt
	echo ""
	echo Deleting previous dmesg ...
	echo ""
	echo show $i dmesg ...
	dmesg -c | grep Project1
	echo ""
done
	echo done! 

