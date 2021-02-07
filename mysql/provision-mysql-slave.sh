#!/bin/bash


mysql -uroot -pmysqlrootpassword -h10.0.2.5 -P30037 < database_example_test.sql
mysql -uroot -pmysqlrootpassword -h10.0.2.5 -P30037 -e "GRANT ALL PRIVILEGES ON database_example_test.*  TO 'perico'@'%' IDENTIFIED BY 'perico';FLUSH PRIVILEGES;"
mysql -uroot -pmysqlrootpassword -h10.0.2.5 -P30037 -e "GRANT REPLICATION SLAVE ON *.* TO 'juan'@'%' IDENTIFIED BY 'juan';FLUSH PRIVILEGES;"
mysql -uroot -pmysqlrootpassword -h10.0.2.5 -P30037 -e "CHANGE MASTER TO MASTER_HOST='10.0.2.5',MASTER_PORT=30036,MASTER_USER='juan', MASTER_PASSWORD='juan', MASTER_LOG_FILE='mysql-bin.000001', MASTER_LOG_POS=154861;"
mysql -uroot -pmysqlrootpassword -h10.0.2.5 -P30037 -e "START SLAVE;"
mysql -uroot -pmysqlrootpassword -h10.0.2.5 -P30037 -e "SHOW SLAVE STATUS\G;"
