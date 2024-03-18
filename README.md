# Commands AliasCP

##### Custom Alias

This project provides a set of optimized 
alias commands, designed to improve efficiency and user experience at the command line. It simplifies common tasks, speeds up system navigation, and provides intuitive shortcuts for common operations. Customize your environment with these carefully selected aliases to boost your productivity. Simplify your life in the terminal with this set of ready-to-use aliases!

<p align="center"><img src="https://img.shields.io/badge/alias-linux?style=for-the-badge&amp;logo=linux&amp;logoColor=white&amp;labelColor=32a848&amp;color=0f23d9" alt="shields"></p>

# Modify the ~/.bashrc file to add aliases

## Steps:

1. Open a terminal.

2. Open the ```~/.bashrc``` file with your favorite text editor. You can use nano, gedit, vim or another editor.

```shell
nano ~/.bashrc
```

4. Scroll to the end of the file.

5. To make a reference to the 
alias command file, add the following line to the end of the file.

```shell
source pathThisProject/CommandsAliasCP/CustomCommandsLinux.sh
```

6. Save the changes and close the editor.

7. Reload the ```~/.bashrc``` file for the changes to take effect in the current terminal session.

```shell
source ~/.bashrc
```

Now, the aliases you added will be available in your terminal session. You can customize these 
aliases according to your needs. Remember that any changes to the ```~/.bashrc``` file will only affect new terminal sessions or sessions that are reloaded after the changes are made.

# Content

### Update bash show branch
```shell
parse_git_branch() {
    git rev-parse --abbrev-ref HEAD 2> /dev/null
}

PS1='\[\033[01;32m\]\u:\[\033[01;34m\]\w\[\033[31m\]$(__git_ps1 " (%s)")\[\033[00m\]$ '
```

## Functions

### Move to a project
```shell
function move_to_project () {
    local project_path=~/projects/$1
    if [ -z "$1" ]; then
        project_path=~/projects/
    fi

    cd "$project_path" || return
}
```

### Sudo pass
```shell
function sup () {
     local password="$1"
    local command="$2"

    if [ -z "$password" ]; then
        sudo "$command"
    else
        echo "$password" | sudo -S bash -c "$command"
    fi
}
```

### Start service docker compose
```shell
function dcstart () {
    local password="$1"
    local docker_command="/etc/init.d/docker start"
    
     if [ -z "$password" ]; then
        sudo $docker_command
    else
        sup "$password" "$docker_command"
    fi
}
```

### Git add
```shell
function ga () {
    git add $1
}
```

### Into to principal pod of project
```shell
function into_to_pod () {
    local project_path=~/projects/$1
    if [ -z "$1" ]; then
        echo 'project is required'
    fi

    kubectl exec -it $(kubectl get pods | grep $1 | awk '!/horizon/ {print $1}') -- bash
}
```

### show log principal pod of project
```shell
function get_logs_pod () {
    local project_path=~/projects/$1
    if [ -z "$1" ]; then
        echo 'project is required'
    fi

    kubectl logs $(kubectl get pods | grep $1 | awk '!/horizon/ {print $1}')
}
```

## Commands

## PCB

### Go to cp-shops-pcb 
```shell
alias pcbcd='move_to_project cp-shops-pcb'
```
### Open PCB
```shell
alias pcbcode='pcbcd && phpcode'
```
### Up PCB
```shell
alias pcbup='pcbcd && dcupd && cdpj'
```
### Into pod PCB
```shell
alias pcbpod="into_to_pod pcb"
```
### show logs pcb
```shell
alias pcblog="get_logs_pod pcb"
```
### get all pods
```shell
alias getpods="kubectl get pods"
```

## CP

### Go to CP
```shell
alias cpcd='move_to_project cp-shop'
```
### Up CP
```shell
alias cpup='cpcd && dcupd && cdpj'
```
### Open CP
```shell
alias cpcode='cpcd && phpcode && cdpj'
```
### Work on CP
```shell
alias cpwork='cpcd && phpcode && dcupd'
```

## AB

### Go to AB
```shell
alias abcd='move_to_project ab-shop'
```
### Up AB
```shell
alias abup='abcd && dcupd && cdpj'
```
### Open AB
```shell
alias abcode='abcd && phpcode && cdpj'
```
### Work on AB
```shell
alias abwork='abcd && phpcode && dcupd'
```
## base-shops-microlith

### Go to bmi
```shell
alias bmicd='move_to_project base-shops-microlith'
```
### Up bmi
```shell
alias bmiup='bmicd && dcupd && nrd'
```
### Open bmi
```shell
alias bmicode='bmicd && phpcode && cdpj'
```
### Work on bmi
```shell
alias bmiwork='bmicd && dcupd && phpcode'
```

## Web desktop (nuxt)

### Go to cp-web-desktop
```shell
alias wdcd='move_to_project cp-web-desktop'
```
### Up web-desktop this command does not release the terminal
```shell
alias wdup='wdcd && nrd'
```
### Open WD
```shell
alias wdcode='wdcd && phpcode'
```
### Work on WD
```shell
alias wdwork='wdcd && phpcode && nrd'
```
## Fake Backend

### Go to Fake Backend
```shell
alias fbcd='move_to_project cp-shops-fake-backend'
```
### Up Fake Backend
```shell
alias fbup='fbcd && dcupd && cdpj'
```
### Open Fake Backend
```shell
alias fbcode='fbcd && phpcode && cdpj'
```
### Work on Fake Backend
```shell
alias fbwork='fbcd && dcupd && phpcode'
```

## CommandsAliasCP

### Go to CommandsAliasCP
```shell
alias cmacd='cdown && cd CommandsAliasCP'
```
### Open CommandsAliasCP
```shell
alias cmacode='cmacd && phpcode && cdpj'
```
### Visual code CommandsAliasCP
```shell
alias cmavcode='cmacd && code . && cdpj'
```

## Docker composer 

### Init minikube
```shell
alias mkstart='cdpj && minikube start'
```
### Docker Up
```shell
alias dcup='docker compose up'
```
### Docker Up
```shell
alias dcupd='dcup -d'
```
### Docker down
```shell
alias dcdown='docker compose down'
```

## General

### Reload sorce
```shell
alias rlb='source ~/.bashrc'
```
### Go to projects
```shell
alias cdhome='cd ~/'
```
### Go to projects
```shell
alias cdpj='move_to_project'
```
### Go to own
```shell
alias cdown='cd ~/own'
```
### Run dev script
```shell
alias nrd='npm run dev'
```
## Change permissions to folder
```shell
alias chmod-all='sudo chmod -R u=rwX,go=rwX'
```
### Change permissions to storage  
```shell
alias fix-storage='chmod-all storage'
```
### Generate sagger
```shell
alias fix-swagger='php artisan l5-swagger:generate'
```
### Open phpstorm, to Windows from WSL
```shell
alias phpcode='timeout 2s /mnt/c/Users/$USER/AppData/Local/Programs/PhpStorm\ 2/bin/phpstorm64.exe $(wslpath -w .)'
```
### eval $(ssh-agent -s)
```shell
alias ssha="eval $(ssh-agent -s)"
```

## Git
 
### Check git status
```shell
alias gs="git status"
```

<br>
<br>
<br>
<img src="https://img.shields.io/badge/more_about-alias-black?labelColor=blue&link=https%3A%2F%2Fwww.freecodecamp.org%2Fnews%2Fhow-to-create-your-own-command-in-linux%2F%23%3A~%3Atext%3DWhat%2520are%2520Alias%2520commands%2520in%2Cthe%2520whole%2520command%2520is%2520run" alt="shields">

