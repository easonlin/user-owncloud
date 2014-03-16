require:
	apt-get -y install lamp-server^
	mysql_secure_installation
	apt-get -y install php5-gd php-xml-parser php5-intl smbclient curl libcurl3 php5-curl
	a2enmod rewrite
	a2enmod headers
	a2enmod ssl
	iptables -A INPUT -m state --state NEW -p tcp --dport 443 -j ACCEPT
	cp -f etc/apache2/sites-available/default-ssl /etc/apache2/sites-available/default-ssl
	ln -s /etc/apache2/sites-available/default-ssl /etc/apache2/sites-enabled/000-default-ssl
	rm -f /etc/apache2/sites-enabled/000-default
	service apache2 restart
web:
	wget http://download.owncloud.org/community/owncloud-latest.tar.bz2
	tar -xjf owncloud-latest.tar.bz2
	mv owncloud /var/www
	cd /var/www; sudo chown -R www-data:www-data owncloud
	rm -rf owncloud-latest*
mysql:
	m4 -DPASSWORD=$(PASSWORD) owncloud.sql|tr "\\n" " "|tee log|xargs -0 -I{} mysql -u root -p -e "{}"
