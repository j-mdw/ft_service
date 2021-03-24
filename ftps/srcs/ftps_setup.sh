#!/bin/sh

mkdir -R /srv/ftp
chown nobody:nogroup /srv/ftp
echo "Good morning" | tee /srv/ftp/anon.txt
#chmod a+rwx ftp

cat <<EOF | tee /etc/vsftpd/vsftpd.conf
listen=YES
local_enable=YES
xferlog_enable=YES
connect_from_port_20=YES
pam_service_name=vsftpd
seccomp_sandbox=NO
#local_umask=022

anon_umask=022
# Enable upload by local user.
write_enable=YES

# Enable read by anonymous user (without username and password).
secure_chroot_dir=/var/empty
anonymous_enable=YES
anon_root=/srv/ftp
no_anon_password=YES
anon_upload_enable=YES
anon_mkdir_write_enable=YES
anon_other_write_enable=YES
#hide_ids=YES

#port_enable=YES

pasv_enable=YES
pasv_max_port=10100
pasv_min_port=10098

rsa_cert_file=/root/certs/cert.pem
rsa_private_key_file=/root/certs/key.pem
ssl_enable=YES
allow_anon_ssl=YES
ssl_tlsv1=YES
ssl_sslv2=NO
ssl_sslv3=NO

EOF

vsftpd /etc/vsftpd/vsftpd.conf
