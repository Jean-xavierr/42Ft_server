mv ./utils/my.cnf /etc/
cd /var/lib/mysql/
touch mysql.sock
chown -R mysql:mysql mysql.sock
