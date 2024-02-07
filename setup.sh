#! /bin/sh

echo "Setting up Remote compute node";

mkdir ~/data
mkdir ~/src

# Default values
username=""
email=""

# Parse command line options
while getopts ":u:e:" opt; do
  case ${opt} in
    u )
      username=$OPTARG
      ;;
    e )
      email=$OPTARG
      ;;
    \? )
      echo "Invalid option: $OPTARG" 1>&2
      ;;
    : )
      echo "Invalid option: $OPTARG requires an argument" 1>&2
      ;;
  esac
done
shift $((OPTIND -1))

# If username or email were not provided as command-line arguments, prompt the user
if [ -z "$username" ]; then
  read -p "Enter your GitHub username: " username
fi

if [ -z "$email" ]; then
  read -p "Enter your GitHub email: " email
fi

git config --global user.name $git_user;
git config --global user.email $git_mail;

git config --global credential.helper store

echo "Installing applications";
sudo apt -y install vim unzip zip aria2 nano build-essential
