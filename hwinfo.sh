#!/bin/sh
# this script is designed to *give as much information as possible*

file=hwinfo.txt

hwinfo () {
	printf "hwinfo: collecting hardware information...\n"

	# header
	printf "Hardware Information\n" >> $file
	date >> $file

	# lscpu
	printf "\n>>>\tlscpu\n" >> $file
	lscpu >> $file

	# lsmem -a
	printf "\n>>>\tlsmem -a\n" >> $file
	lsmem -a >> $file

	# lspci -vvv
	printf "\n>>>\tlspci -vvv\n" >> $file
	lspci -vvv >> $file

	# lstopo-no-graphics -v
	printf "\n>>>\tlstopo-no-graphics -v\n" >> $file
	lstopo-no-graphics -v >> $file

	# lsusb -v
	printf "\n>>>\tlsusb -v\n" >> $file
	lsusb -v >> $file

	# dmidecode
	printf "\n>>>\tdmidecode\n" >> $file
	dmidecode >> $file

	# uname -a
	printf "\n>>>\tuname -a\n" >> $file
	uname -a >> $file

	# lsmod
	printf "\n>>>\tlsmod\n" >> $file
	lsmod >> $file
}

# check if script is run as root
if [ "$UID" -eq 0 ]
then
	if [ -f $file ]
	then
		if [ -f $file.bak ]
		then
			printf "WARNING: $file.bak exists, please press ^C within 5 seconds to cancel\n"
			sleep 5
		fi

		printf "hwinfo: $file exists, moving existing file to $file.bak\n"
		mv $file $file.bak
		
		hwinfo
	else
		hwinfo
	fi

	# create $file.sha512sum
	if [ -f $file.sha512sum ]
	then
		if [ -f $file.sha512sum.bak ]
		then
			printf "WARNING: $file.sha512sum.bak exists, please press ^C within 5 seconds to cancel\n"
			sleep 5
		fi

		printf "hwinfo: $file.sha512sum exists, moving existing file to $file.sha512sum.bak\n"
		sleep 3
		mv $file.sha512sum $file.sha512sum.bak
			
		printf "hwinfo: generating shasum...\n"
		sha512sum $file > $file.sha512sum
	else
		printf "hwinfo: generating shasum...\n"
		sha512sum $file > $file.sha512sum
	fi
else
	printf "hwinfo: please run this script as root\n"
	exit
fi
