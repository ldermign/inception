ALTER USER 'root'@'localhost' IDENTIFIED BY 'New_passwd42';
-- UPDATE mysql.user SET authentication_string = PASSWORD('New_passwd42')     WHERE User = 'root' AND Host = 'localhost';
FLUSH PRIVILEGES;