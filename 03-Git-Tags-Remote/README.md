234  mkdir 02-Git-Branch
  235  ls
  236  history 
  237  ls
  238  vim 02-Git-Branch/
  239  vim 02-Git-Branch/README.md 
  240  ls
  241  git branch -M main
  242  ls
  243  git branch 
  244  ls
  245  git config --list 
  246  git remote add origin https://github.com/amitvashisttech/gitlab-admin-19-June-2023.git
  247  git push -u origin main
  248  ls
  249  git add . 
  250  git status
  251  git add . ; git commit -m "02-Git-Branch" 
  252  git push 
  253  git config --global credential.helper 'cache --timeout=360000'
  254  git push 
  255  ls
  256  cd ..
  257  ls
  258  git clone https://github.com/amitvashisttech/gitlab-admin-19-June-2023.git
  259  ls
  260  cd gitlab-admin-19-June-2023/
  261  ls
  262  cd .
  263  cd ..
  264  ls
  265  cd my-second-project/
  266  ls
  267  echo "Checking GitHub Updates" > hello.txt 
  268  git add . ; git commit -m "Git Update" ; git push 
  269  ls
  270  cd ..
  271  ls
  272  cd gitlab-admin-19-June-2023/
  273  ls
  274  git log 
  275  git pull 
  276  ls
  277  git log 
  278  ls
  279  git pull 
  280  git branch 
  281  cd ..
  282  ls
  283  cd my-second-project/
  284  ls
  285  git pull 
  286  git branch 
  287  git checkout dev 
  288  git push 
  289  git push --set-upstream origin dev
  290  git checkout qa
  291  git push --set-upstream origin dev
  292  git push --set-upstream origin qa
  293  ls
  294  git checkout main 
  295  ls
  296  git log 
  297  git tag release_1.0
  298  ls
  299  git tags 
  300  git tag 
  301  git push tag 
  302  git push tags 
  303  git push --tags 
  304  ls
  305  rm -rf Dev hello.txt Qa 
  306  ls
  307  git add . ; git commit -m "Extra files has been removed" ; git push 
  308  ls
  309  git log
  310  git tag release_2.0
  311  git push --tags 
