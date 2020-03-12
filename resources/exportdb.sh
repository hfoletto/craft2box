echo "Backing up db..."
sudo mysqldump -uroot -proot --all-databases > /vagrant/resources/mysql_backup.sql
echo "DB backup done."