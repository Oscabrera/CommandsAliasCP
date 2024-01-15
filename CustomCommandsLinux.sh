#### Custom alias Oscabrera 15/01/2024

## Functions

# Go to a project
function move_to_project () {
    local project_path=~/projects/$1
    if [ -z "$1" ]; then
        project_path=~/projects/
    fi
    echo "Go to $project_path"
    cd "$project_path" || return
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
alias dcstart='sudo /etc/init.d/docker start'
# Docker Up
alias dcup='docker compose up'
# Docker Up
alias dcupd='dcup -d'
# Docker down
alias dcdown='docker compose down'
# init minikube
alias mkstart='minikube start'

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
# open CommandsAliasCP
alias opencma='cdcma && code . && cdpj'
# up PCB
alias cpup='cdcp && dcupd && dcupd && cdpj'