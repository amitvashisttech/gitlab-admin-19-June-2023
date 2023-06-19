  206  git branch 
  207  git branch dev 
  208  git branch qa 
  209  ls
  210  git branch 
  211  git checkout dev 
  212  ls
  213  mkdir Dev 
  214  echo  "Welcome to our Dev Branch" > Dev/readme.txt 
  215  git add . ; git commit -m "Added a DEV Readme" 
  216  ls
  217  git checkout qa 
  218  ls
  219  mkdir Qa 
  220  echo  "Welcome to our QA Branch" > Qa/readme.txt 
  221  git add . ; git commit -m "Added a QA Readme" 
  222  ls
  223  git branch 
  224  git checkout master 
  225  git log --oneline --graph
  226  git merge dev 
  227  ls
  228  git branch 
  229  git merge qa
  230  git branch 
  231  ls
  232  git log --oneline --graph
  233  ls
  234  git branch -d dev 
