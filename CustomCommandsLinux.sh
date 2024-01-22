#### Custom alias Oscabrera 15/01/2024

### Update bash show branch
parse_git_branch() {
    git rev-parse --abbrev-ref HEAD 2> /dev/null
}

PS1='\[\033[01;32m\]\u:\[\033[01;34m\]\w\[\033[31m\]$(__git_ps1 " (%s)")\[\033[00m\]$ '

## Functions

# Move to a project
function move_to_project () {
    local project_path=~/projects/$1
    if [ -z "$1" ]; then
        project_path=~/projects/
    fi

    cd "$project_path" || return
}

# Sudo pass
function sup () {
     local password="$1"
    local command="$2"

    if [ -z "$password" ]; then
        sudo "$command"
    else
        echo "$password" | sudo -S bash -c "$command"
    fi
}

# Up docker with password
function docker_up_pass () {
    local password="$1"
    local docker_command="/etc/init.d/docker start"
    
     if [ -z "$password" ]; then
        sudo $docker_command
    else
        sup "$password" "$docker_command"
    fi
}

## Commands

#reload sorce
alias rlb='source ~/.bashrc'
# Go to projects
alias cdhome='cd ~/'
# Go to projects
alias cdpj='move_to_project'
# Go to cp-shops-pcb 
alias cdpcb='move_to_project cp-shops-pcb'
# Go to cp-web-desktop
alias cdwd='move_to_project cp-web-desktop'
# Go to CP
alias cdcp='move_to_project cp-shop'
# Go to AB
alias cdab='move_to_project ab-shop'

#Go to own
alias cdown='cd ~/own'
#Go to CustomCommandsCP
alias cdcma='cdown && cd CommandsAliasCP'

# Start service docker compose
alias dcstart='docker_up_pass'
# Docker Up
alias dcup='docker compose up'
# Docker Up
alias dcupd='dcup -d'
# Docker down
alias dcdown='docker compose down'
# init minikube
alias mkstart='cdpj && minikube start'

## change permissions to folder
alias chmod-all='sudo chmod -R u=rwX,go=rwX'
# change permissions to storage  
alias fix-storage='chmod-all storage'

# Generate sagger
alias fix-swagger='php artisan l5-swagger:generate'

# up CP
alias cpup='cdcp && dcupd && cdpj'
# up AB
alias abup='cdab && dcupd && cdpj'
# up PCB
alias pcbup='cdpcb && dcupd'
# open CommandsAliasCP
alias opencma='cdcma && code . && cdpj'
# open CommandsAliasCP
alias openpcb='cdpcb && codephp'

#open phpstorm
alias phpcode='timeout 2s /mnt/c/Users/$USER/AppData/Local/Programs/PhpStorm\ 2/bin/phpstorm64.exe $(wslpath -w .)'

# into pod PCB
alias pcbpod="kubectl exec -it $(kubectl get pods | grep pcb | awk '!/horizon/ {print $1}') -- bash"