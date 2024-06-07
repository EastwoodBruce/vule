#!/bin/sh
[ $# -ne 2 ] && {
 echo "Usage: sh 0132.sh <SU用户(SU或高权限用户)> <SU密码>";
 exit 1;
}

cdir=`pwd`

echo "touch /tmp/dassec_tmp;">/tmp/DAS{dastmp}_dassec_grub_tmp
echo "chmod 777 /tmp/dassec_tmp;">>/tmp/DAS{dastmp}_dassec_grub_tmp
echo "if [ -f \"/etc/grub.conf\" ];then">>/tmp/DAS{dastmp}_dassec_grub_tmp
echo "    grub_mod=\`ls -l /etc/grub.conf | grep 'l[r-][w-][x-]'\`;">>/tmp/DAS{dastmp}_dassec_grub_tmp
echo "    if [ -z \"\$grub_mod\" ];then">>/tmp/DAS{dastmp}_dassec_grub_tmp
echo "        grub_mod=\`ls -l /etc/grub.conf\`;">>/tmp/DAS{dastmp}_dassec_grub_tmp
echo "        chmod --reference=/etc/grub.conf /tmp/dassec_tmp;">>/tmp/DAS{dastmp}_dassec_grub_tmp
echo "    else">>/tmp/DAS{dastmp}_dassec_grub_tmp
echo "        grub_mod=\`ls -l /boot/grub/grub.conf\`;">>/tmp/DAS{dastmp}_dassec_grub_tmp
echo "        chmod --reference=/boot/grub/grub.conf /tmp/dassec_tmp;">>/tmp/DAS{dastmp}_dassec_grub_tmp
echo "    fi">>/tmp/DAS{dastmp}_dassec_grub_tmp
echo "elif [ -f \"/boot/grub/grub.conf\" ];then">>/tmp/DAS{dastmp}_dassec_grub_tmp
echo "    grub_mod=\`ls -l /boot/grub/grub.conf\`;">>/tmp/DAS{dastmp}_dassec_grub_tmp
echo "    chmod --reference=/boot/grub/grub.conf /tmp/dassec_tmp;">>/tmp/DAS{dastmp}_dassec_grub_tmp
echo "elif [ -f \"/etc/lilo.conf\" ];then">>/tmp/DAS{dastmp}_dassec_grub_tmp
echo "    grub_mod=\`ls -l /etc/lilo.conf\`;">>/tmp/DAS{dastmp}_dassec_grub_tmp
echo "    chmod --reference=/etc/lilo.conf /tmp/dassec_tmp;">>/tmp/DAS{dastmp}_dassec_grub_tmp
echo "elif [ -f \"/etc/grub2.cfg\" ];then">>/tmp/DAS{dastmp}_dassec_grub_tmp
echo "    grub_mod=\`ls -l /etc/grub2.cfg | grep 'l[r-][w-][x-]'\`;">>/tmp/DAS{dastmp}_dassec_grub_tmp
echo "    if [ -z \"\$grub_mod\" ];then">>/tmp/DAS{dastmp}_dassec_grub_tmp
echo "        grub_mod=\`ls -l /etc/grub2.cfg\`;">>/tmp/DAS{dastmp}_dassec_grub_tmp
echo "        chmod --reference=/etc/grub2.cfg /tmp/dassec_tmp;">>/tmp/DAS{dastmp}_dassec_grub_tmp
echo "    else">>/tmp/DAS{dastmp}_dassec_grub_tmp
echo "        grub_mod=\`ls -l /boot/grub2/grub.cfg\`;">>/tmp/DAS{dastmp}_dassec_grub_tmp
echo "        chmod --reference=/boot/grub2/grub.cfg /tmp/dassec_tmp;">>/tmp/DAS{dastmp}_dassec_grub_tmp
echo "    fi">>/tmp/DAS{dastmp}_dassec_grub_tmp
echo "fi">>/tmp/DAS{dastmp}_dassec_grub_tmp
sh /tmp/DAS{dastmp}_dassec_grub_tmp

# 执行pl脚本
perl $cdir/0132.pl "${1}" "${2}"
