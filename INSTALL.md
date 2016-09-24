# installation

- open a terminal, type
mkdir ~/dev
git clone https://github.com/ArtScience-Interfaculty/IoT-WtF.git

- link to bash aliases
touch ~/.bash_aliases
echo "source /home/pi/dev/IoT-WtF/bash/bash_aliases" >> ~/.bash_aliases

- for git, set username and email
USERNAME="h4nkw1ll1@ms"
EMAIL="h4nk@"`hostname`
echo "git config --global user.name  $USERNAME" >> ~/.bash_aliases
echo "git config --global user.email $EMAIL" >> ~/.bash_aliases

- finally load the aliases
source ~/.bash_aliases
