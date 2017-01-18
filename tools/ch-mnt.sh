#!/bin/bash

# fix NFS server names in /etc/fstab 
# sag-prd-nfs-s1 --> ntdi07
# sag-prd-nfs-s2 --> pnfs00
#
# pnfs00
# ntdi07

FSTAB=/etc/fstab

# functions
function pnfs2nfss2 {
	sed -E -i 's/^(\bpnfs00\b)(.*)?*/sag-prd-nfs-s2\2/' $FSTAB
	exit 0
}

function ntdi2nfss1 {
	sed -E -i 's/^(\bntdi07\b)(.*)?*/sag-prd-nfs-s2.sag.services\2/' $FSTAB
	exit 0
}
#-----

name=$1

case ${name} in
	ntdi07)
		ntdi2nfss1
	;;
	pnfs00)
		pnfs2nfss2
	;;
	*) exit 1
	;;
esac

