#!bin/bash
sudo apt update
sudo apt full-upgrade --auto-remove --purge -y
wget https://gist.githubusercontent.com/cedarex/57ddb18273393246f67f8f9f77804598/raw/b5b092ab477d765a06ebf19fade355ffc6ef0fbd/passenger.conf
wget https://gist.githubusercontent.com/cedarex/21c3c7a2120cb63dca1ddd3f70face0c/raw/83c9573e60e4a15e104b4490f0c2ed81fcc7b674/bitcoin.conf
sudo apt remove -y apache2
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
sudo apt install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev imagemagick gsfonts nodejs nginx-extras redis-server software-properties-common python-software-properties nano dialog vim
sudo add-apt-repository -y ppa:bitcoin/bitcoin
sudo apt update
sudo apt install -y bitcoind
cd
git clone git://github.com/rbenv/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
git clone git://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-b$
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
rbenv install 2.2.2
rbenv global 2.2.2
echo "gem: --no-ri --no-rdoc" > ~/.gemrc
gem install bundler
rbenv rehash
read -p "Press [Enter] key to continue..."
mkdir -p ~/.bitcoin
cp bitcoin.conf ~/.bitcoin/bitcoin.conf
dialog --msgbox "enter bitcoind user password settings and save" 10 20
sudo nano ~/.bitcoin/bitcoin.conf
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
sudo dpkg -i erlang-solutions_1.0_all.deb
sudo apt update
suod apt install erlang
echo "deb https://dl.bintray.com/rabbitmq/debian xenial main" | sudo tee /etc/apt/sources.list.d/bintray.rabbitmq.list
wget -O- https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | sudo apt-key add -
sudo apt update
sudo apt install -y rabbitmq-server
sudo rabbitmq-plugins enable rabbitmq_management
sudo service rabbitmq-server restart
wget http://localhost:15672/cli/rabbitmqadmin
chmod +x rabbitmqadmin
sudo mv rabbitmqadmin /usr/local/sbin
sudo add-apt-repository 'deb http://archive.ubuntu.com/ubuntu xenial universe'
sudo apt update
sudo apt install -y mysql-server redis-server libmysqlclient-dev dirmngr gnupg
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7
sudo apt install -y apt-transport-https ca-certificates

# Install Passenger + Nginx
sudo apt-get install -y nginx-extras passenger
#bitcoind
sudo cp passenger.conf /etc/nginx/passenger.conf
#sudo echo "include  /etc/nginx/passenger.conf;" >> /etc/nginx/nginx.conf
#echo "include  /etc/nginx/passenger.conf;" |sudo tee -a /etc/nginx/nginx.conf
cp /etc/nginx/nginx.conf .
sed -i '64i\passenger_root /usr/lib/ruby/vendor_ruby/phusion_passenger/locations.ini;' nginx.conf
sed -i '65i\passenger_ruby /home/deploy/.rbenv/shims/ruby;' nginx.conf
sudo cp nginx.conf /etc/nginx/nginx.conf
echo "remaining steps 10"
echo "export RAILS_ENV=production" >> ~/.bashrc
source ~/.bashrc
mkdir -p ~/peatio
#git clone https://github.com/ctubio/Krypto-trading-bot.git ~/K
git clone https://github.com/cedarex/cedarex.git ~/peatio/current
git checkout latest
dialog --msgbox "generate your private seed key and save" 10 20
sudo nano ~/peatio/current/config/initializers/secret_token.rb
cd ~/cedarex/current/
pwd
#sudo apt-get install -y ruby-bundler
bundle install --without development test --path vendor/bundle
bin/init_config
dialog --msgbox "enter pusher <US1> settings and save" 10 20
sudo nano ~/peatio/current/config/application.yml
dialog --msgbox "enter database password  in settings and save" 10 20
sudo nano ~/peatio/current/config/database.yml
dialog --msgbox "enter bitcoind user password settings and :q to save" 10 20
sudo nano ~/peatio/current/config/currencies.yml
cd ~/cedarex/current/
sudo service mysql restart
bundle exec rake db:setup
bundle exec rake assets:precompile
pwd
#cd /home/deploy/K/
#pwd
#make install
#cd ..
#git clone https://github.com/scatterp3/cedarex.git ~/jpeatio/current
#cd ~/peatio/current
#rbenv global jruby-9.1.13.0
#gem install bundler
#bundle install
sudo rm /etc/nginx/sites-enabled/default
sudo ln -s /home/deploy/peatio/current/config/nginx.conf /etc/nginx/conf.d/peatio.conf
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install -y python-certbot-nginx
sudo service nginx restart
bundle exec rake daemons:start
#sudo service nginx status
bundle exec rake daemons:status
mv pc ..
echo "You can now setup ssl optionally start bitcoind if you have over 2gb or visit the website (its up and running)"
