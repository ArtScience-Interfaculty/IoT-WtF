function push(){
  #git add .
  git add --all .
  echo "enter name/message of the commit (or just enter for default message; date user@hostnamense) :"
  read MSG

  if [ -z "${MSG}" ]; then
    echo "empty message, using default"
    MSG=`whoami`"@"`hostname`" ("`date`")"
  fi

  git commit -m "$MSG"
  git push
  git lg | head -n20
}

function pull(){
  cd .git/ && du -sch && cd .. && du -sch
  git lg | head -n20
  #git status
  git pull
}

function commit(){
  #git add .
  git add --all .
  MSG=`whoami`"@"`hostname`" ("`date`")"
  git commit -m $MSG
}

