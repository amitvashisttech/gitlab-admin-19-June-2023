 10  git init --bare my-first-project
   11  ls
   12  mkdir my-second-project 
   13  ls
   14  cd my-first-project/
   15  ls -a 
   16  s
   17  ls
   18  cd ..
   19  ls
   20  cd my-second-project/
   21  ls
   22  ls -a 
   23  git init 
   24  ls -a 
   25  ls -a .git/
   26  ls
   27  git config --global --list 
   28  ls
   29  echo  "Welcome to the Git Demo1" > hello.txt 
   30  ls
   31  git status 
   32  git add hello.txt 
   33  git status 
   34  git commit 
   35  git config --global user.email "amitvashist7@outlook.com"
   36  git config --global user.name "Amit Vashist" 
   37  git config --global --list 
   38  git commit 
   39  git status 
   40  ls
   41  cat hello.txt 
   42  echo  "Welcome to the Git Demo - 2" >> hello.txt 
   43  git status 
   44  ls
   45  echo  "Welcome to the Git Demo - 2" >> hello-2.txt 
   46  echo  "Welcome to the Git Demo - 2" >> hello-3.txt 
   47  ls
   48  git status 
   49  git add . 
   50  git status 
   51  git commit -m "Added two new files as demo 2" 
   52  git status 
   53  git logs 
   54  git log
   55  git config --global --list 
   56  git config --global  core.editor vi 
   57  git config --global  help.autocorrect 1
   58  git config --global --list 
   59  git logs
   60  history 
   61  echo "Apple Pie" | git hash-object --stdin
   62  echo "Apple pie" | git hash-object --stdin
   63  echo "Apple Pie " | git hash-object --stdin
   64  echo "Apple Pie" | git hash-object --stdin
   65  echo "Apple Pie" | git hash-object --stdin -w 
   66  git cat-file 23991897e13e47ed0adb91a0082c31c82fe0cbe5 -t 
   67  git cat-file 23991897e13e47ed0adb91a0082c31c82fe0cbe5 -p 
   68  echo "amitvashist7@outlook.com" | git hash-object --stdin
   69  git cat-file f1e1ba100e08abd182ccc5ce92b82429ed57a93d -p 
   70  echo "amitvashist7@outlook.com" | git hash-object --stdin -w 
   71  git cat-file f1e1ba100e08abd182ccc5ce92b82429ed57a93d -p 
   72  ls 
   73  ls -a 
   74  cd .git/
   75  ls
   76  cd objects/
   77  ls -ltr 
   78  ls -R f1/
   79  ls -R 23/
   80  git cat-file f1e1ba100e08abd182ccc5ce92b82429ed57a93d -p 
   81  git cat-file 23991897e13e47ed0adb91a0082c31c82fe0cbe5 -p 
