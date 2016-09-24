# installation


# open a terminal

mkdir ~/dev && cd ~/dev # create dir and go there
 
git clone https://github.com/ArtScience-Interfaculty/IoT-WtF.git # download repository

touch ~/.bash_aliases

echo "source /home/pi/dev/IoT-WtF/bash/bash_aliases" >> ~/.bash_aliases  # link to bash aliases


# for git, set username and email

USERNAME="h4nkw1ll1@ms"

EMAIL="h4nk@"\`hostname\`

echo "git config --global user.name  $USERNAME" >> ~/.bash_aliases

echo "git config --global user.email $EMAIL" >> ~/.bash_aliases


# finally, load the aliases

source ~/.bash_aliases
