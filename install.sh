#!/bin/bash

homedir='/Users/$(whoami)/'

echo 'Install homebrew'
echo '----------------'
echo install homebrew
sudo rm -rf /usr/local/Cellar /usr/local/.git && brew cleanup
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $homedir
eval "$(/opt/homebrew/bin/brew shellenv)"

echo 'Install GIT'
echo '-----------'
brew install git

echo 'Install node'
echo '------------'
brew install node

echo 'Configure npm'
echo '-------------'
# Create a directory for global packages and tell npm where to store globally installed packages
mkdir "${HOME}/.npm-packages"
npm config set prefix "${HOME}/.npm-packages"

echo 'Install pkg-config'
echo '------------------'
brew install pkg-config

echo 'Install wget'
echo '------------'
brew install wget

echo 'Install PHPStorm'
echo '----------------'
brew install --cask phpstorm

echo 'Install Google Chrome'
echo '---------------------'
brew install --cask google-chrome

echo 'Install Mozilla Firefox'
echo '---------------'
brew install --cask firefox

echo 'Install Microsoft Edge'
echo '----------------------'
brew install --cask microsoft-edge

echo 'Install TablePlus'
echo '-----------------'
brew install --cask tableplus

echo 'Install php'
echo '-----------'
brew install php@8.2
brew link --overwrite --force php@8.2

echo 'Install composer'
echo '----------------'
EXPECTED_COMPOSER_CHECKSUM="$(curl https://composer.github.io/installer.sig)"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_COMPOSER_CHECKSUM="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"
if [ "$EXPECTED_COMPOSER_CHECKSUM" != "$ACTUAL_COMPOSER_CHECKSUM" ]
then
    >&2 echo 'Error: Invalid installer checksum'
    rm composer-setup.php
    exit 1
fi
php composer-setup.php
rm composer-setup.php
mv composer.phar /usr/local/bin/composer

echo 'Install imagemagick'
echo '-------------------'
brew install imagemagick

echo 'Install imagick'
echo '---------------'
pecl install imagick

echo 'Install memcached'
echo '-----------------'
pecl install memcached

echo 'Install xDebug'
echo '--------------'
pecl install xdebug

echo 'Install Laravel Valet'
echo '---------------------'
composer global require laravel/valet
valet install

echo 'Install Mantis2GitHub'
echo '---------------------'
composer global require artemeon/mantis2github

echo 'Install ARTEMEON Installer'
echo '---------------------'
composer global require artemeon/installer

echo 'Install PHP Monitor'
echo '-------------------'
brew tap nicoverbruggen/homebrew-cask
brew install --cask phpmon

echo 'Install DBngin'
echo '--------------'
brew install --cask dbngin

echo 'Install pnpm'
echo '------------'
brew install pnpm

echo 'Install Microsoft Teams'
echo '-----------------------'
brew install --cask microsoft-teams

echo '++++++++++++++++++++++++++++++'
echo '++++++++++++++++++++++++++++++'
echo 'All done!'
echo '++++++++++++++++++++++++++++++'
echo '++++++++++++++++++++++++++++++'
