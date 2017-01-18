#!/bin/bash

# control NFS mount points
$NFSSRV

# functions
function nfs_mount {
	awk '$3 == "nfs" {print $2}' /etc/fstab | while read name
	do
		# echo "mount $name"
		mount $name
	done
	exit 0
}

function nfs_umount {
	awk '$3 == "nfs" {print $2}' /etc/fstab | while read name
	do
		# echo "umount $name"
		umount $name
	done
	exit 0
}
#-----

task=$1

case ${task} in
	on)
		nfs_mount
	;;
	off)
		nfs_umount
	;;
	*) exit 1
	;;
esac

