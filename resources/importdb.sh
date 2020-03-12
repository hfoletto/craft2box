FILE=/vagrant/resources/mysql_backup.sql
if test -f "$FILE";
  then
    sudo mysql -uroot -proot < $FILE
    echo "Database restored."
  else
    echo "No database file found to restore."
fi