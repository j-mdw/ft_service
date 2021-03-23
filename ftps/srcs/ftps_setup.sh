#!/bin/sh

cat <<EOF | tee /etc/vsftpd/vsftpd.conf
listen=YES
local_enable=YES
xferlog_enable=YES
connect_from_port_20=YES
pam_service_name=vsftpd
seccomp_sandbox=NO

# Enable upload by local user.
write_enable=YES

# Enable read by anonymous user (without username and password).
secure_chroot_dir=/var/empty
anonymous_enable=YES
anon_root=/srv/ftp
no_anon_password=YES
EOF

mkdir /srv/ftp
echo "anon" | tee /srv/ftp/anon.txt
#chown nobody:nogroup /srv/ftp

vsftpd
