# installation


## open a terminal, evaluate all lines individually

### create dir and go there
```bash
mkdir ~/dev && cd ~/dev
``` 
### download repository
```bash
git clone https://github.com/ArtScience-Interfaculty/IoT-WtF.git
touch ~/.bash_aliases
```

### add IoT-WtF aliases
```bash
echo "source /home/pi/dev/IoT-WtF/bash/bash_aliases" >> ~/.bash_aliases
```

### for git, set username and email (change it to apply for you)
```bash
USERNAME="Ted.Kaczynski"
EMAIL="Ted.Kaczynski@"\`hostname\` # change only the name before @
echo "git config --global user.name  $USERNAME" >> ~/.bash_aliases
echo "git config --global user.email $EMAIL" >> ~/.bash_aliases
```

### finally, load the aliases
```bash
source ~/.bash_aliases
```
