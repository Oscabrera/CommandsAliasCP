# CommandsAliasCP
##### Custom Alias

![CommandsAliasCP](https://socialify.git.ci/Oscabrera/CommandsAliasCP/image?font=Inter&language=1&name=1&owner=1&pattern=Brick%20Wall&theme=Light)

This project provides a set of optimized alias commands, designed to improve efficiency and user experience at the command line. It simplifies common tasks, speeds up system navigation, and provides intuitive shortcuts for common operations. Customize your environment with these carefully selected aliases to boost your productivity. Simplify your life in the terminal with this set of ready-to-use aliases!

<p align="center"><img src="https://img.shields.io/badge/alias-linux?style=for-the-badge&amp;logo=linux&amp;logoColor=white&amp;labelColor=32a848&amp;color=0f23d9" alt="shields"></p>

# Modify the ~/.bashrc file to add aliases

## Steps:

1. Open a terminal.

2. Open the `~/.bashrc` file with your favorite text editor. You can use nano, gedit, vim or another editor.

```shell
nano ~/.bashrc
```

4. Scroll to the end of the file.

5. To make a reference to the alias command file, add the following line to the end of the file.

```shell
source pathThisProject/CommandsAliasCP/CustomCommandsLinux.sh
```

6. Save the changes and close the editor.

7. Reload the ~/.bashrc file for the changes to take effect in the current terminal session.

```shell
source ~/.bashrc
```

Now, the aliases you added will be available in your terminal session. You can customize these aliases according to your needs. Remember that any changes to the ~/.bashrc file will only affect new terminal sessions or sessions that are reloaded after the changes are made.


# Content

## Update git branch display in terminal

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

### sudo pass
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

### Up docker with password
```shell
function docker_up_pass () {
    local password="$1"
    local docker_command="/etc/init.d/docker start"
    
     if [ -z "$password" ]; then
        sudo $docker_command
    else
        sup "$password" "$docker_command"
    fi
}
```
## Open applications from WSL to windows

### open phpstorm
```shell
alias phpcode='timeout 2s /mnt/c/Users/oscabrera/AppData/Local/Programs/PhpStorm\ 2/bin/phpstorm64.exe $(wslpath -w .)'
```

## Commands

### reload sorce
```shell
alias rlb='source ~/.bashrc'
```

### open CommandsAliasCP
```shell
alias opencma='cdcma && code . && cdpj'
```
### Go to own
```shell
alias cdown='cd ~/own'
```
### Go to CustomCommandsCP
```shell
alias cdcma='cdown && cd CommandsAliasCP'
```

### Start service docker compose
```shell
alias dcstart='docker_up_pass'
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
### init minikube
```shell
alias mkstart='cdpj && minikube start'
```
### up CP
```shell
alias cpup='cdcp && dcupd && cdpj'
```
### up AB
```shell
alias abup='cdab && dcupd && cdpj'
```
### up PCB
```shell
alias pcbup='cdpcb && dcupd'
```

### Go to Home
```shell
alias cdhome='cd ~/'
```
### Go to projects 
```shell
alias cdpj='move_to_project'
```
### Go to cp-shops-pcb 
```shell
alias cdpcb='move_to_project cp-shops-pcb'
```
### Go to cp-web-desktop
```shell
alias cdwd='move_to_project cp-web-desktop'
```
### Go to CP
```shell
alias cdcp='move_to_project cp-shop'
```
### Go to AB
```shell
alias cdab='move_to_project ab-shop'
```

### change permissions to folder
```shell
alias chmod-all='sudo chmod -R u=rwX,go=rwX'
```
### change permissions to storage 
```shell
alias fix-storage='chmod-all storage'
```

### Generate sagger
```shell
alias fix-swagger='php artisan l5-swagger:generate'
```

<br>
<br>
<br>
<img src="https://img.shields.io/badge/more_about-alias-black?labelColor=blue&link=https%3A%2F%2Fwww.freecodecamp.org%2Fnews%2Fhow-to-create-your-own-command-in-linux%2F%23%3A~%3Atext%3DWhat%2520are%2520Alias%2520commands%2520in%2Cthe%2520whole%2520command%2520is%2520run" alt="shields">
