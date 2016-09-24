# installation


# open a terminal, evaluate all lines individually

mkdir ~/dev && cd ~/dev # create dir and go there
 
git clone https://github.com/ArtScience-Interfaculty/IoT-WtF.git # download repository

touch ~/.bash_aliases

echo "source /home/pi/dev/IoT-WtF/bash/bash_aliases" >> ~/.bash_aliases  # add IoT-WtF aliases


# for git, set username and email (change it to apply for you)

USERNAME="Ted.Kaczynski"

EMAIL="Ted.Kaczynski@"\`hostname\` # change only the name before @

echo "git config --global user.name  $USERNAME" >> ~/.bash_aliases

echo "git config --global user.email $EMAIL" >> ~/.bash_aliases


# finally, load the aliases

source ~/.bash_aliases
