#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

color_prompt=yes
alias ls='ls --color=auto'
alias s='source venv/bin/activate'
alias addenv='export $(grep -v "^#" .env | xargs)'
alias zzz='poweroff'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
alias vim="nvim"
alias sudo="sudo "
alias ff="fastfetch"

# colors
declare blk="\[\033[01;30m\]"
declare red="\[\033[01;31m\]"
declare grn="\[\033[01;32m\]"
declare ylw="\[\033[01;33m\]"
declare blu="\[\033[01;34m\]"
declare pur="\[\033[01;35m\]"
declare cyn="\[\033[01;36m\]"
declare wht="\[\033[01;37m\]"
declare clr="\[\033[00m\]"


git_branch () {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/git:(\1)/'
}

if [ "$color_prompt" = yes ]; then
	PS1='['${grn}'\u@\h'${clr}' '${blu}'\W'${clr}'] '${ylw}'$(git_branch)'${clr}'\$ '
else
	PS1='[\u@h \W] $(git_branch)\$ '
fi

gg() {
  local custom_host=$1
  shift  # Shift the first argument (hostname) out of the way
  local repo_url=$1
  local new_url="git@${custom_host}:${repo_url#git@github.com:}"
  git clone "$new_url"
}
gra(){

  local custom_host=$1
  shift  # Shift the first argument (hostname) out of the way
  local repo_url=$1
  local new_url="git@${custom_host}:${repo_url#git@github.com:}"
  git remote add origin "$new_url"
}
awkawk(){
awk -v l="$1" '(NR==1){header=$0;next}
                (NR%l==2) {
                   close(file); 
                   file=sprintf("%s.%0.5d.csv",FILENAME,++c)
                   sub(/csv[.]/,"",file)
                   print header > file
                }
                {print > file}' "$2"
}
def() {
    local word="$1"
    local lang="${2:-en}"
    local query
    local def

    [[ -z "$word" ]] && {
        echo "Usage: define <word> [language]"
        return 1
    }

    query=$(curl -fsS "https://freedictionaryapi.com/api/v1/entries/${lang}/${word}") || {
        echo "Failed to contact dictionary API."
        return 1
    }

    if ! jq -e . >/dev/null 2>&1 <<<"$query"; then
        echo "Invalid response from dictionary API."
        return 1
    fi

    def=$(
        jq -r '
            .entries[]? |
            (.partOfSpeech // "unknown") as $pos |
            .senses[]? |
            "\($pos): \(.definition // "No definition available.")"
        ' <<<"$query"
    )

    if [[ -z $def ]]; then
        echo "No definitions found for \"$word\"."
        return 1
    fi

    printf '%s\n' "$def"
}

bind -x '"\C-f": "~/.local/bin/tmux-fzf-start"'
#bind -x '"\C-f": "tmux new ~/.local/bin/tmux-fzf-start"'

export PATH="$PATH:$HOME/go/bin"
# export GOPATH="$HOME/go"
# export PATH="$GOPATH/bin:$PATH"
# export PATH=$PATH:$(go env GOPATH)/bin
source /usr/share/nvm/init-nvm.sh
alias pbcopy='xclip -selection clipboard'
alias mywifi="tr -d '\n' < ~/.wifi_pass | xclip -selection clipboard"
alias faws="aws --profile floci"
alias faws="aws --profile floci"
alias lzd="lazydocker"
