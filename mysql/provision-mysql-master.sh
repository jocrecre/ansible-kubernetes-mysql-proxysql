#!/bin/bash


mysql -uroot -pmysqlrootpassword -h10.0.2.5 -P30036 < database_example_test.sql
mysql -uroot -pmysqlrootpassword -h10.0.2.5 -P30036 -e "GRANT ALL PRIVILEGES ON database_example_test.*  TO 'perico'@'%' IDENTIFIED BY 'perico';FLUSH PRIVILEGES;"
mysql -uroot -pmysqlrootpassword -h10.0.2.5 -P30036 -e "GRANT REPLICATION SLAVE ON *.* TO 'juan'@'%' IDENTIFIED BY 'juan';FLUSH PRIVILEGES;"
mysql -uroot -pmysqlrootpassword -h10.0.2.5 -P30036 -e "USE database_example_test;FLUSH TABLES WITH READ LOCK;"
mysql -uroot -pmysqlrootpassword -h10.0.2.5 -P30036 -e "SHOW MASTER STATUS;"
# mysqldump -u root -pmysqlrootpassword database_example_test.sql > database_example_test.sql
mysql -uroot -pmysqlrootpassword -h10.0.2.5 -P30036 -e "UNLOCK TABLES;"
