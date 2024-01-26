#### Custom alias Oscabrera 15/01/2024

# Content

### Update bash show branch
parse_git_branch() {
    git rev-parse --abbrev-ref HEAD 2> /dev/null
}

PS1='\[\033[01;32m\]\u:\[\033[01;34m\]\w\[\033[31m\]$(__git_ps1 " (%s)")\[\033[00m\]$ '

## Functions

### Move to a project
function move_to_project () {
    local project_path=~/projects/$1
    if [ -z "$1" ]; then
        project_path=~/projects/
    fi

    cd "$project_path" || return
}

### Sudo pass
function sup () {
     local password="$1"
    local command="$2"

    if [ -z "$password" ]; then
        sudo "$command"
    else
        echo "$password" | sudo -S bash -c "$command"
    fi
}

### Start service docker compose
function dcstart () {
    local password="$1"
    local docker_command="/etc/init.d/docker start"
    
     if [ -z "$password" ]; then
        sudo $docker_command
    else
        sup "$password" "$docker_command"
    fi
}

### Git add
function ga () {
    git add $1
}

### Into a principal pod of project
function into_to_pod () {
    local project_path=~/projects/$1
    if [ -z "$1" ]; then
        echo 'project is required'
    fi

    kubectl exec -it $(kubectl get pods | grep $1 | awk '!/horizon/ {print $1}') -- bash
}

## Commands

## PCB

### Go to cp-shops-pcb 
alias pcbcd='move_to_project cp-shops-pcb'

### Open PCB
alias pcbcode='cdpcb && phpcode'

### Up PCB
alias pcbup='cdpcb && dcupd && cdpj'

### Into pod PCB
alias pcbpod="into_to_pod pcb"

## CP

### Go to CP
alias cpcd='move_to_project cp-shop'

### Up CP
alias cpup='cdcp && dcupd && cdpj'

### Open CP
alias cpcode='cdcp && phpcode && cdpj'

### Work on CP
alias cpwork='cdcp && phpcode && dcupd'

## AB

### Go to AB
alias abcd='move_to_project ab-shop'

### Up AB
alias abup='cdab && dcupd && cdpj'

### Open AB
alias abcode='cdab && phpcode && cdpj'

### Work on AB
alias abwork='cdab && phpcode && dcupd'

## Web desktop (nuxt)

### Go to cp-web-desktop
alias wdcd='move_to_project cp-web-desktop'

### Up web-desktop this command does not release the terminal
alias wdup='wdcd && nrd'

### Open WD
alias wdcode='wdcd && phpcode'

### Work on WD
alias wdwork='wdcd && phpcode && nrd'

## CommandsAliasCP

### Go to CommandsAliasCP
alias cmacd='cdown && cd CommandsAliasCP'

### Open CommandsAliasCP
alias cmacode='cdcma && phpcode && cdpj'

### Visual code CommandsAliasCP
alias cmavcode='cdcma && code . && cdpj'

## Docker composer 

### Init minikube
alias mkstart='cdpj && minikube start'

### Docker Up
alias dcup='docker compose up'

### Docker Up
alias dcupd='dcup -d'

### Docker down
alias dcdown='docker compose down'

## General

### Reload sorce
alias rlb='source ~/.bashrc'

### Go to projects
alias cdhome='cd ~/'

### Go to projects
alias cdpj='move_to_project'

### Go to own
alias cdown='cd ~/own'

### Run dev script
alias nrd='npm run dev'

## Change permissions to folder
alias chmod-all='sudo chmod -R u=rwX,go=rwX'

### Change permissions to storage  
alias fix-storage='chmod-all storage'

### Generate sagger
alias fix-swagger='php artisan l5-swagger:generate'

### Open phpstorm
alias phpcode='timeout 2s /mnt/c/Users/$USER/AppData/Local/Programs/PhpStorm\ 2/bin/phpstorm64.exe $(wslpath -w .)'

## Git
 
### Check git status
alias gs="git status"
