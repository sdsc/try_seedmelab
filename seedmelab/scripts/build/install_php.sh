echo "Installing PHP $PHP_VERSION..."

if [ $PHP_VERSION = "7.1" ]
then
  apt install -y software-properties-common
  add-apt-repository ppa:ondrej/php
  apt install -y php7.1 php7.1-fpm php7.1-common php7.1-opcache php7.1-cli php7.1-gd php7.1-curl php7.1-sqlite php7.1-pgsql php7.1-mysql php7.1-xml php7.1-zip php7.1-mbstring
elif [ $PHP_VERSION = "7.2" ]
then
  apt install -y software-properties-common
  add-apt-repository ppa:ondrej/php
  apt install -y php7.2 php7.2-fpm php7.2-common php7.2-opcache php7.2-cli php7.2-gd php7.2-curl php7.2-sqlite php7.2-pgsql php7.2-mysql php7.2-xml php7.2-zip php7.2-mbstring
elif [ $PHP_VERSION = "7.3" ]
then
  apt install -y software-properties-common
  add-apt-repository ppa:ondrej/php
  apt install -y php7.3 php7.3-fpm php7.3-common php7.3-opcache php7.3-cli php7.3-gd php7.3-curl php7.3-sqlite php7.3-pgsql php7.3-mysql php7.3-xml php7.3-zip php7.3-mbstring
elif [ $PHP_VERSION = "7.4" ]
then
  apt install -y software-properties-common
  add-apt-repository ppa:ondrej/php
  apt install -y php7.4 php7.4-fpm php7.4-common php7.4-opcache php7.4-cli php7.4-gd php7.4-curl php7.4-sqlite3 php7.4-pgsql php7.4-mysql php7.4-xml php7.4-zip php7.4-mbstring
else
  echo "Invalid PHP version: $PHP_VERSION..."
fi