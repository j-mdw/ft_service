#!/bin/sh

cat <<EOF | tee /etc/vsftpd/vsftpd.conf
chroot_local_user=YES
allow_writeable_chroot=YES
local_enable=YES
xferlog_enable=YES
connect_from_port_20=YES
pam_service_name=vsftpd
local_umask=022

vsftpd_log_file=/proc/1/fd/1

# Enable upload by local user.
write_enable=YES

# Enable read by anonymous user (without username and password).
#secure_chroot_dir=/var/empty
#anonymous_enable=NO
#anon_root=/srv/ftp
#pasv_enable=YES
#pasv_addr_resolve=YES
#no_anon_password=YES

seccomp_sandbox=NO
EOF

#mkdir /srv/ftp
#echo "anon" | tee /srv/ftp/anon.txt
#chown nobody:nogroup /srv/ftp

vsftpd
