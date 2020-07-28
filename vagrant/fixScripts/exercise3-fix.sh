#!/bin/bash
#add fix to exercise3 here
sed -i 's/deny from all/Allow from all/g'  /etc/apache2/sites-available/default
service apache2 restart

