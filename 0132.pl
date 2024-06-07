#!env perl
my $para_num = "2";
my $tpl_tid="0132";
my %para;
@checkpoints = ();
@appendixes = ();

$para{Linux_su_user} = $ARGV[0];
$para{Linux_su_password} = $ARGV[1];

# 检查项/点

$cmd{1} = "file=\"/etc/login.defs\";if [ -s \${file} ];then ret=`cat \${file} | grep -v \"#\" | grep PASS_MAX_DAYS | awk -F ' ' '{print \$2}'`;fi
if [ 0 -ne \$ret  -a  90 -ge \$ret ];then echo \"PASS_MAX_DAYS ok\";else echo \"PASS_MAX_DAYS  fail\";fi";
$cmd{2} = "cat /etc/login.defs";
$cmd{3} = "cat /etc/login.defs";
$cmd{4} = "cat /etc/pam.d/system-auth";
$cmd{5} = "cat /etc/login.defs";
$cmd{6} = "if [ -s /etc/pam.d/system-auth ];then cat /etc/pam.d/system-auth|grep -v \"^[[:space:]]*#\";elif [ -s /etc/pam.d/common-password ];then cat /etc/pam.d/common-password|grep -v \"^[[:space:]]*#\";elif [ -s /etc/pam.d/passwd ];then cat /etc/pam.d/passwd | grep -v \"^[[:space:]]*#\";fi";
$cmd{7} = "if [ -s /etc/pam.d/system-auth ];then cat /etc/pam.d/system-auth|grep -v \"^[[:space:]]*#\";elif [ -s /etc/pam.d/common-password ];then cat /etc/pam.d/common-password|grep -v \"^[[:space:]]*#\";elif [ -s /etc/pam.d/passwd ];then cat /etc/pam.d/passwd | grep -v \"^[[:space:]]*#\";fi";
$cmd{8} = "if [ -s /etc/pam.d/system-auth ];then cat /etc/pam.d/system-auth|grep -v \"^[[:space:]]*#\";elif [ -s /etc/pam.d/common-password ];then cat /etc/pam.d/common-password|grep -v \"^[[:space:]]*#\";elif [ -s /etc/pam.d/passwd ];then cat /etc/pam.d/passwd | grep -v \"^[[:space:]]*#\";fi";
$cmd{9} = "if [ -s /etc/pam.d/system-auth ];then cat /etc/pam.d/system-auth|grep -v \"\\s*#\";elif [ -s /etc/pam.d/common-password ];then cat /etc/pam.d/common-password|grep -v \"\\s*#\";elif [ -s /etc/pam.d/passwd ];then cat /etc/pam.d/passwd | grep -v \"\\s*#\";fi";
$cmd{10} = "if [ -s /etc/pam.d/system-auth ];then red_ret=`cat /etc/pam.d/system-auth | grep -v \"^[[:space:]]*#\" | grep \"[[:space:]]*password[[:space:]]*sufficient[[:space:]]*.*remember.*\"`;fi
if [ -s /etc/pam.d/common-password ];then suse_ret=`cat /etc/pam.d/common-password | grep -v \"^[[:space:]]*#\" | grep \"[[:space:]]*password[[:space:]]*sufficient[[:space:]]*.*remember.*\"`;fi
if [ -s /etc/pam.d/passwd ];then suse_ret2=`cat /etc/pam.d/passwd | grep -v \"^[[:space:]]*#\" | grep \"[[:space:]]*password[[:space:]]*sufficient[[:space:]]*pam_unix.so[[:space:]]*md5[[:space:]]*shadow[[:space:]]*nullok[[:space:]]*try_first_pass[[:space:]]*use_authtok[[:space:]]*\" | grep \"remember=5\"`;fi
if [ -n \"\$red_ret\" ];then echo \"redhat:valid\";elif [ -n \"\$suse_ret\" ]; then echo \"suse:valid\";elif [ -n \"\$suse_ret2\" ];then echo \"suse2:valid\";else echo \"ret:invalid\";fi";
$cmd{11} = "ssh_banner=`cat /etc/ssh/sshd_config | grep -v '^[[:space:]]*#' | grep Banner|awk '{print \$2}'`;
ssh_status=`netstat -antp|grep -i listen|grep \":22\\>\"|wc -l`;
if [[ \$ssh_status != 0 && -s \$ssh_banner ]];then echo \"sshd is running.sshd banner is not null.sshd banner check result:true\";elif [[ \$ssh_status != 0 ]];then echo \"sshd is running.sshd banner is null.sshd banner check result:false\";else echo \"sshd is not running.sshd banner check result:true\";fi;unset ssh_banner ssh_status";
$cmd{12} = "up_uidmin=`(grep -v ^# /etc/login.defs |grep \"^UID_MIN\"|awk '{print \$2}')`;
up_uidmax=`(grep -v ^# /etc/login.defs |grep \"^UID_MAX\"|awk '{print \$2}')`;
echo \"UIDMIN=\"\$up_uidmin;
echo \"UIDMAX=\"\$up_uidmax;
egrep -v \"oracle|sybase|postgres\" /etc/passwd | awk -F: '(\$3>='\$up_uidmin' && \$3<='\$up_uidmax') {print \$1\":\"\$3}';
echo \"result=\"`egrep -v \"oracle|sybase|postgres\" /etc/passwd|awk -F: '(\$3>='\$up_uidmin' && \$3<='\$up_uidmax') {print \$1\":\"\$3}'|wc -l`;unset up_uidmin up_uidmax";
$cmd{13} = "if [ -s /etc/lilo.conf ];then cat /etc/lilo.conf | grep -v \"^[[:space:]]#\" | grep \"password\";fi";
$cmd{14} = "if [ -s /boot/grub/menu.lst ];then echo  '1';else echo '0';fi";
$cmd{15} = "cat /boot/grub/menu.lst";
$cmd{16} = "if [ -s /etc/lilo.conf ];then echo  '1';else echo '0';fi";
$cmd{17} = "ssh_status=`netstat -antp|grep -i listen|grep \":22\\>\"|wc -l`;
if [[ \$ssh_status != 0 && -f /etc/motd ]];then echo \"sshd is running,banner is not null,check result:true\";elif [ \$ssh_status ];then echo \"sshd is running,banner is null,check result:false\";elif [ -f /etc/motd ];then echo \"sshd is not running,banner is not null,check result:true\";else echo \"sshd is not running,banner is null,check result:true\";fi;unset ssh_status";
$cmd{18} = "if [ -f /etc/rsyslog.conf ];then cat /etc/rsyslog.conf | grep -v \"^[[:space:]]*#\" | grep -E '[[:space:]]*.+@.+';fi";
$cmd{19} = "if [ -s /etc/syslog-ng/syslog-ng.conf ];then ret_1=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"port(514)\"`;if [ -n \"\$ret_1\" ];then ret_2=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"destination(logserver)\"`;fi;fi
if [ -n \"\$ret_2\" ];then echo \"ret:set\";else echo \"ret:none\";fi";
$cmd{20} = "if [ -f /etc/syslog.conf ];then cat /etc/syslog.conf | grep -v \"^[[:space:]]*#\" | grep -E '[[:space:]]*.+@.+';fi";
$cmd{21} = "redhat_count=0;
suse_count=0;
result=0;
telnet_status=`netstat -antp|grep -i listen|grep -c \":23\\>\"`;
if [[ \$telnet_status != 0 && -s /etc/issue ]];then cat /etc/issue;redhat_count=`cat /etc/issue | grep \"Red Hat Enterprise\" | wc -l`;suse_count=`cat /etc/issue | grep \"Red Hat Enterprise\" | wc -l`;fi;
if [[ \$redhat_count == 1 || \$suse_count == 1 ]];then result=1;fi; 
if [[ \$telnet_status != 0 && -s /etc/issue.net ]];then cat /etc/issue.net;redhat_count=`cat /etc/issue.net | grep \"Red Hat Enterprise\" | wc -l`;suse_count=`cat /etc/issue.net | grep \"Red Hat Enterprise\" | wc -l`;fi;
if [[ \$redhat_count == 1 || \$suse_count == 1 ]];then result=1;fi;
if [[ \$result == 1 && \$telnet_status == 1 ]];then echo \"telnet is running.telnet banner is not valid.telnet banner check result:false\";elif [ \$result == 1 ];then echo \"telnet is not running.telnet banner is not valid.telnet banner check result:true\";elif [ \$telnet_status == 1 ]; then echo \"telnet is running.telnet banner is valid.telnet banner check result:true\";else echo \"telnet is not running.telnet banner is valid.telnet banner check result:true\";fi;unset redhat_count suse_count result ftp_status;";
$cmd{22} = "GID_MIN=`grep -v \"^[[:space:]]*#\" /etc/login.defs | grep \"^GID_MIN\" | awk '{print \$2}'`;GID_MAX=`grep -v \"^[[:space:]]*#\" /etc/login.defs | grep \"^GID_MAX\" | awk '{print \$2}'`;echo \"GID_MIN=\"\$GID_MIN;echo \"GID_MAX=\"\$GID_MAX;echo \"result:\"`egrep -v \"oracle|sybase|postgres\" /etc/passwd | awk -F: '(\$4<='\$GID_MAX' && \$4>='\$GID_MIN'){print \$4}' | wc -l`;";
$cmd{23} = "if [ -s /etc/pam.d/sshd ];then ret1=`cat /etc/pam.d/sshd  | grep -v \"^[[:space:]]*#\" | grep \"auth[[:space:]]*required[[:space:]]*pam_tally[2]\\?.so[[:space:]]*.*deny=[0-9]*[[:space:]]*.*unlock_time=[0-9]*\"`;fi
if [ -s /etc/pam.d/sshd ];then ret2=`cat /etc/pam.d/sshd  | grep -v \"^[[:space:]]*#\" | grep \"account[[:space:]]*required[[:space:]]*pam_tally[2]\\?.so\"`;fi
if [[ -n \"\$ret1\" && -n \"\$ret2\" ]];then echo \"result:valid\";else echo \"result:invalue\";fi";
$cmd{24} = "if [ -s /etc/pam.d/system-auth ];then red_ret=`cat /etc/pam.d/system-auth | grep -v \"^[[:space:]]*#\" | grep \"auth[[:space:]]*required[[:space:]]*pam_tally[0-9]*.so[[:space:]]*.*deny=[0-9]*[[:space:]]*.*unlock_time=[0-9]*\"`;fi
if [ -s /etc/pam.d/system-auth ];then red_ret2=`cat /etc/pam.d/system-auth | grep -v \"^[[:space:]]*#\" | grep \"account[[:space:]]*required[[:space:]]*pam_tally[0-9]*.so\"`;fi
if [ -s /etc/pam.d/common-auth ];then suse_ret=`cat /etc/pam.d/common-auth | grep -v \"^[[:space:]]*#\" | grep \"auth[[:space:]]*required[[:space:]]*pam_tally.so[[:space:]]*.*deny=[0-9]*[[:space:]]*.*unlock_time=[0-9]*\"`;fi
if [ -s /etc/pam.d/common-account ];then suse_ret2=`cat /etc/pam.d/common-account | grep -v \"^[[:space:]]*#\" | grep \"account[[:space:]]*required[[:space:]]*pam_tally.so\"`;fi
if [ -s /etc/pam.d/passwd ];then suse_ret3=`cat /etc/pam.d/passwd | grep -v \"^[[:space:]]*#\" | grep \"auth[[:space:]]*required[[:space:]]*pam_tally.so[[:space:]]*.*deny=[0-9]*[[:space:]]*.*unlock_time=[0-9]*\"`;fi
if [ -s /etc/pam.d/passwd ];then suse_ret4=`cat /etc/pam.d/passwd | grep -v \"^[[:space:]]*#\" | grep \"account[[:space:]]*required[[:space:]]*pam_tally.so\"`;fi
if [[ -n \"\$red_ret\" && -n \"\$red_ret2\" ]];then echo \"redhat:valid\";elif [[ -n \"\$suse_ret\" && -n \"\$suse_ret2\" ]];then echo \"suse:valid\";elif [[ -n \"\$suse_ret3\" && -n \"suse_ret4\" ]];then echo \"suse2:valid\";else echo \"ret:not value\";fi";
$cmd{25} = "if [ -s /etc/vsftpd.conf ];then ret=`cat /etc/vsftpd.conf | grep -v \"^[[:space:]]*#\" | grep \"anonymous_enable=NO\"`;elif [ -s /etc/vsftpd/vsftpd.conf ]; then ret=`cat /etc/vsftpd/vsftpd.conf | grep -v \"^[[:space:]]*#\" | grep \"anonymous_enable=NO\"`;else ret=\"result-true\";fi;if [ -n \"\$ret\" ];then echo \"result-true\";else echo \"result-false\";fi";
$cmd{26} = "wu_status=`rpm -q wu-ftpd 2>/dev/null | grep \"^wu-ftpd\"`;
wu_status2=`netstat -antp|grep -i \"listen\"|grep -c \":21\\>\"`;
if [ -n \"\$wu_status\" ];then if [ -n \"\$wu_status2\" ];then if (cat /etc/passwd| grep \"^[[:space:]]*[^#]\" | grep \"^[[:space:]]*ftp\");then echo \"wu-ftp:invalid\";else \"wu-ftp:valid\";fi;else echo \"wu-ftpd:valid\";fi;else echo \"wu-ftpd:valid\";fi";
$cmd{27} = "cat /etc/profile | grep -v \"^[[:space:]]*#\" | grep \"TMOUT[[:space:]]*=[[:space:]]*[0-9]*\" | grep -v \"export\" | sed 's/[^0-9]//g'
cat /etc/profile | grep -v \"^[[:space:]]*#\" | grep \"export[[:space:]]*TMOUT[[:space:]]*=[[:space:]]*[0-9]*\" | sed 's/[^0-9]//g'";
$cmd{28} = "telnet_info=`rpm -qa |grep telnet`;if [ -z \"\$telnet_info\" ]; then echo disable = yes;else cat /etc/xinetd.d/telnet 2>/dev/null | grep disable || echo disable = yes;fi;";
$cmd{29} = "ps -ef | grep ssh";
$cmd{30} = "cat /etc/ssh/sshd_config";
$cmd{31} = "tmp_result1=`cat /etc/pam.d/login |grep -v \"^[[:space:]]*#\" |egrep \"^[[:space:]]*auth[[:space:]]*required[[:space:]]*pam_securetty.so[[:space:]]*\$\"`
tmp_result2=`cat /etc/pam.d/login |grep -v \"^[[:space:]]*#\" |egrep \"^[[:space:]]*auth[[:space:]]*\\[[[:space:]]*user_unknown[[:space:]]*=[[:space:]]*ignore[[:space:]]*success[[:space:]]*=[[:space:]]*ok[[:space:]]*ignore[[:space:]]*=ignore[[:space:]]*default[[:space:]]*=[[:space:]]*bad[[:space:]]*\\][[:space:]]*pam_securetty.so[[:space:]]*\$\"`
if [ -n \"\${tmp_result1}\" -o -n \"\${tmp_result2}\" ];then echo \"true\";else echo \"false\";fi;";
$cmd{32} = "if [ -s /etc/vsftpd/ftpusers ];then ret=`cat /etc/vsftpd/ftpusers | grep -v \"^[[:space:]]*#\" | grep \"\\broot\\b\"`;elif [ -s /etc/ftpusers ];then ret=`cat /etc/ftpusers | grep -v \"^[[:space:]]*#\" | grep \"\\broot\\b\"`;else ret=\"vsftpd valid\";fi;if [ -n \"\$ret\" ];then echo \"vsftpd valid\";else echo \"vsftpd invalid\";fi";
$cmd{33} = "wu_status=`rpm -q wu-ftpd 2>/dev/null | grep \"^wu-ftpd\"`;
wu_status2=`netstat -antp|grep -i \"listen\"|grep -c \":21\\>\"`;
if [ -n \"\$wu_status\" ];then if [ -n \"\$wu_status2\" ];then if (cat /etc/ftpusers 2>/dev/null | grep \"^[[:space:]]*[^#]\" | grep \"\\broot\\b\");then echo \"wu-ftp:valid\";else \"wu-ftp:invalid\";fi;else echo \"wu-ftpd:valid\";fi;else echo \"wu-ftpd:valid\";fi";
$cmd{34} = "cat /etc/security/limits.conf";
$cmd{35} = "cat /etc/security/limits.conf";
$cmd{36} = "cat /etc/inittab";
$cmd{37} = "unset ret_1 ret_2;
if [ -f /etc/ssh/sshd_config ];then ret_1=`cat /etc/ssh/sshd_config | grep -v \"^[[:space:]]*#\" | grep \"Protocol\" | grep \"1\"`;if [ -z \"\$ret_1\" ];then ret_2=`cat /etc/ssh/sshd_config | grep -v \"^[[:space:]]*#\" | grep \"PermitRootLogin\" | grep -E \"no|NO\"`;if [ -n \"\$ret_2\" ];then echo \"ret:valid\";else echo \"ret:PermitRootLogin invalid\";fi;else echo \"ret:Protocol invalid\";fi;elif [ -f /etc/ssh2/sshd2_config ];then ret_1=`cat /etc/ssh/sshd_config | grep -v \"^[[:space:]]*#\" | grep \"Protocol\" | grep \"1\"`;if [ -z \"\$ret_1\" ];then ret_2=`cat /etc/ssh/sshd_config | grep -v \"^[[:space:]]*#\" | grep \"PermitRootLogin\" | grep -E \"no|NO\"`;if [ -n \"\$ret_2\" ];then echo \"ret:valid\";else echo \"ret:PermitRootLogin invalid\";fi;else echo \"ret:Protocol invalid\";fi;else echo \"ret:valid\";fi;unset ret_1 ret_2;";
$cmd{38} = "ls -al /etc/passwd";
$cmd{39} = "ls -al /etc/shadow";
$cmd{40} = "ls -al /etc/group";
$cmd{41} = "df -k";
$cmd{42} = "cat /etc/hosts.allow | awk '{FS=\":\";ORS=\" \"}{if(\$1~/^[[:space:]]*[^#]/)print \$3}'";
$cmd{43} = "cat /etc/hosts.deny";
$cmd{44} = "gsettings get org.gnome.desktop.screensaver lock-delay 2>/dev/null";
$cmd{45} = "gconftool-2 -g /apps/gnome-screensaver/mode 2>/dev/null";
$cmd{46} = "gsettings get org.gnome.desktop.screensaver idle-activation-enabled 2>/dev/null";
$cmd{47} = "gsettings get org.gnome.desktop.screensaver lock-enabled 2>/dev/null";
$cmd{48} = "gconftool-2 -g /apps/gnome-screensaver/idle_activation_enabled 2>/dev/null";
$cmd{49} = "gconftool-2 -g /apps/gnome-screensaver/lock_enabled 2>/dev/null";
$cmd{50} = "gconftool-2 -g /apps/gnome-screensaver/idle_delay 2>/dev/null";
$cmd{51} = "gsettings get org.gnome.desktop.session idle-delay 2>/dev/null";
$cmd{52} = "cat /etc/shadow | awk 'BEGIN{FS=\":\";ORS=\",\"}{if(\$2==\"\")print \$1};' | more";
$cmd{53} = "cat /etc/login.defs | grep -v \"^[[:space:]]*#\" | grep -i \"^[[:space:]]*umask\"";
$cmd{54} = "find / -maxdepth 3 -type f -name .rhosts 2>/dev/null | grep -v -c -i \"find[[:space:]]*:\"";
$cmd{55} = "find / -maxdepth 2 -type f -name hosts.equiv 2>/dev/null| grep -v -c -i \"find[[:space:]]*:\"";
$cmd{56} = "(cat /etc/pam.d/su | grep pam_rootok | grep \"^[[:space:]]*[^#]\";cat /etc/pam.d/su | grep pam_wheel.so | grep \"^[[:space:]]*[^#]\") | awk '{ORS=\",\"}{print \$0}'";
$cmd{57} = "find / -maxdepth 3 -name .rhosts 2>/dev/null";
$cmd{58} = "find / -maxdepth 3 -name .netrc 2>/dev/null";
$cmd{59} = "find / -maxdepth 3 -name hosts.equiv 2>/dev/null";
$cmd{60} = "unset num;
unset filename;
if [ -s /etc/profile ];then filename=/etc/profile;fi;
function checkusrumask(){ if [ -f \$filename ];then num=`cat \$filename |grep -v \"^[[:space:]]*#\" |grep umask|wc -l`;if [ \$num -gt 0 ];then cat \$filename |grep -v \"^[[:space:]]*#\" |grep umask | while read line;do myvar=`echo \$line|awk '{print \$2}'`;if [[ \"\$myvar\" != 077 ]];then echo \"false-substandered\";fi;done;else echo \"false-not configured\";fi;fi; };
if [ -n \"\$filename\" ];then checkusrumask;else echo \"false-not configured\";fi;unset num; unset filename";
$cmd{61} = "unset num;
unset filename;
if [ -s /etc/csh.cshrc ];then filename=/etc/csh.cshrc;fi;
function checkusrumask(){ if [ -f \$filename ];then num=`cat \$filename |grep -v \"^[[:space:]]*#\" |grep umask|wc -l`;if [ \$num -gt 0 ];then cat \$filename |grep -v \"^[[:space:]]*#\" |grep umask | while read line;do myvar=`echo \$line|awk '{print \$2}'`;if [[ \"\$myvar\" != 077 ]];then echo \"false-substandered\";fi;done;else echo \"false-not configured\";fi;fi; };
if [ -n \"\$filename\" ];then checkusrumask;else echo \"false-not configured\";fi;unset num; unset filename";
$cmd{62} = "unset num;
unset filename;
if [ -s /etc/csh.login ];then filename=/etc/csh.login;fi;
function checkusrumask(){ if [ -f \$filename ];then num=`cat \$filename |grep -v \"^[[:space:]]*#\" |grep umask|wc -l`;if [ \$num -gt 0 ];then cat \$filename |grep -v \"^[[:space:]]*#\" |grep umask | while read line;do myvar=`echo \$line|awk '{print \$2}'`;if [[ \"\$myvar\" != 077 ]];then echo \"false-substandered\";fi;done;else echo \"false-not configured\";fi;fi; };
if [ -n \"\$filename\" ];then checkusrumask;else echo \"false-not configured\";fi;unset num; unset filename";
$cmd{63} = "unset num;
unset filename;
if [ -s /etc/bashrc ];then filename=/etc/bashrc;elif [ -s /etc/bash.bashrc ];then filename=/etc/bash.bashrc;fi;
function checkusrumask(){ if [ -f \$filename ];then num=`cat \$filename |grep -v \"^[[:space:]]*#\" |grep umask|wc -l`;if [ \$num -gt 0 ];then cat \$filename |grep -v \"^[[:space:]]*#\" |grep umask | while read line;do myvar=`echo \$line|awk '{print \$2}'`;if [[ \"\$myvar\" != 077 ]];then echo \"false-substandered\";fi;done;else echo \"false-not configured\";fi;fi; };
if [ -n \"\$filename\" ];then checkusrumask;else echo \"false-not configured\";fi;unset num; unset filename";
$cmd{64} = "if [ -s /etc/gshadow ];then lsattr /etc/gshadow;else echo \"----i---------- \\etc\\gshadow\";fi";
$cmd{65} = "lsattr /etc/passwd";
$cmd{66} = "lsattr /etc/shadow";
$cmd{67} = "lsattr /etc/group";
$cmd{68} = "echo \$PATH";
$cmd{69} = "cat /etc/passwd | awk 'BEGIN{FS=\":\";ORS=\",\"}{if(\$1~/^[[:space:]]*[^#]/)if(\$1!=\"root\")if(\$3==\"0\")print \$1}'";
$cmd{70} = "ls -al /etc/rc.d/init.d/";
$cmd{71} = "ls -al /etc/rc3.d/";
$cmd{72} = "ls -al /etc/rc6.d/";
$cmd{73} = "ls -al /tmp/dassec_tmp";
$cmd{74} = "if [ -f /etc/xinetd.conf ];then stat -c %a  /etc/xinetd.conf ;elif [ -f /etc/inetd.conf ];then stat -c %a /etc/inetd.conf;fi";
$cmd{75} = "ls -al /etc/rc5.d/";
$cmd{76} = "ls -al /etc/rc1.d/";
$cmd{77} = "ls -al /etc/security";
$cmd{78} = "ls -al /etc/rc4.d/";
$cmd{79} = "ls -al /etc/passwd";
$cmd{80} = "ls -al /etc/rc0.d/";
$cmd{81} = "ls -al /etc/services";
$cmd{82} = "ls -al /etc/rc2.d/";
$cmd{83} = "ls -al /etc/group";
$cmd{84} = "ls -al /tmp";
$cmd{85} = "ls -al /etc/shadow";
$cmd{86} = "cat /etc/snmp/snmpd.conf 2>/dev/null | grep -v \"^[[:space:]]*#\" | grep -c \"[[:space:]]*public[[:space:]]*\"";
$cmd{87} = "if [ -f /etc/snmp/snmpd.conf ];then echo \"yes\";else echo \"no\";fi";
$cmd{88} = "if [ -f /etc/snmp/snmpd.conf ];then echo \"yes\";else echo \"no\";fi";
$cmd{89} = "cat /etc/snmp/snmpd.conf  2>/dev/null | grep -v \"^[[:space:]]*#\" | grep -c \"[[:space:]]*private[[:space:]]*\"";
$cmd{90} = "#!/bin/bash
FTPSTATUS=`netstat -antp|grep -i \"listen\"|grep \":21\\>\"|wc -l`;
function Check_vsftpd(){ if [ -f /etc/vsftpd.conf ];then FTPCONF=\"/etc/vsftpd.conf\";elif [ -f /etc/vsftpd/vsftpd.conf ];then FTPCONF=\"/etc/vsftpd/vsftpd.conf\";fi;echo +++++++++vsftpd.conf+++++++++++++++++;cat \$FTPCONF|egrep -v \"^[[:space:]]*#|^[[:space:]]*\$\";echo +++++++++vsftpd.conf end+++++++++++++;ls_recurse_enable=`cat \$FTPCONF|grep -v \"^[[:space:]]*#\"|grep -i \"ls_recurse_enable=YES\"|wc -l`;local_umask=`cat \$FTPCONF|grep -v \"^[[:space:]]*#\"|grep -i \"local_umask=022\"|wc -l`;anon_umask=`cat \$FTPCONF|grep -v \"^[[:space:]]*#\"|grep -i \"anon_umask=022\"|wc -l`;VSFTPD_NO=\$(expr \$ls_recurse_enable + \$local_umask + \$anon_umask);if [ \$VSFTPD_NO -eq 3 ];then  echo \"vsftpd is running.\$FTPCONF is recommended.FTP check result:true\";else  echo \"vsftpd is running.\$FTPCONF is not recommended.FTP check result:false\";fi;unset FTPCONF VSFTPD_NO ls_recurse_enable local_umask anon_umask; }
function Check_pureftpd(){ echo +++++++++pure-ftpd.conf+++++++++++++++++;cat /etc/pure-ftpd/pure-ftpd.conf|egrep -v \"^[[:space:]]*#|^[[:space:]]*\$\";echo +++++++++pure-ftpd.conf end+++++++++++++;if [ `cat /etc/pure-ftpd/pure-ftpd.conf|grep -v \"^[[:space:]]*#\"|grep -i \"Umask\"|grep -i \"177:077\"|wc -l` == 1 ];then echo \"pure-ftpd is running.pure-ftpd.conf is recommended.FTP check result:true\";else echo \"pure-ftpd is running.pure-ftpd.conf is not recommended.FTP check result:false\";fi; }
if [ \$FTPSTATUS = 0 ];then echo \"FTP is not running.FTP check result:true.\";elif ([ `ps -ef|grep vsftpd|grep -v \"grep\"|wc -l` != 0 ]);then Check_vsftpd;elif ([ `ps -ef|grep pure-ftpd|grep -v \"grep\"|wc -l` != 0 ]);then Check_pureftpd;else echo \"ftp is running,FTP check result:true\";fi;unset FTPSTATUS;";
$cmd{91} = "LANG=c;
find /usr/bin -type f \\( -perm -04000 -o -perm -02000 \\) -exec ls -lg {} \\;
echo \"result=\"`find /usr/bin -type f \\( -perm -04000 -o -perm -02000 \\) -exec ls -lg {} \\;|wc -l`;";
$cmd{92} = "unset syslogd_status syslogng_status rsyslogd_status LOGDIR;
syslogd_status=`ps -ef |grep ' syslogd '|grep -v \"grep\"|wc -l`;
syslogng_status=`ps -ef |grep \"/syslog-ng\"|grep -v \"grep /syslog-ng\"|wc -l`;
rsyslogd_status=`ps -ef | grep \"\\/rsyslogd \" | grep -v \"grep\" |wc -l`;
if [ \$syslogd_status != 0 ];then LOGDIR=`if [ -f /etc/syslog.conf ];then cat /etc/syslog.conf| grep -v \"^[[:space:]]*#\" |sed '/^#/d' |sed '/^\$/d' |awk '((\$2!~/@/) && (\$2!~/*/) && (\$2!~/-/)) {print \$2}';fi`;ls -l \$LOGDIR 2>/dev/null | grep  \"^-\" | cut -b 5-10;elif [ \$rsyslogd_status != 0 ];then LOGDIR=`cat /etc/rsyslog.conf | grep -v \"^[[:space:]]*#\" |sed '/^#/d' |sed '/^\$/d' |awk '((\$2!~/@/) && (\$2!~/*/) && (\$2!~/-/)) {print \$2}'`;ls -l \$LOGDIR 2>/dev/null | grep \"^-\" | cut -b 5-10;elif [[ \$syslogng_status != 0 ]];then LOGDIR=`cat /etc/syslog-ng/syslog-ng.conf|grep -v \"^[[:space:]]*#\"|grep \"^destination\"|grep file|cut -d\\\" -f2`;ls -l \$LOGDIR 2>/dev/null | grep \"^-\" | cut -b 5-10;else echo \"syslog is not running.\";fi;unset syslogd_status syslogng_status rsyslogd_status LOGDIR;";
$cmd{93} = "#!/bin/bash
FTPSTATUS=`netstat -antp|grep -i \"listen\"|grep \":21\\>\"|wc -l`
function Check_vsftpd(){ if [ -f /etc/vsftpd.conf ];then FTPCONF=\"/etc/vsftpd.conf\";elif [ -f /etc/vsftpd/vsftpd.conf ];then FTPCONF=\"/etc/vsftpd/vsftpd.conf\";fi;cat \$FTPCONF|egrep -v \"^[[:space:]]*#|^[[:space:]]*\$\";if [ `grep -v \"^[[:space:]]*#\" \$FTPCONF|grep -i \"chroot_local_user=YES\"|wc -l` -eq 1 ];then  echo \"vsftpd is running.\$FTPCONF is recommended.FTP check result:true.\";else  echo \"vsftpd is running.\$FTPCONF is not recommended.FTP check result:false.\";fi;unset FTPCONF; }
function Check_pureftpd(){ cat /etc/pure-ftpd/pure-ftpd.conf|egrep -v \"^[[:space:]]*#|^[[:space:]]*\$\";ChrootEveryone=`cat /etc/pure-ftpd/pure-ftpd.conf|grep -v \"^[[:space:]]*#\"|grep -i \"ChrootEveryone\"|grep -i \"yes\"|wc -l`;AllowUserFXP=`cat /etc/pure-ftpd/pure-ftpd.conf|grep -v \"^[[:space:]]*#\"|grep -i \"AllowUserFXP\"|grep -i \"no\"|wc -l`;AllowAnonymousFXP=`cat /etc/pure-ftpd/pure-ftpd.conf|grep -v \"^[[:space:]]*#\"|grep -i \"AllowAnonymousFXP\"|grep -i \"no\"|wc -l`;PUREFTPD_NO=\$(expr \$ChrootEveryone + \$AllowUserFXP + \$AllowAnonymousFXP);if [ \$PUREFTPD_NO -eq 3 ];then echo \"pure-ftpd is running.pure-ftpd.conf is recommended.FTP check result:true.\";else echo \"pure-ftpd is running.pure-ftpd.conf is not recommended.FTP check result:false.\";fi;unset ChrootEveryone AllowUserFXP AllowAnonymousFXP PUREFTPD_NO; }
if [ \$FTPSTATUS = 0 ];then  echo \"FTP is not running.FTP check result:true.\";elif ([ `ps -ef|grep vsftpd|grep -v \"grep\"|wc -l` -ne 0 ]);then Check_vsftpd;elif ([ `ps -ef|grep pure-ftpd|grep -v \"grep\"|wc -l` -ne 0 ]);then Check_pureftpd;else echo \"ftp is running,FTP check result:true\";fi;unset FTPSTATUS;";
$cmd{94} = "unset ret;
ret=`find /usr/bin/chage /usr/bin/gpasswd /usr/bin/wall /usr/bin/chfn /usr/bin/chsh /usr/bin/newgrp /usr/bin/write /usr/sbin/usernetctl /usr/sbin/traceroute /bin/mount /bin/umount /bin/ping /sbin/netreport -type f -perm +6000 2>/dev/null`;
echo \$ret;
if [ -n \"\$ret\" ];then echo \"ret:exist invalid files\";else echo \"ret:all files valid\";fi;unset ret;";
$cmd{95} = "ls -al /var/log/maillog";
$cmd{96} = "ls -al /var/log/messages";
$cmd{97} = "ls -al /var/log/localmessages";
$cmd{98} = "ls -al /var/log/spooler";
$cmd{99} = "ls -al /var/log/boot.log";
$cmd{100} = "ls -al /var/log/mail";
$cmd{101} = "ls -al /var/log/cron";
$cmd{102} = "ls -al /var/log/secure";
$cmd{103} = "if [ -f /etc/rsyslog.conf ];then cat /etc/rsyslog.conf | grep -v \"^[[:space:]]*#\" | grep \"cron\\.\\*[[:space:]]*\" | grep \"/var/log/cron\";fi";
$cmd{104} = "if [ -f /etc/syslog.conf ];then cat /etc/syslog.conf | grep -v \"^[[:space:]]*#\" | grep \"cron\\.\\*[[:space:]]*\" | grep \"/var/log/cron\";fi";
$cmd{105} = "if [ -s /etc/syslog-ng/syslog-ng.conf ];then a_i=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"filter[[:space:]]*f_cron[[:space:]]*{[[:space:]]*facility(cron);[[:space:]]*};\" | wc -l `;else a_i=1;fi
if [ -s /etc/syslog-ng/syslog-ng.conf ];then b_i=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"destination[[:space:]]*cron[[:space:]]*{[[:space:]]*file(\\\"*/var/log/cron\\\"*)[[:space:]]*;[[:space:]]*};\" | wc -l`;else b_i=1;fi
if [ -s /etc/syslog-ng/syslog-ng.conf ];then c_i=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"log[[:space:]]*{[[:space:]]*source(src);[[:space:]]*filter(f_cron);[[:space:]]*destination(cron);[[:space:]]*};\" | wc -l`;else c_i=1;fi
if [[ \"\$a_i\" -ge 1 && \"\$b_i\" -ge 1 && \"\$c_i\" -ge 1 ]];then echo \"result:true\";else echo \"result:false\";fi";
$cmd{106} = "if [ -f /etc/mail/aliases ];then awk -F: '{if(\$1~/^[[:space:]]*[^#]/)if(\$1==\"games\"||\$1==\"ingres\"||\$1==\"system\"||\$1==\"toor\"||\$1==\"uucp\"||\$1==\"manager\"||\$1==\"dumper\"||\$1==\"operator\"||\$1==\"decode\"||\$1==\"root\")flag++};END{if(flag==0)print\"ok\";else print\"no\"}' /etc/mail/aliases;fi";
$cmd{107} = "if [ -f /etc/aliases ];then awk -F: '{if(\$1~/^[[:space:]]*[^#]/)if(\$1==\"games\"||\$1==\"ingres\"||\$1==\"system\"||\$1==\"toor\"||\$1==\"uucp\"||\$1==\"manager\"||\$1==\"dumper\"||\$1==\"operator\"||\$1==\"decode\"||\$1==\"root\")flag++};END{if(flag==0)print\"ok\";else print\"no\"}' /etc/aliases 2>/dev/null;fi";
$cmd{108} = "awk -F: '{if(\$1==\"adm\"||\$1==\"lp\"||\$1==\"mail\"||\$1==\"uucp\"||\$1==\"operator\"||\$1==\"games\"||\$1==\"gopher\"||\$1==\"ftp\"||\$1==\"nobody\"||\$1==\"nobody4\"||\$1==\"noaccess\"||\$1==\"listen\"||\$1==\"webservd\"||\$1==\"rpm\"||\$1==\"dbus\"||\$1==\"avahi\"||\$1==\"mailnull\"||\$1==\"smmsp\"||\$1==\"nscd\"||\$1==\"vcsa\"||\$1==\"rpc\"||\$1==\"rpcuser\"||\$1==\"nfsnobody\"||\$1==\"sshd\"||\$1==\"pcap\"||\$1==\"ntp\"||\$1==\"haldaemon\"||\$1==\"distcache\"||\$1==\"apache\"||\$1==\"webalizer\"||\$1==\"squid\"||\$1==\"xfs\"||\$1==\"gdm\"||\$1==\"sabayon\"||\$1==\"named\"){if(\$2!=\"*\"&&\$2!~/!/)flag++}};END{if(flag==0)print \"ok\";else print \"no\"}' /etc/shadow";
$cmd{109} = "chkrootkit -q 2>/dev/null";
$cmd{110} = "if which chkrootkit>/dev/null 2>&1;then echo \"installed\";else echo \"no installed\";fi";
$cmd{111} = "last | grep \"logged\"";
$cmd{112} = "cat /etc/profile";
$cmd{113} = "cat /etc/profile | grep -v \"^[[:space:]]*#\" | grep \"HISTFILESIZE\" | awk -F= '{print \$2}'";
$cmd{114} = "unset ret;
if [ -s /etc/syslog.conf ];then ret=`cat /etc/syslog.conf | grep -v \"^[[:space:]]*#\" | grep \"\\*\\.err;kern\\.debug;daemon\\.notice[[:space:]]*\"|grep \"/var/adm/messages\"`;fi
if [ -n \"\$ret\" ];then echo \"red:valid\";else echo \"red-suse:no value\";fi";
$cmd{115} = "unset suse_ret suse_ret2 suse_ret3;
if [ -s /etc/syslog-ng/syslog-ng.conf ];then suse_ret=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"level(err) or facility(kern) and level(debug) or facility(daemon) and level(notice)\"`;if [ -n \"\$suse_ret\" ];then suse_ret2=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep 'file(\"/var/adm/msgs\")'`;if [ -n \"\$suse_ret2\" ];then suse_ret3=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"destination(msgs)\"`;fi;fi;fi;if [ -n \"\$suse_ret3\" ];then echo \"suse:valid\";else echo \"suse:no value\";fi";
$cmd{116} = "unset ret;
if [ -s /etc/rsyslog.conf ];then ret=`cat /etc/rsyslog.conf | grep -v \"^[[:space:]]*#\" | grep \"\\*\\.err;kern\\.debug;daemon\\.notice[[:space:]]*\"|grep \"/var/adm/messages\"`;fi
if [ -n \"\$ret\" ];then echo \"red:valid\";else echo \"red-suse:no value\";fi";
$cmd{117} = "(cat /var/log/pacct 1>/dev/null 2>&1 && echo exist) || echo not exist";
$cmd{118} = "unset red_ret suse_ret suse_ret2 suse_ret3;
if [ -s /etc/syslog.conf ];then red_ret=`cat /etc/syslog.conf | grep -v \"^[[:space:]]*#\" | grep \"authpriv.\\*[[:space:]]*.*\"`;fi
if [ -s /etc/rsyslog.conf ];then red_ret2=`cat /etc/rsyslog.conf | grep  -v \"^[[:space:]]*#\" | grep \"authpriv.\\*[[:space:]]*.*\"`;fi
if [ -s /etc/syslog-ng/syslog-ng.conf ];then suse_ret=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"facility(authpriv)\" | grep \"filter\" | grep \"f_secure\" | awk '{print \$2}'`;if [ -n \"\$suse_ret\" ];then suse_ret2=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"destination\" | grep \"/var/log/secure\"`; if [ -n \"\$suse_ret2\" ];then suse_ret3=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"log\" | grep \"\$suse_ret\"`;fi;fi;fi
if [ -n \"\$red_ret\" ];then echo \"redhat-suse:valid\";elif [ -n \"\$red_ret2\" ];then echo \"red-hat6:valid\";elif [ -n \"\$suse_ret3\" ];then echo \"suse:valid\";else echo \"ret:no value\";fi;unset red_ret suse_ret suse_ret2 suse_ret3;";
$cmd{119} = "chkconfig --list 2> /dev/null | grep \"^chargen\"";
$cmd{120} = "chkconfig --list 2> /dev/null | grep \"^ypbind\"";
$cmd{121} = "chkconfig --list 2> /dev/null | grep \"^tftp\"";
$cmd{122} = "chkconfig --list 2> /dev/null | grep \"^klogin\"";
$cmd{123} = "chkconfig --list 2> /dev/null | grep \"^discard\"";
$cmd{124} = "chkconfig --list 2> /dev/null | grep \"^kshell\"";
$cmd{125} = "chkconfig --list 2> /dev/null | grep \"daytime\"";
$cmd{126} = "chkconfig --list 2> /dev/null | grep \"^echo\"";
$cmd{127} = "chkconfig --list 2> /dev/null | grep \"^sendmail\"";
$cmd{128} = "chkconfig --list 2> /dev/null | grep \"^ntalk\"";
$cmd{129} = "chkconfig --list 2> /dev/null | grep \"^ident\"";
$cmd{130} = "chkconfig --list 2> /dev/null | grep \"^printer\"";
$cmd{131} = "chkconfig --list 2> /dev/null | grep \"^bootps\"";
$cmd{132} = "chkconfig --list 2> /dev/null | grep \"^time\"";
$cmd{133} = "chkconfig --list 2> /dev/null | grep \"^nfslock\"";
$cmd{134} = "chkconfig --list 2> /dev/null | grep \"^lpd\"";
$cmd{135} = "chkconfig --list 2> /dev/null | grep \"^nfs\"";
$cmd{136} = "echo \"result:\"`(sysctl -n net.ipv4.ip_forward)`";
$cmd{137} = "echo \"result:\"`(sysctl -n net.ipv4.conf.all.accept_source_route)`";
$cmd{138} = "echo \"result:\"`(sysctl -n net.ipv4.icmp_echo_ignore_broadcasts)`";
$cmd{139} = "echo \"result:\"`(sysctl -n net.ipv4.conf.all.send_redirects)`";
$cmd{140} = "echo \"result:\"`(sysctl -n net.ipv4.conf.all.accept_redirects)`";
$cmd{141} = "ret=`ps -ef | grep  nfs | grep -cv \"grep nfs\"`;
if [ \$ret -ge 1 ];then echo \"nfs:running\";else echo \"nfs:notrun\";fi";
$cmd{142} = "cat /etc/hosts.allow";
$cmd{143} = "cat /etc/host.conf";
$cmd{144} = "cat /etc/host.conf";
$cmd{145} = "if [ -f /etc/redhat-release ];then cat /etc/redhat-release;uname -a;echo \"result:yes\";elif [ -f /etc/SuSE-release ]; then cat /etc/SuSE-release;uname -a;echo \"result:yes\";fi";
$cmd{146} = "cat /proc/sys/net/ipv4/ip_forward";
$cmd{147} = "ps ax | grep -E 'chargen-dgram|daytime-stream|echo-streamklogin|tcpmux-server|chargen-stream|discard-dgram|eklogin|krb5-telnet|tftp|cvs|discard-stream|ekrb5-telnet|kshell|time-dgram|daytime-dgram|echo-dgram|gssftp|rsync|time-stream' | grep -v \"grep -E chargen-dgram|daytime-stream\"";
$cmd{148} = "if [ -f /etc/ntp.conf ];then cat /etc/ntp.conf | grep -v \"^[[:space:]]*#\" | grep 'server' | grep -v \"127.127.1.0\" | grep -v \"127.0.0.1\";fi";
$cmd{149} = "unset count status;
count=`chkconfig --list 2>/dev/null | grep -cE 'ntp|ntpd' `;
if [ \"\$count\" -ge 1 ];then status=`ps aux | grep -E 'ntp |ntpd ' | grep -cv \"grep -E ntp |ntpd \"`;if [ \"\$status\" -ge 1 ];then echo \"ntp:start\";else echo \"ntp:stop\";fi;elif [ -n \"\$count\" ];then status=`ps aux | grep -E 'ntp |ntpd ' | grep -cv \"grep -E ntp |ntpd \"`;if [ \"\$status\" -ge 2 ];then echo \"ntp:start\";else echo \"ntp:stop\";fi;else \"ntp:need install ntp service\";fi;unset count status;";

push(@checkpoints, 1);
push(@checkpoints, 2);
push(@checkpoints, 3);
push(@checkpoints, 4);
push(@checkpoints, 5);
push(@checkpoints, 6);
push(@checkpoints, 7);
push(@checkpoints, 8);
push(@checkpoints, 9);
push(@checkpoints, 10);
push(@checkpoints, 11);
push(@checkpoints, 12);
push(@checkpoints, 13);
push(@checkpoints, 14);
push(@checkpoints, 15);
push(@checkpoints, 16);
push(@checkpoints, 17);
push(@checkpoints, 18);
push(@checkpoints, 19);
push(@checkpoints, 20);
push(@checkpoints, 21);
push(@checkpoints, 22);
push(@checkpoints, 23);
push(@checkpoints, 24);
push(@checkpoints, 25);
push(@checkpoints, 26);
push(@checkpoints, 27);
push(@checkpoints, 28);
push(@checkpoints, 29);
push(@checkpoints, 30);
push(@checkpoints, 31);
push(@checkpoints, 32);
push(@checkpoints, 33);
push(@checkpoints, 34);
push(@checkpoints, 35);
push(@checkpoints, 36);
push(@checkpoints, 37);
push(@checkpoints, 38);
push(@checkpoints, 39);
push(@checkpoints, 40);
push(@checkpoints, 41);
push(@checkpoints, 42);
push(@checkpoints, 43);
push(@checkpoints, 44);
push(@checkpoints, 45);
push(@checkpoints, 46);
push(@checkpoints, 47);
push(@checkpoints, 48);
push(@checkpoints, 49);
push(@checkpoints, 50);
push(@checkpoints, 51);
push(@checkpoints, 52);
push(@checkpoints, 53);
push(@checkpoints, 54);
push(@checkpoints, 55);
push(@checkpoints, 56);
push(@checkpoints, 57);
push(@checkpoints, 58);
push(@checkpoints, 59);
push(@checkpoints, 60);
push(@checkpoints, 61);
push(@checkpoints, 62);
push(@checkpoints, 63);
push(@checkpoints, 64);
push(@checkpoints, 65);
push(@checkpoints, 66);
push(@checkpoints, 67);
push(@checkpoints, 68);
push(@checkpoints, 69);
push(@checkpoints, 70);
push(@checkpoints, 71);
push(@checkpoints, 72);
push(@checkpoints, 73);
push(@checkpoints, 74);
push(@checkpoints, 75);
push(@checkpoints, 76);
push(@checkpoints, 77);
push(@checkpoints, 78);
push(@checkpoints, 79);
push(@checkpoints, 80);
push(@checkpoints, 81);
push(@checkpoints, 82);
push(@checkpoints, 83);
push(@checkpoints, 84);
push(@checkpoints, 85);
push(@checkpoints, 86);
push(@checkpoints, 87);
push(@checkpoints, 88);
push(@checkpoints, 89);
push(@checkpoints, 90);
push(@checkpoints, 91);
push(@checkpoints, 92);
push(@checkpoints, 93);
push(@checkpoints, 94);
push(@checkpoints, 95);
push(@checkpoints, 96);
push(@checkpoints, 97);
push(@checkpoints, 98);
push(@checkpoints, 99);
push(@checkpoints, 100);
push(@checkpoints, 101);
push(@checkpoints, 102);
push(@checkpoints, 103);
push(@checkpoints, 104);
push(@checkpoints, 105);
push(@checkpoints, 106);
push(@checkpoints, 107);
push(@checkpoints, 108);
push(@checkpoints, 109);
push(@checkpoints, 110);
push(@checkpoints, 111);
push(@checkpoints, 112);
push(@checkpoints, 113);
push(@checkpoints, 114);
push(@checkpoints, 115);
push(@checkpoints, 116);
push(@checkpoints, 117);
push(@checkpoints, 118);
push(@checkpoints, 119);
push(@checkpoints, 120);
push(@checkpoints, 121);
push(@checkpoints, 122);
push(@checkpoints, 123);
push(@checkpoints, 124);
push(@checkpoints, 125);
push(@checkpoints, 126);
push(@checkpoints, 127);
push(@checkpoints, 128);
push(@checkpoints, 129);
push(@checkpoints, 130);
push(@checkpoints, 131);
push(@checkpoints, 132);
push(@checkpoints, 133);
push(@checkpoints, 134);
push(@checkpoints, 135);
push(@checkpoints, 136);
push(@checkpoints, 137);
push(@checkpoints, 138);
push(@checkpoints, 139);
push(@checkpoints, 140);
push(@checkpoints, 141);
push(@checkpoints, 142);
push(@checkpoints, 143);
push(@checkpoints, 144);
push(@checkpoints, 145);
push(@checkpoints, 146);
push(@checkpoints, 147);
push(@checkpoints, 148);
push(@checkpoints, 149);

$cmd_sec{1} = "file=\"/etc/login.defs\";if [ -s \${file} ];then ret=`cat \${file} | grep -v \"#\" | grep PASS_MAX_DAYS | awk -F ' ' '{print \$2}'`;fi
if [ 0 -ne \$ret  -a  90 -ge \$ret ];then echo \"PASS_MAX_DAYS ok\";else echo \"PASS_MAX_DAYS  fail\";fi";
$cmd_sec{2} = "cat /etc/login.defs";
$cmd_sec{3} = "cat /etc/login.defs";
$cmd_sec{4} = "cat /etc/pam.d/system-auth";
$cmd_sec{5} = "cat /etc/login.defs";
$cmd_sec{6} = "if [ -s /etc/pam.d/system-auth ];then cat /etc/pam.d/system-auth|grep -v \"^[[:space:]]*#\";elif [ -s /etc/pam.d/common-password ];then cat /etc/pam.d/common-password|grep -v \"^[[:space:]]*#\";elif [ -s /etc/pam.d/passwd ];then cat /etc/pam.d/passwd | grep -v \"^[[:space:]]*#\";fi";
$cmd_sec{7} = "if [ -s /etc/pam.d/system-auth ];then cat /etc/pam.d/system-auth|grep -v \"^[[:space:]]*#\";elif [ -s /etc/pam.d/common-password ];then cat /etc/pam.d/common-password|grep -v \"^[[:space:]]*#\";elif [ -s /etc/pam.d/passwd ];then cat /etc/pam.d/passwd | grep -v \"^[[:space:]]*#\";fi";
$cmd_sec{8} = "if [ -s /etc/pam.d/system-auth ];then cat /etc/pam.d/system-auth|grep -v \"^[[:space:]]*#\";elif [ -s /etc/pam.d/common-password ];then cat /etc/pam.d/common-password|grep -v \"^[[:space:]]*#\";elif [ -s /etc/pam.d/passwd ];then cat /etc/pam.d/passwd | grep -v \"^[[:space:]]*#\";fi";
$cmd_sec{9} = "if [ -s /etc/pam.d/system-auth ];then cat /etc/pam.d/system-auth|grep -v \"\\s*#\";elif [ -s /etc/pam.d/common-password ];then cat /etc/pam.d/common-password|grep -v \"\\s*#\";elif [ -s /etc/pam.d/passwd ];then cat /etc/pam.d/passwd | grep -v \"\\s*#\";fi";
$cmd_sec{10} = "if [ -s /etc/pam.d/system-auth ];then red_ret=`cat /etc/pam.d/system-auth | grep -v \"^[[:space:]]*#\" | grep \"[[:space:]]*password[[:space:]]*sufficient[[:space:]]*.*remember.*\"`;fi
if [ -s /etc/pam.d/common-password ];then suse_ret=`cat /etc/pam.d/common-password | grep -v \"^[[:space:]]*#\" | grep \"[[:space:]]*password[[:space:]]*sufficient[[:space:]]*.*remember.*\"`;fi
if [ -s /etc/pam.d/passwd ];then suse_ret2=`cat /etc/pam.d/passwd | grep -v \"^[[:space:]]*#\" | grep \"[[:space:]]*password[[:space:]]*sufficient[[:space:]]*pam_unix.so[[:space:]]*md5[[:space:]]*shadow[[:space:]]*nullok[[:space:]]*try_first_pass[[:space:]]*use_authtok[[:space:]]*\" | grep \"remember=5\"`;fi
if [ -n \"\$red_ret\" ];then echo \"redhat:valid\";elif [ -n \"\$suse_ret\" ]; then echo \"suse:valid\";elif [ -n \"\$suse_ret2\" ];then echo \"suse2:valid\";else echo \"ret:invalid\";fi";
$cmd_sec{11} = "ssh_banner=`cat /etc/ssh/sshd_config | grep -v '^[[:space:]]*#' | grep Banner|awk '{print \$2}'`;
ssh_status=`netstat -antp|grep -i listen|grep \":22\\>\"|wc -l`;
if [[ \$ssh_status != 0 && -s \$ssh_banner ]];then echo \"sshd is running.sshd banner is not null.sshd banner check result:true\";elif [[ \$ssh_status != 0 ]];then echo \"sshd is running.sshd banner is null.sshd banner check result:false\";else echo \"sshd is not running.sshd banner check result:true\";fi;unset ssh_banner ssh_status";
$cmd_sec{12} = "up_uidmin=`(grep -v ^# /etc/login.defs |grep \"^UID_MIN\"|awk '{print \$2}')`;
up_uidmax=`(grep -v ^# /etc/login.defs |grep \"^UID_MAX\"|awk '{print \$2}')`;
echo \"UIDMIN=\"\$up_uidmin;
echo \"UIDMAX=\"\$up_uidmax;
egrep -v \"oracle|sybase|postgres\" /etc/passwd | awk -F: '(\$3>='\$up_uidmin' && \$3<='\$up_uidmax') {print \$1\":\"\$3}';
echo \"result=\"`egrep -v \"oracle|sybase|postgres\" /etc/passwd|awk -F: '(\$3>='\$up_uidmin' && \$3<='\$up_uidmax') {print \$1\":\"\$3}'|wc -l`;unset up_uidmin up_uidmax";
$cmd_sec{13} = "if [ -s /etc/lilo.conf ];then cat /etc/lilo.conf | grep -v \"^[[:space:]]#\" | grep \"password\";fi";
$cmd_sec{14} = "if [ -s /boot/grub/menu.lst ];then echo  '1';else echo '0';fi";
$cmd_sec{15} = "cat /boot/grub/menu.lst";
$cmd_sec{16} = "if [ -s /etc/lilo.conf ];then echo  '1';else echo '0';fi";
$cmd_sec{17} = "ssh_status=`netstat -antp|grep -i listen|grep \":22\\>\"|wc -l`;
if [[ \$ssh_status != 0 && -f /etc/motd ]];then echo \"sshd is running,banner is not null,check result:true\";elif [ \$ssh_status ];then echo \"sshd is running,banner is null,check result:false\";elif [ -f /etc/motd ];then echo \"sshd is not running,banner is not null,check result:true\";else echo \"sshd is not running,banner is null,check result:true\";fi;unset ssh_status";
$cmd_sec{18} = "if [ -f /etc/rsyslog.conf ];then cat /etc/rsyslog.conf | grep -v \"^[[:space:]]*#\" | grep -E '[[:space:]]*.+@.+';fi";
$cmd_sec{19} = "if [ -s /etc/syslog-ng/syslog-ng.conf ];then ret_1=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"port(514)\"`;if [ -n \"\$ret_1\" ];then ret_2=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"destination(logserver)\"`;fi;fi
if [ -n \"\$ret_2\" ];then echo \"ret:set\";else echo \"ret:none\";fi";
$cmd_sec{20} = "if [ -f /etc/syslog.conf ];then cat /etc/syslog.conf | grep -v \"^[[:space:]]*#\" | grep -E '[[:space:]]*.+@.+';fi";
$cmd_sec{21} = "redhat_count=0;
suse_count=0;
result=0;
telnet_status=`netstat -antp|grep -i listen|grep -c \":23\\>\"`;
if [[ \$telnet_status != 0 && -s /etc/issue ]];then cat /etc/issue;redhat_count=`cat /etc/issue | grep \"Red Hat Enterprise\" | wc -l`;suse_count=`cat /etc/issue | grep \"Red Hat Enterprise\" | wc -l`;fi;
if [[ \$redhat_count == 1 || \$suse_count == 1 ]];then result=1;fi; 
if [[ \$telnet_status != 0 && -s /etc/issue.net ]];then cat /etc/issue.net;redhat_count=`cat /etc/issue.net | grep \"Red Hat Enterprise\" | wc -l`;suse_count=`cat /etc/issue.net | grep \"Red Hat Enterprise\" | wc -l`;fi;
if [[ \$redhat_count == 1 || \$suse_count == 1 ]];then result=1;fi;
if [[ \$result == 1 && \$telnet_status == 1 ]];then echo \"telnet is running.telnet banner is not valid.telnet banner check result:false\";elif [ \$result == 1 ];then echo \"telnet is not running.telnet banner is not valid.telnet banner check result:true\";elif [ \$telnet_status == 1 ]; then echo \"telnet is running.telnet banner is valid.telnet banner check result:true\";else echo \"telnet is not running.telnet banner is valid.telnet banner check result:true\";fi;unset redhat_count suse_count result ftp_status;";
$cmd_sec{22} = "GID_MIN=`grep -v \"^[[:space:]]*#\" /etc/login.defs | grep \"^GID_MIN\" | awk '{print \$2}'`;GID_MAX=`grep -v \"^[[:space:]]*#\" /etc/login.defs | grep \"^GID_MAX\" | awk '{print \$2}'`;echo \"GID_MIN=\"\$GID_MIN;echo \"GID_MAX=\"\$GID_MAX;echo \"result:\"`egrep -v \"oracle|sybase|postgres\" /etc/passwd | awk -F: '(\$4<='\$GID_MAX' && \$4>='\$GID_MIN'){print \$4}' | wc -l`;";
$cmd_sec{23} = "if [ -s /etc/pam.d/sshd ];then ret1=`cat /etc/pam.d/sshd  | grep -v \"^[[:space:]]*#\" | grep \"auth[[:space:]]*required[[:space:]]*pam_tally[2]\\?.so[[:space:]]*.*deny=[0-9]*[[:space:]]*.*unlock_time=[0-9]*\"`;fi
if [ -s /etc/pam.d/sshd ];then ret2=`cat /etc/pam.d/sshd  | grep -v \"^[[:space:]]*#\" | grep \"account[[:space:]]*required[[:space:]]*pam_tally[2]\\?.so\"`;fi
if [[ -n \"\$ret1\" && -n \"\$ret2\" ]];then echo \"result:valid\";else echo \"result:invalue\";fi";
$cmd_sec{24} = "if [ -s /etc/pam.d/system-auth ];then red_ret=`cat /etc/pam.d/system-auth | grep -v \"^[[:space:]]*#\" | grep \"auth[[:space:]]*required[[:space:]]*pam_tally[0-9]*.so[[:space:]]*.*deny=[0-9]*[[:space:]]*.*unlock_time=[0-9]*\"`;fi
if [ -s /etc/pam.d/system-auth ];then red_ret2=`cat /etc/pam.d/system-auth | grep -v \"^[[:space:]]*#\" | grep \"account[[:space:]]*required[[:space:]]*pam_tally[0-9]*.so\"`;fi
if [ -s /etc/pam.d/common-auth ];then suse_ret=`cat /etc/pam.d/common-auth | grep -v \"^[[:space:]]*#\" | grep \"auth[[:space:]]*required[[:space:]]*pam_tally.so[[:space:]]*.*deny=[0-9]*[[:space:]]*.*unlock_time=[0-9]*\"`;fi
if [ -s /etc/pam.d/common-account ];then suse_ret2=`cat /etc/pam.d/common-account | grep -v \"^[[:space:]]*#\" | grep \"account[[:space:]]*required[[:space:]]*pam_tally.so\"`;fi
if [ -s /etc/pam.d/passwd ];then suse_ret3=`cat /etc/pam.d/passwd | grep -v \"^[[:space:]]*#\" | grep \"auth[[:space:]]*required[[:space:]]*pam_tally.so[[:space:]]*.*deny=[0-9]*[[:space:]]*.*unlock_time=[0-9]*\"`;fi
if [ -s /etc/pam.d/passwd ];then suse_ret4=`cat /etc/pam.d/passwd | grep -v \"^[[:space:]]*#\" | grep \"account[[:space:]]*required[[:space:]]*pam_tally.so\"`;fi
if [[ -n \"\$red_ret\" && -n \"\$red_ret2\" ]];then echo \"redhat:valid\";elif [[ -n \"\$suse_ret\" && -n \"\$suse_ret2\" ]];then echo \"suse:valid\";elif [[ -n \"\$suse_ret3\" && -n \"suse_ret4\" ]];then echo \"suse2:valid\";else echo \"ret:not value\";fi";
$cmd_sec{25} = "if [ -s /etc/vsftpd.conf ];then ret=`cat /etc/vsftpd.conf | grep -v \"^[[:space:]]*#\" | grep \"anonymous_enable=NO\"`;elif [ -s /etc/vsftpd/vsftpd.conf ]; then ret=`cat /etc/vsftpd/vsftpd.conf | grep -v \"^[[:space:]]*#\" | grep \"anonymous_enable=NO\"`;else ret=\"result-true\";fi;if [ -n \"\$ret\" ];then echo \"result-true\";else echo \"result-false\";fi";
$cmd_sec{26} = "wu_status=`rpm -q wu-ftpd 2>/dev/null | grep \"^wu-ftpd\"`;
wu_status2=`netstat -antp|grep -i \"listen\"|grep -c \":21\\>\"`;
if [ -n \"\$wu_status\" ];then if [ -n \"\$wu_status2\" ];then if (cat /etc/passwd| grep \"^[[:space:]]*[^#]\" | grep \"^[[:space:]]*ftp\");then echo \"wu-ftp:invalid\";else \"wu-ftp:valid\";fi;else echo \"wu-ftpd:valid\";fi;else echo \"wu-ftpd:valid\";fi";
$cmd_sec{27} = "cat /etc/profile | grep -v \"^[[:space:]]*#\" | grep \"TMOUT[[:space:]]*=[[:space:]]*[0-9]*\" | grep -v \"export\" | sed 's/[^0-9]//g'
cat /etc/profile | grep -v \"^[[:space:]]*#\" | grep \"export[[:space:]]*TMOUT[[:space:]]*=[[:space:]]*[0-9]*\" | sed 's/[^0-9]//g'";
$cmd_sec{28} = "telnet_info=`rpm -qa |grep telnet`;if [ -z \"\$telnet_info\" ]; then echo disable = yes;else cat /etc/xinetd.d/telnet 2>/dev/null | grep disable || echo disable = yes;fi;";
$cmd_sec{29} = "ps -ef | grep ssh";
$cmd_sec{30} = "cat /etc/ssh/sshd_config";
$cmd_sec{31} = "tmp_result1=`cat /etc/pam.d/login |grep -v \"^[[:space:]]*#\" |egrep \"^[[:space:]]*auth[[:space:]]*required[[:space:]]*pam_securetty.so[[:space:]]*\$\"`
tmp_result2=`cat /etc/pam.d/login |grep -v \"^[[:space:]]*#\" |egrep \"^[[:space:]]*auth[[:space:]]*\\[[[:space:]]*user_unknown[[:space:]]*=[[:space:]]*ignore[[:space:]]*success[[:space:]]*=[[:space:]]*ok[[:space:]]*ignore[[:space:]]*=ignore[[:space:]]*default[[:space:]]*=[[:space:]]*bad[[:space:]]*\\][[:space:]]*pam_securetty.so[[:space:]]*\$\"`
if [ -n \"\${tmp_result1}\" -o -n \"\${tmp_result2}\" ];then echo \"true\";else echo \"false\";fi;";
$cmd_sec{32} = "if [ -s /etc/vsftpd/ftpusers ];then ret=`cat /etc/vsftpd/ftpusers | grep -v \"^[[:space:]]*#\" | grep \"\\broot\\b\"`;elif [ -s /etc/ftpusers ];then ret=`cat /etc/ftpusers | grep -v \"^[[:space:]]*#\" | grep \"\\broot\\b\"`;else ret=\"vsftpd valid\";fi;if [ -n \"\$ret\" ];then echo \"vsftpd valid\";else echo \"vsftpd invalid\";fi";
$cmd_sec{33} = "wu_status=`rpm -q wu-ftpd 2>/dev/null | grep \"^wu-ftpd\"`;
wu_status2=`netstat -antp|grep -i \"listen\"|grep -c \":21\\>\"`;
if [ -n \"\$wu_status\" ];then if [ -n \"\$wu_status2\" ];then if (cat /etc/ftpusers 2>/dev/null | grep \"^[[:space:]]*[^#]\" | grep \"\\broot\\b\");then echo \"wu-ftp:valid\";else \"wu-ftp:invalid\";fi;else echo \"wu-ftpd:valid\";fi;else echo \"wu-ftpd:valid\";fi";
$cmd_sec{34} = "cat /etc/security/limits.conf";
$cmd_sec{35} = "cat /etc/security/limits.conf";
$cmd_sec{36} = "cat /etc/inittab";
$cmd_sec{37} = "unset ret_1 ret_2;
if [ -f /etc/ssh/sshd_config ];then ret_1=`cat /etc/ssh/sshd_config | grep -v \"^[[:space:]]*#\" | grep \"Protocol\" | grep \"1\"`;if [ -z \"\$ret_1\" ];then ret_2=`cat /etc/ssh/sshd_config | grep -v \"^[[:space:]]*#\" | grep \"PermitRootLogin\" | grep -E \"no|NO\"`;if [ -n \"\$ret_2\" ];then echo \"ret:valid\";else echo \"ret:PermitRootLogin invalid\";fi;else echo \"ret:Protocol invalid\";fi;elif [ -f /etc/ssh2/sshd2_config ];then ret_1=`cat /etc/ssh/sshd_config | grep -v \"^[[:space:]]*#\" | grep \"Protocol\" | grep \"1\"`;if [ -z \"\$ret_1\" ];then ret_2=`cat /etc/ssh/sshd_config | grep -v \"^[[:space:]]*#\" | grep \"PermitRootLogin\" | grep -E \"no|NO\"`;if [ -n \"\$ret_2\" ];then echo \"ret:valid\";else echo \"ret:PermitRootLogin invalid\";fi;else echo \"ret:Protocol invalid\";fi;else echo \"ret:valid\";fi;unset ret_1 ret_2;";
$cmd_sec{38} = "ls -al /etc/passwd";
$cmd_sec{39} = "ls -al /etc/shadow";
$cmd_sec{40} = "ls -al /etc/group";
$cmd_sec{41} = "df -k";
$cmd_sec{42} = "cat /etc/hosts.allow | awk '{FS=\":\";ORS=\" \"}{if(\$1~/^[[:space:]]*[^#]/)print \$3}'";
$cmd_sec{43} = "cat /etc/hosts.deny";
$cmd_sec{44} = "gsettings get org.gnome.desktop.screensaver lock-delay 2>/dev/null";
$cmd_sec{45} = "gconftool-2 -g /apps/gnome-screensaver/mode 2>/dev/null";
$cmd_sec{46} = "gsettings get org.gnome.desktop.screensaver idle-activation-enabled 2>/dev/null";
$cmd_sec{47} = "gsettings get org.gnome.desktop.screensaver lock-enabled 2>/dev/null";
$cmd_sec{48} = "gconftool-2 -g /apps/gnome-screensaver/idle_activation_enabled 2>/dev/null";
$cmd_sec{49} = "gconftool-2 -g /apps/gnome-screensaver/lock_enabled 2>/dev/null";
$cmd_sec{50} = "gconftool-2 -g /apps/gnome-screensaver/idle_delay 2>/dev/null";
$cmd_sec{51} = "gsettings get org.gnome.desktop.session idle-delay 2>/dev/null";
$cmd_sec{52} = "cat /etc/shadow | awk 'BEGIN{FS=\":\";ORS=\",\"}{if(\$2==\"\")print \$1};' | more";
$cmd_sec{53} = "cat /etc/login.defs | grep -v \"^[[:space:]]*#\" | grep -i \"^[[:space:]]*umask\"";
$cmd_sec{54} = "find / -maxdepth 3 -type f -name .rhosts 2>/dev/null | grep -v -c -i \"find[[:space:]]*:\"";
$cmd_sec{55} = "find / -maxdepth 2 -type f -name hosts.equiv 2>/dev/null| grep -v -c -i \"find[[:space:]]*:\"";
$cmd_sec{56} = "(cat /etc/pam.d/su | grep pam_rootok | grep \"^[[:space:]]*[^#]\";cat /etc/pam.d/su | grep pam_wheel.so | grep \"^[[:space:]]*[^#]\") | awk '{ORS=\",\"}{print \$0}'";
$cmd_sec{57} = "find / -maxdepth 3 -name .rhosts 2>/dev/null";
$cmd_sec{58} = "find / -maxdepth 3 -name .netrc 2>/dev/null";
$cmd_sec{59} = "find / -maxdepth 3 -name hosts.equiv 2>/dev/null";
$cmd_sec{60} = "unset num;
unset filename;
if [ -s /etc/profile ];then filename=/etc/profile;fi;
function checkusrumask(){ if [ -f \$filename ];then num=`cat \$filename |grep -v \"^[[:space:]]*#\" |grep umask|wc -l`;if [ \$num -gt 0 ];then cat \$filename |grep -v \"^[[:space:]]*#\" |grep umask | while read line;do myvar=`echo \$line|awk '{print \$2}'`;if [[ \"\$myvar\" != 077 ]];then echo \"false-substandered\";fi;done;else echo \"false-not configured\";fi;fi; };
if [ -n \"\$filename\" ];then checkusrumask;else echo \"false-not configured\";fi;unset num; unset filename";
$cmd_sec{61} = "unset num;
unset filename;
if [ -s /etc/csh.cshrc ];then filename=/etc/csh.cshrc;fi;
function checkusrumask(){ if [ -f \$filename ];then num=`cat \$filename |grep -v \"^[[:space:]]*#\" |grep umask|wc -l`;if [ \$num -gt 0 ];then cat \$filename |grep -v \"^[[:space:]]*#\" |grep umask | while read line;do myvar=`echo \$line|awk '{print \$2}'`;if [[ \"\$myvar\" != 077 ]];then echo \"false-substandered\";fi;done;else echo \"false-not configured\";fi;fi; };
if [ -n \"\$filename\" ];then checkusrumask;else echo \"false-not configured\";fi;unset num; unset filename";
$cmd_sec{62} = "unset num;
unset filename;
if [ -s /etc/csh.login ];then filename=/etc/csh.login;fi;
function checkusrumask(){ if [ -f \$filename ];then num=`cat \$filename |grep -v \"^[[:space:]]*#\" |grep umask|wc -l`;if [ \$num -gt 0 ];then cat \$filename |grep -v \"^[[:space:]]*#\" |grep umask | while read line;do myvar=`echo \$line|awk '{print \$2}'`;if [[ \"\$myvar\" != 077 ]];then echo \"false-substandered\";fi;done;else echo \"false-not configured\";fi;fi; };
if [ -n \"\$filename\" ];then checkusrumask;else echo \"false-not configured\";fi;unset num; unset filename";
$cmd_sec{63} = "unset num;
unset filename;
if [ -s /etc/bashrc ];then filename=/etc/bashrc;elif [ -s /etc/bash.bashrc ];then filename=/etc/bash.bashrc;fi;
function checkusrumask(){ if [ -f \$filename ];then num=`cat \$filename |grep -v \"^[[:space:]]*#\" |grep umask|wc -l`;if [ \$num -gt 0 ];then cat \$filename |grep -v \"^[[:space:]]*#\" |grep umask | while read line;do myvar=`echo \$line|awk '{print \$2}'`;if [[ \"\$myvar\" != 077 ]];then echo \"false-substandered\";fi;done;else echo \"false-not configured\";fi;fi; };
if [ -n \"\$filename\" ];then checkusrumask;else echo \"false-not configured\";fi;unset num; unset filename";
$cmd_sec{64} = "if [ -s /etc/gshadow ];then lsattr /etc/gshadow;else echo \"----i---------- \\etc\\gshadow\";fi";
$cmd_sec{65} = "lsattr /etc/passwd";
$cmd_sec{66} = "lsattr /etc/shadow";
$cmd_sec{67} = "lsattr /etc/group";
$cmd_sec{68} = "echo \$PATH";
$cmd_sec{69} = "cat /etc/passwd | awk 'BEGIN{FS=\":\";ORS=\",\"}{if(\$1~/^[[:space:]]*[^#]/)if(\$1!=\"root\")if(\$3==\"0\")print \$1}'";
$cmd_sec{70} = "ls -al /etc/rc.d/init.d/";
$cmd_sec{71} = "ls -al /etc/rc3.d/";
$cmd_sec{72} = "ls -al /etc/rc6.d/";
$cmd_sec{73} = "ls -al /tmp/dassec_tmp";
$cmd_sec{74} = "if [ -f /etc/xinetd.conf ];then stat -c %a  /etc/xinetd.conf ;elif [ -f /etc/inetd.conf ];then stat -c %a /etc/inetd.conf;fi";
$cmd_sec{75} = "ls -al /etc/rc5.d/";
$cmd_sec{76} = "ls -al /etc/rc1.d/";
$cmd_sec{77} = "ls -al /etc/security";
$cmd_sec{78} = "ls -al /etc/rc4.d/";
$cmd_sec{79} = "ls -al /etc/passwd";
$cmd_sec{80} = "ls -al /etc/rc0.d/";
$cmd_sec{81} = "ls -al /etc/services";
$cmd_sec{82} = "ls -al /etc/rc2.d/";
$cmd_sec{83} = "ls -al /etc/group";
$cmd_sec{84} = "ls -al /tmp";
$cmd_sec{85} = "ls -al /etc/shadow";
$cmd_sec{86} = "cat /etc/snmp/snmpd.conf 2>/dev/null | grep -v \"^[[:space:]]*#\" | grep -c \"[[:space:]]*public[[:space:]]*\"";
$cmd_sec{87} = "if [ -f /etc/snmp/snmpd.conf ];then echo \"yes\";else echo \"no\";fi";
$cmd_sec{88} = "if [ -f /etc/snmp/snmpd.conf ];then echo \"yes\";else echo \"no\";fi";
$cmd_sec{89} = "cat /etc/snmp/snmpd.conf  2>/dev/null | grep -v \"^[[:space:]]*#\" | grep -c \"[[:space:]]*private[[:space:]]*\"";
$cmd_sec{90} = "#!/bin/bash
FTPSTATUS=`netstat -antp|grep -i \"listen\"|grep \":21\\>\"|wc -l`;
function Check_vsftpd(){ if [ -f /etc/vsftpd.conf ];then FTPCONF=\"/etc/vsftpd.conf\";elif [ -f /etc/vsftpd/vsftpd.conf ];then FTPCONF=\"/etc/vsftpd/vsftpd.conf\";fi;echo +++++++++vsftpd.conf+++++++++++++++++;cat \$FTPCONF|egrep -v \"^[[:space:]]*#|^[[:space:]]*\$\";echo +++++++++vsftpd.conf end+++++++++++++;ls_recurse_enable=`cat \$FTPCONF|grep -v \"^[[:space:]]*#\"|grep -i \"ls_recurse_enable=YES\"|wc -l`;local_umask=`cat \$FTPCONF|grep -v \"^[[:space:]]*#\"|grep -i \"local_umask=022\"|wc -l`;anon_umask=`cat \$FTPCONF|grep -v \"^[[:space:]]*#\"|grep -i \"anon_umask=022\"|wc -l`;VSFTPD_NO=\$(expr \$ls_recurse_enable + \$local_umask + \$anon_umask);if [ \$VSFTPD_NO -eq 3 ];then  echo \"vsftpd is running.\$FTPCONF is recommended.FTP check result:true\";else  echo \"vsftpd is running.\$FTPCONF is not recommended.FTP check result:false\";fi;unset FTPCONF VSFTPD_NO ls_recurse_enable local_umask anon_umask; }
function Check_pureftpd(){ echo +++++++++pure-ftpd.conf+++++++++++++++++;cat /etc/pure-ftpd/pure-ftpd.conf|egrep -v \"^[[:space:]]*#|^[[:space:]]*\$\";echo +++++++++pure-ftpd.conf end+++++++++++++;if [ `cat /etc/pure-ftpd/pure-ftpd.conf|grep -v \"^[[:space:]]*#\"|grep -i \"Umask\"|grep -i \"177:077\"|wc -l` == 1 ];then echo \"pure-ftpd is running.pure-ftpd.conf is recommended.FTP check result:true\";else echo \"pure-ftpd is running.pure-ftpd.conf is not recommended.FTP check result:false\";fi; }
if [ \$FTPSTATUS = 0 ];then echo \"FTP is not running.FTP check result:true.\";elif ([ `ps -ef|grep vsftpd|grep -v \"grep\"|wc -l` != 0 ]);then Check_vsftpd;elif ([ `ps -ef|grep pure-ftpd|grep -v \"grep\"|wc -l` != 0 ]);then Check_pureftpd;else echo \"ftp is running,FTP check result:true\";fi;unset FTPSTATUS;";
$cmd_sec{91} = "LANG=c;
find /usr/bin -type f \\( -perm -04000 -o -perm -02000 \\) -exec ls -lg {} \\;
echo \"result=\"`find /usr/bin -type f \\( -perm -04000 -o -perm -02000 \\) -exec ls -lg {} \\;|wc -l`;";
$cmd_sec{92} = "unset syslogd_status syslogng_status rsyslogd_status LOGDIR;
syslogd_status=`ps -ef |grep ' syslogd '|grep -v \"grep\"|wc -l`;
syslogng_status=`ps -ef |grep \"/syslog-ng\"|grep -v \"grep /syslog-ng\"|wc -l`;
rsyslogd_status=`ps -ef | grep \"\\/rsyslogd \" | grep -v \"grep\" |wc -l`;
if [ \$syslogd_status != 0 ];then LOGDIR=`if [ -f /etc/syslog.conf ];then cat /etc/syslog.conf| grep -v \"^[[:space:]]*#\" |sed '/^#/d' |sed '/^\$/d' |awk '((\$2!~/@/) && (\$2!~/*/) && (\$2!~/-/)) {print \$2}';fi`;ls -l \$LOGDIR 2>/dev/null | grep  \"^-\" | cut -b 5-10;elif [ \$rsyslogd_status != 0 ];then LOGDIR=`cat /etc/rsyslog.conf | grep -v \"^[[:space:]]*#\" |sed '/^#/d' |sed '/^\$/d' |awk '((\$2!~/@/) && (\$2!~/*/) && (\$2!~/-/)) {print \$2}'`;ls -l \$LOGDIR 2>/dev/null | grep \"^-\" | cut -b 5-10;elif [[ \$syslogng_status != 0 ]];then LOGDIR=`cat /etc/syslog-ng/syslog-ng.conf|grep -v \"^[[:space:]]*#\"|grep \"^destination\"|grep file|cut -d\\\" -f2`;ls -l \$LOGDIR 2>/dev/null | grep \"^-\" | cut -b 5-10;else echo \"syslog is not running.\";fi;unset syslogd_status syslogng_status rsyslogd_status LOGDIR;";
$cmd_sec{93} = "#!/bin/bash
FTPSTATUS=`netstat -antp|grep -i \"listen\"|grep \":21\\>\"|wc -l`
function Check_vsftpd(){ if [ -f /etc/vsftpd.conf ];then FTPCONF=\"/etc/vsftpd.conf\";elif [ -f /etc/vsftpd/vsftpd.conf ];then FTPCONF=\"/etc/vsftpd/vsftpd.conf\";fi;cat \$FTPCONF|egrep -v \"^[[:space:]]*#|^[[:space:]]*\$\";if [ `grep -v \"^[[:space:]]*#\" \$FTPCONF|grep -i \"chroot_local_user=YES\"|wc -l` -eq 1 ];then  echo \"vsftpd is running.\$FTPCONF is recommended.FTP check result:true.\";else  echo \"vsftpd is running.\$FTPCONF is not recommended.FTP check result:false.\";fi;unset FTPCONF; }
function Check_pureftpd(){ cat /etc/pure-ftpd/pure-ftpd.conf|egrep -v \"^[[:space:]]*#|^[[:space:]]*\$\";ChrootEveryone=`cat /etc/pure-ftpd/pure-ftpd.conf|grep -v \"^[[:space:]]*#\"|grep -i \"ChrootEveryone\"|grep -i \"yes\"|wc -l`;AllowUserFXP=`cat /etc/pure-ftpd/pure-ftpd.conf|grep -v \"^[[:space:]]*#\"|grep -i \"AllowUserFXP\"|grep -i \"no\"|wc -l`;AllowAnonymousFXP=`cat /etc/pure-ftpd/pure-ftpd.conf|grep -v \"^[[:space:]]*#\"|grep -i \"AllowAnonymousFXP\"|grep -i \"no\"|wc -l`;PUREFTPD_NO=\$(expr \$ChrootEveryone + \$AllowUserFXP + \$AllowAnonymousFXP);if [ \$PUREFTPD_NO -eq 3 ];then echo \"pure-ftpd is running.pure-ftpd.conf is recommended.FTP check result:true.\";else echo \"pure-ftpd is running.pure-ftpd.conf is not recommended.FTP check result:false.\";fi;unset ChrootEveryone AllowUserFXP AllowAnonymousFXP PUREFTPD_NO; }
if [ \$FTPSTATUS = 0 ];then  echo \"FTP is not running.FTP check result:true.\";elif ([ `ps -ef|grep vsftpd|grep -v \"grep\"|wc -l` -ne 0 ]);then Check_vsftpd;elif ([ `ps -ef|grep pure-ftpd|grep -v \"grep\"|wc -l` -ne 0 ]);then Check_pureftpd;else echo \"ftp is running,FTP check result:true\";fi;unset FTPSTATUS;";
$cmd_sec{94} = "unset ret;
ret=`find /usr/bin/chage /usr/bin/gpasswd /usr/bin/wall /usr/bin/chfn /usr/bin/chsh /usr/bin/newgrp /usr/bin/write /usr/sbin/usernetctl /usr/sbin/traceroute /bin/mount /bin/umount /bin/ping /sbin/netreport -type f -perm +6000 2>/dev/null`;
echo \$ret;
if [ -n \"\$ret\" ];then echo \"ret:exist invalid files\";else echo \"ret:all files valid\";fi;unset ret;";
$cmd_sec{95} = "ls -al /var/log/maillog";
$cmd_sec{96} = "ls -al /var/log/messages";
$cmd_sec{97} = "ls -al /var/log/localmessages";
$cmd_sec{98} = "ls -al /var/log/spooler";
$cmd_sec{99} = "ls -al /var/log/boot.log";
$cmd_sec{100} = "ls -al /var/log/mail";
$cmd_sec{101} = "ls -al /var/log/cron";
$cmd_sec{102} = "ls -al /var/log/secure";
$cmd_sec{103} = "if [ -f /etc/rsyslog.conf ];then cat /etc/rsyslog.conf | grep -v \"^[[:space:]]*#\" | grep \"cron\\.\\*[[:space:]]*\" | grep \"/var/log/cron\";fi";
$cmd_sec{104} = "if [ -f /etc/syslog.conf ];then cat /etc/syslog.conf | grep -v \"^[[:space:]]*#\" | grep \"cron\\.\\*[[:space:]]*\" | grep \"/var/log/cron\";fi";
$cmd_sec{105} = "if [ -s /etc/syslog-ng/syslog-ng.conf ];then a_i=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"filter[[:space:]]*f_cron[[:space:]]*{[[:space:]]*facility(cron);[[:space:]]*};\" | wc -l `;else a_i=1;fi
if [ -s /etc/syslog-ng/syslog-ng.conf ];then b_i=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"destination[[:space:]]*cron[[:space:]]*{[[:space:]]*file(\\\"*/var/log/cron\\\"*)[[:space:]]*;[[:space:]]*};\" | wc -l`;else b_i=1;fi
if [ -s /etc/syslog-ng/syslog-ng.conf ];then c_i=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"log[[:space:]]*{[[:space:]]*source(src);[[:space:]]*filter(f_cron);[[:space:]]*destination(cron);[[:space:]]*};\" | wc -l`;else c_i=1;fi
if [[ \"\$a_i\" -ge 1 && \"\$b_i\" -ge 1 && \"\$c_i\" -ge 1 ]];then echo \"result:true\";else echo \"result:false\";fi";
$cmd_sec{106} = "if [ -f /etc/mail/aliases ];then awk -F: '{if(\$1~/^[[:space:]]*[^#]/)if(\$1==\"games\"||\$1==\"ingres\"||\$1==\"system\"||\$1==\"toor\"||\$1==\"uucp\"||\$1==\"manager\"||\$1==\"dumper\"||\$1==\"operator\"||\$1==\"decode\"||\$1==\"root\")flag++};END{if(flag==0)print\"ok\";else print\"no\"}' /etc/mail/aliases;fi";
$cmd_sec{107} = "if [ -f /etc/aliases ];then awk -F: '{if(\$1~/^[[:space:]]*[^#]/)if(\$1==\"games\"||\$1==\"ingres\"||\$1==\"system\"||\$1==\"toor\"||\$1==\"uucp\"||\$1==\"manager\"||\$1==\"dumper\"||\$1==\"operator\"||\$1==\"decode\"||\$1==\"root\")flag++};END{if(flag==0)print\"ok\";else print\"no\"}' /etc/aliases 2>/dev/null;fi";
$cmd_sec{108} = "awk -F: '{if(\$1==\"adm\"||\$1==\"lp\"||\$1==\"mail\"||\$1==\"uucp\"||\$1==\"operator\"||\$1==\"games\"||\$1==\"gopher\"||\$1==\"ftp\"||\$1==\"nobody\"||\$1==\"nobody4\"||\$1==\"noaccess\"||\$1==\"listen\"||\$1==\"webservd\"||\$1==\"rpm\"||\$1==\"dbus\"||\$1==\"avahi\"||\$1==\"mailnull\"||\$1==\"smmsp\"||\$1==\"nscd\"||\$1==\"vcsa\"||\$1==\"rpc\"||\$1==\"rpcuser\"||\$1==\"nfsnobody\"||\$1==\"sshd\"||\$1==\"pcap\"||\$1==\"ntp\"||\$1==\"haldaemon\"||\$1==\"distcache\"||\$1==\"apache\"||\$1==\"webalizer\"||\$1==\"squid\"||\$1==\"xfs\"||\$1==\"gdm\"||\$1==\"sabayon\"||\$1==\"named\"){if(\$2!=\"*\"&&\$2!~/!/)flag++}};END{if(flag==0)print \"ok\";else print \"no\"}' /etc/shadow";
$cmd_sec{109} = "chkrootkit -q 2>/dev/null";
$cmd_sec{110} = "if which chkrootkit>/dev/null 2>&1;then echo \"installed\";else echo \"no installed\";fi";
$cmd_sec{111} = "last | grep \"logged\"";
$cmd_sec{112} = "cat /etc/profile";
$cmd_sec{113} = "cat /etc/profile | grep -v \"^[[:space:]]*#\" | grep \"HISTFILESIZE\" | awk -F= '{print \$2}'";
$cmd_sec{114} = "unset ret;
if [ -s /etc/syslog.conf ];then ret=`cat /etc/syslog.conf | grep -v \"^[[:space:]]*#\" | grep \"\\*\\.err;kern\\.debug;daemon\\.notice[[:space:]]*\"|grep \"/var/adm/messages\"`;fi
if [ -n \"\$ret\" ];then echo \"red:valid\";else echo \"red-suse:no value\";fi";
$cmd_sec{115} = "unset suse_ret suse_ret2 suse_ret3;
if [ -s /etc/syslog-ng/syslog-ng.conf ];then suse_ret=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"level(err) or facility(kern) and level(debug) or facility(daemon) and level(notice)\"`;if [ -n \"\$suse_ret\" ];then suse_ret2=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep 'file(\"/var/adm/msgs\")'`;if [ -n \"\$suse_ret2\" ];then suse_ret3=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"destination(msgs)\"`;fi;fi;fi;if [ -n \"\$suse_ret3\" ];then echo \"suse:valid\";else echo \"suse:no value\";fi";
$cmd_sec{116} = "unset ret;
if [ -s /etc/rsyslog.conf ];then ret=`cat /etc/rsyslog.conf | grep -v \"^[[:space:]]*#\" | grep \"\\*\\.err;kern\\.debug;daemon\\.notice[[:space:]]*\"|grep \"/var/adm/messages\"`;fi
if [ -n \"\$ret\" ];then echo \"red:valid\";else echo \"red-suse:no value\";fi";
$cmd_sec{117} = "(cat /var/log/pacct 1>/dev/null 2>&1 && echo exist) || echo not exist";
$cmd_sec{118} = "unset red_ret suse_ret suse_ret2 suse_ret3;
if [ -s /etc/syslog.conf ];then red_ret=`cat /etc/syslog.conf | grep -v \"^[[:space:]]*#\" | grep \"authpriv.\\*[[:space:]]*.*\"`;fi
if [ -s /etc/rsyslog.conf ];then red_ret2=`cat /etc/rsyslog.conf | grep  -v \"^[[:space:]]*#\" | grep \"authpriv.\\*[[:space:]]*.*\"`;fi
if [ -s /etc/syslog-ng/syslog-ng.conf ];then suse_ret=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"facility(authpriv)\" | grep \"filter\" | grep \"f_secure\" | awk '{print \$2}'`;if [ -n \"\$suse_ret\" ];then suse_ret2=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"destination\" | grep \"/var/log/secure\"`; if [ -n \"\$suse_ret2\" ];then suse_ret3=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"log\" | grep \"\$suse_ret\"`;fi;fi;fi
if [ -n \"\$red_ret\" ];then echo \"redhat-suse:valid\";elif [ -n \"\$red_ret2\" ];then echo \"red-hat6:valid\";elif [ -n \"\$suse_ret3\" ];then echo \"suse:valid\";else echo \"ret:no value\";fi;unset red_ret suse_ret suse_ret2 suse_ret3;";
$cmd_sec{119} = "chkconfig --list 2> /dev/null | grep \"^chargen\"";
$cmd_sec{120} = "chkconfig --list 2> /dev/null | grep \"^ypbind\"";
$cmd_sec{121} = "chkconfig --list 2> /dev/null | grep \"^tftp\"";
$cmd_sec{122} = "chkconfig --list 2> /dev/null | grep \"^klogin\"";
$cmd_sec{123} = "chkconfig --list 2> /dev/null | grep \"^discard\"";
$cmd_sec{124} = "chkconfig --list 2> /dev/null | grep \"^kshell\"";
$cmd_sec{125} = "chkconfig --list 2> /dev/null | grep \"daytime\"";
$cmd_sec{126} = "chkconfig --list 2> /dev/null | grep \"^echo\"";
$cmd_sec{127} = "chkconfig --list 2> /dev/null | grep \"^sendmail\"";
$cmd_sec{128} = "chkconfig --list 2> /dev/null | grep \"^ntalk\"";
$cmd_sec{129} = "chkconfig --list 2> /dev/null | grep \"^ident\"";
$cmd_sec{130} = "chkconfig --list 2> /dev/null | grep \"^printer\"";
$cmd_sec{131} = "chkconfig --list 2> /dev/null | grep \"^bootps\"";
$cmd_sec{132} = "chkconfig --list 2> /dev/null | grep \"^time\"";
$cmd_sec{133} = "chkconfig --list 2> /dev/null | grep \"^nfslock\"";
$cmd_sec{134} = "chkconfig --list 2> /dev/null | grep \"^lpd\"";
$cmd_sec{135} = "chkconfig --list 2> /dev/null | grep \"^nfs\"";
$cmd_sec{136} = "echo \"result:\"`(sysctl -n net.ipv4.ip_forward)`";
$cmd_sec{137} = "echo \"result:\"`(sysctl -n net.ipv4.conf.all.accept_source_route)`";
$cmd_sec{138} = "echo \"result:\"`(sysctl -n net.ipv4.icmp_echo_ignore_broadcasts)`";
$cmd_sec{139} = "echo \"result:\"`(sysctl -n net.ipv4.conf.all.send_redirects)`";
$cmd_sec{140} = "echo \"result:\"`(sysctl -n net.ipv4.conf.all.accept_redirects)`";
$cmd_sec{141} = "ret=`ps -ef | grep  nfs | grep -cv \"grep nfs\"`;
if [ \$ret -ge 1 ];then echo \"nfs:running\";else echo \"nfs:notrun\";fi";
$cmd_sec{142} = "cat /etc/hosts.allow";
$cmd_sec{143} = "cat /etc/host.conf";
$cmd_sec{144} = "cat /etc/host.conf";
$cmd_sec{145} = "if [ -f /etc/redhat-release ];then cat /etc/redhat-release;uname -a;echo \"result:yes\";elif [ -f /etc/SuSE-release ]; then cat /etc/SuSE-release;uname -a;echo \"result:yes\";fi";
$cmd_sec{146} = "cat /proc/sys/net/ipv4/ip_forward";
$cmd_sec{147} = "ps ax | grep -E 'chargen-dgram|daytime-stream|echo-streamklogin|tcpmux-server|chargen-stream|discard-dgram|eklogin|krb5-telnet|tftp|cvs|discard-stream|ekrb5-telnet|kshell|time-dgram|daytime-dgram|echo-dgram|gssftp|rsync|time-stream' | grep -v \"grep -E chargen-dgram|daytime-stream\"";
$cmd_sec{148} = "if [ -f /etc/ntp.conf ];then cat /etc/ntp.conf | grep -v \"^[[:space:]]*#\" | grep 'server' | grep -v \"127.127.1.0\" | grep -v \"127.0.0.1\";fi";
$cmd_sec{149} = "unset count status;
count=`chkconfig --list 2>/dev/null | grep -cE 'ntp|ntpd' `;
if [ \"\$count\" -ge 1 ];then status=`ps aux | grep -E 'ntp |ntpd ' | grep -cv \"grep -E ntp |ntpd \"`;if [ \"\$status\" -ge 1 ];then echo \"ntp:start\";else echo \"ntp:stop\";fi;elif [ -n \"\$count\" ];then status=`ps aux | grep -E 'ntp |ntpd ' | grep -cv \"grep -E ntp |ntpd \"`;if [ \"\$status\" -ge 2 ];then echo \"ntp:start\";else echo \"ntp:stop\";fi;else \"ntp:need install ntp service\";fi;unset count status;";

# 附录检查项

$appendix_cmd{1} = "if [ -f /etc/shadow ];then lsattr /etc/shadow 2>/dev/null;fi;
if [ -f /etc/gshadow ];then lsattr /etc/group 2>/dev/null;fi;
if [ -f /etc/passwd ];then lsattr /etc/passwd 2>/dev/null;fi";
$appendix_cmd{2} = "ps -ef | grep -v \"\\.sh\" | grep -v \"\\.pl\"";
$appendix_cmd{3} = "ifconfig -a 2>/dev/null";
$appendix_cmd{4} = "cat  /etc/group 2>/dev/null | head -300";
$appendix_cmd{5} = "uname -a 2>/dev/null";
$appendix_cmd{6} = "netstat -anp 2>/dev/null | head -300";
$appendix_cmd{7} = "df -m 2>/dev/null";
$appendix_cmd{8} = "lastb -100 2>/dev/null";
$appendix_cmd{9} = "last -100 2>/dev/null";
$appendix_cmd{10} = "cat /etc/passwd 2>/dev/null | head -300";
$appendix_cmd{11} = "rpm -qa | head -100";
$appendix_cmd{12} = "chkconfig --list | head -50";
$appendix_cmd{13} = "version=`lsb_release -a 2>/dev/null | grep \"Description\" | awk -F: '{print \$2}'`;if [ -n \"\$version\" ];then echo \$version;else if [ -z \"\$version\" ]; then echo \"\";else cat /etc/SuSE-release | grep -v \"VERSION\" | grep -v \"PATCHLEVEL\";fi;fi";
$appendix_cmd{14} = "rm -fv /tmp/DAS{dastmp}_dassec_grub_tmp";
$appendix_cmd{15} = "if [ -f /etc/syslog.conf ];then cat /etc/syslog.conf | grep -v \"^[[:space:]]*#\" | head -300;elif [ -f /etc/syslog-ng/syslog-ng.conf ];then cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\"  | head -300;elif [ -f /etc/rsyslog.conf ];then cat /etc/rsyslog.conf | grep -v \"^[[:space:]]*#\"  | head -300;fi";
$appendix_cmd{16} = "(head -20 /var/log/syslog;head -20 /var/log/messages) 2>/dev/null";
$appendix_cmd{17} = "cat  /etc/shadow 2>/dev/null | head -300";
$appendix_cmd{18} = "cat  /etc/securetty 2>/dev/null | head -300";
$appendix_cmd{19} = "cat /etc/ftpaccess 2>/dev/null | grep -v \"^[[:space:]]*#\" | head -300";
$appendix_cmd{20} = "cat /etc/ftpaccess 2>/dev/null | grep \"^[[:space:]]*banner[[:space:]]*\\/.*\" | awk '{print \$2}' | while read user; do cat \$user;done | grep -v \"^[[:space:]]*#\" | head -300";
$appendix_cmd{21} = "cat /etc/vsftpd/chroot_list 2>/dev/null | grep \"^[[:space:]]*[^#]\" | head -300";
$appendix_cmd{22} = "if [ -f /etc/vsftpd.conf ];then cat /etc/vsftpd.conf |grep -v ^#|grep ftpd_banner;elif [ -f /etc/vsftpd/vsftpd.conf ];then cat /etc/vsftpd/vsftpd.conf |grep -v ^#|grep ftpd_banner;fi";

push(@appendixes, 1);
push(@appendixes, 2);
push(@appendixes, 3);
push(@appendixes, 4);
push(@appendixes, 5);
push(@appendixes, 6);
push(@appendixes, 7);
push(@appendixes, 8);
push(@appendixes, 9);
push(@appendixes, 10);
push(@appendixes, 11);
push(@appendixes, 12);
push(@appendixes, 13);
push(@appendixes, 14);
push(@appendixes, 15);
push(@appendixes, 16);
push(@appendixes, 17);
push(@appendixes, 18);
push(@appendixes, 19);
push(@appendixes, 20);
push(@appendixes, 21);
push(@appendixes, 22);

$appendix_cmd_sec{1} = "if [ -f /etc/shadow ];then lsattr /etc/shadow 2>/dev/null;fi;
if [ -f /etc/gshadow ];then lsattr /etc/group 2>/dev/null;fi;
if [ -f /etc/passwd ];then lsattr /etc/passwd 2>/dev/null;fi";
$appendix_cmd_sec{2} = "ps -ef | grep -v \"\\.sh\" | grep -v \"\\.pl\"";
$appendix_cmd_sec{3} = "ifconfig -a 2>/dev/null";
$appendix_cmd_sec{4} = "cat  /etc/group 2>/dev/null | head -300";
$appendix_cmd_sec{5} = "uname -a 2>/dev/null";
$appendix_cmd_sec{6} = "netstat -anp 2>/dev/null | head -300";
$appendix_cmd_sec{7} = "df -m 2>/dev/null";
$appendix_cmd_sec{8} = "lastb -100 2>/dev/null";
$appendix_cmd_sec{9} = "last -100 2>/dev/null";
$appendix_cmd_sec{10} = "cat /etc/passwd 2>/dev/null | head -300";
$appendix_cmd_sec{11} = "rpm -qa | head -100";
$appendix_cmd_sec{12} = "chkconfig --list | head -50";
$appendix_cmd_sec{13} = "version=`lsb_release -a 2>/dev/null | grep \"Description\" | awk -F: '{print \$2}'`;if [ -n \"\$version\" ];then echo \$version;else if [ -z \"\$version\" ]; then echo \"\";else cat /etc/SuSE-release | grep -v \"VERSION\" | grep -v \"PATCHLEVEL\";fi;fi";
$appendix_cmd_sec{14} = "rm -fv /tmp/DAS{dastmp}_dassec_grub_tmp";
$appendix_cmd_sec{15} = "if [ -f /etc/syslog.conf ];then cat /etc/syslog.conf | grep -v \"^[[:space:]]*#\" | head -300;elif [ -f /etc/syslog-ng/syslog-ng.conf ];then cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\"  | head -300;elif [ -f /etc/rsyslog.conf ];then cat /etc/rsyslog.conf | grep -v \"^[[:space:]]*#\"  | head -300;fi";
$appendix_cmd_sec{16} = "(head -20 /var/log/syslog;head -20 /var/log/messages) 2>/dev/null";
$appendix_cmd_sec{17} = "cat  /etc/shadow 2>/dev/null | head -300";
$appendix_cmd_sec{18} = "cat  /etc/securetty 2>/dev/null | head -300";
$appendix_cmd_sec{19} = "cat /etc/ftpaccess 2>/dev/null | grep -v \"^[[:space:]]*#\" | head -300";
$appendix_cmd_sec{20} = "cat /etc/ftpaccess 2>/dev/null | grep \"^[[:space:]]*banner[[:space:]]*\\/.*\" | awk '{print \$2}' | while read user; do cat \$user;done | grep -v \"^[[:space:]]*#\" | head -300";
$appendix_cmd_sec{21} = "cat /etc/vsftpd/chroot_list 2>/dev/null | grep \"^[[:space:]]*[^#]\" | head -300";
$appendix_cmd_sec{22} = "if [ -f /etc/vsftpd.conf ];then cat /etc/vsftpd.conf |grep -v ^#|grep ftpd_banner;elif [ -f /etc/vsftpd/vsftpd.conf ];then cat /etc/vsftpd/vsftpd.conf |grep -v ^#|grep ftpd_banner;fi";

 # 生成结果文件
sub add_point{
 my ($str, $flag, $command, $value, $tpl_tid)= @_;
 $str .= "    ".'<ck_'.$tpl_tid.'_'.'common_'.$flag.'>'."\n";
 $str .= "      ".'<cmd><![CDATA['.$command."]]></cmd>\n";
 $str .= "      <value><![CDATA[".$value."]]></value>\n";
 $str .= "    ".'</ck_'.$tpl_tid.'_'.'common_'.$flag.'>'."\n";
 return $str;}
sub add_appendix{
 my ($str, $flag, $command, $value, $tpl_tid)= @_;
 $str .= "    ".'<ck_'.$tpl_tid.'_'.'info_'.$flag.'>'."\n";
 $str .= "      ".'<cmd><![CDATA['.$command."]]></cmd>\n";
 $str .= "      <value><![CDATA[".$value."]]></value>\n";
 $str .= "    ".'</ck_'.$tpl_tid.'_'.'info_'.$flag.'>'."\n";
 return $str;}
 sub generate_xml{
 $ARGC = @ARGV;
if($ARGC lt 2){
 print qq{usag: 0132.pl <SU用户(SU或高权限用户)> <SU密码>};
exit;}
 my $date = `date +%Y-%m-%d`;
 chomp $date;
my $ipaddr = "";
my $ipaddr = `ifconfig | grep -oE 'inet[[:space:]]*(addr)?\.?([0-9]{1,3}\.?){4}' | grep -v 127 | grep -oE '([0-9]{1,3}\.?){4}' | head -n 1`;
chomp $ipaddr;
$ipaddr =~ s/^\s+|\s+$//g;
 my $xml_str = "";
 $xml_str .='<?xml version="1.0" encoding="UTF-8"?>'."\n";
 $xml_str .= '<root tid= "'.'0132'.'" level="'.''.'" ip="'.$ipaddr.'" time="'.$date.'">'."\n";
 $xml_str .= '<ck_'.$tpl_tid.'_init_0>'."
<cmd><![CDATA[]]></cmd>
"."<value><![CDATA[]]></value>
".'</ck_'.$tpl_tid.'_init_0>'."
";
 foreach $key (@checkpoints){
 $value = $cmd{$key};
 $value_sec = $cmd_sec{$key};
 my $tmp_result = `$value`;
 chomp $tmp_result;
 $tmp_result =~ s/>/&gt;/g;
 $xml_str = &add_point( $xml_str, $key, $value_sec, $tmp_result, $tpl_tid );}  
 foreach $key (@appendixes){
 $value = $appendix_cmd{$key};
 $value_sec = $appendix_cmd_sec{$key};
 my $tmp_result = `$value`;
 chomp $tmp_result;
 $tmp_result =~ s/>/&gt;/g;
 $xml_str = &add_appendix( $xml_str, $key, $value_sec, $tmp_result, $tpl_tid );}
 $xml_str .= "</root>"."\n";
 $xmlfile = $ipaddr."_"."0132"."_chk.xml";
 print $xmlfile."\n";
 open XML,">/tmp/".$xmlfile or die "Cannot create ip.xml:$!";
 print XML $xml_str;
 print "end write xml\n";
 print "OK\n";}
 generate_xml();
