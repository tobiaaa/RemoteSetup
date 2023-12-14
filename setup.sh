#! /bin/sh

echo "Setting up Remote compute node";

mkdir data
mkdir src

echo "Enter GitHub Username";
read git_user;
git config --global user.name $git_user;

echo "Enter GitHub E-Mail";
read git_mail;
git config --global user.email $git_mail;

