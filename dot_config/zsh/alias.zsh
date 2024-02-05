# >>> General alias configure >>>
alias ack="nocorrect ack"
alias cd="nocorrect cd"
alias cp="nocorrect cp"
alias ebuild="nocorrect ebuild"
alias gcc="nocorrect gcc"
alias gist="nocorrect gist"
alias grep="nocorrect grep"
alias heroku="nocorrect heroku"
alias ln="nocorrect ln"
alias man="nocorrect man"
alias mkdir="nocorrect mkdir"
alias mv="nocorrect mv"
alias mysql="nocorrect mysql"
alias rm="nocorrect rm"

alias bower="noglob bower"
alias fc="noglob fc"
alias find="noglob find"
alias ftp="noglob ftp"
alias history="noglob history"
alias locate="noglob locate"
alias rake="noglob rake"
alias rsync="noglob rsync"
alias scp="noglob scp"
alias sftp="noglob sftp"

alias _="sudo"
alias b="${(z)BROWSER}"

alias diffu="diff --unified"
alias e="${(z)VISUAL:-${(z)EDITOR}}"
alias mkdir="${aliases[mkdir]:-mkdir} -p"
alias p="${(z)PAGER}"
alias po="popd"
alias pu="pushd"
alias sa="alias | grep -i"
alias type="type -a"

alias cpi="${aliases[cp]:-cp} -i"
alias lni="${aliases[ln]:-ln} -i"
alias mvi="${aliases[mv]:-mv} -i"
alias rmi="${aliases[rm]:-rm} -i"
if (( ${+commands[safe-rm]} && ! ${+commands[safe-rmdir]} )) ; then
  alias rm=safe-rm
fi

alias chmod="chmod --preserve-root -v"
alias chown="chown --preserve-root -v"
# <<< General alias configure <<<

# >>> Clipboard alias configure >>>
if [[ "${OSTYPE}" == darwin* ]] ; then
  alias o="open"
elif [[ "${OSTYPE}" == cygwin* ]] ; then
  alias o="cygstart"
  alias pbcopy="tee > /dev/clipboard"
  alias pbpaste="cat /dev/clipboard"
elif [[ "${OSTYPE}" == linux-android ]] ; then
  alias o="termux-open"
  alias pbcopy="termux-clipboard-set"
  alias pbpaste="termux-clipboard-get"
else
  alias o="xdg-open"
  if (( ${+commands[xclip]} )) ; then
    alias pbcopy="xclip -selection clipboard -in"
    alias pbpaste="xclip -selection clipboard -out"
  elif (( ${+commands[xsel]} )) ; then
    alias pbcopy="xsel --clipboard --input"
    alias pbpaste="xsel --clipboard --output"
  fi
fi

alias clip="pbcopy"
alias pbc="pbcopy"
alias pbp="pbpaste"
# <<< Clipboard alias configure <<<

# >>> Download helper configure >>>
if (( ${+commands[aria2c]} )) ; then
  alias get="aria2c --max-connection-per-server=5 --continue"
elif (( ${+commands[axel]} )) ; then
  alias get="axel --num-connections=5 --alternate"
elif (( ${+commands[wget]} )) ; then
  alias get="wget --continue --progress=bar --timestamping"
elif (( ${+commands[curl]} )) ; then
  alias get="curl --continue-at - --location --progress-bar --remote-name --remote-time"
fi
# <<< Download helper configure <<<

# >>> Directory server via HTTP >>>
if (( $#commands[(i)python(|[23])] )) ; then
  autoload -Uz is-at-least
  if (( $+commands[python3] )) ; then
    alias http-serve="python3 -m http.server"
  elif (( $+commands[python2] )) ; then
    alias http-serve="python2 -m SimpleHTTPServer"
  elif is-at-least 3 ${"$(python --version 2>&1)"[(w)2]} ; then
    alias http-serve="python -m http.server"
  else
    alias http-serve="python -m SimpleHTTPServer"
  fi
fi
# <<< Directory server via HTTP <<<

# >>> Resource usage alias configure >>>
alias df="df -kh"
alias du="du -kh"

if [[ "${OSTYPE}" == darwin* || "${OSTYPE}" == *bsd* ]] ; then
  alias topc="top -o cpu"
  alias topm="top -o vsize"
else
  alias topc="top -o %CPU"
  alias topm="top -o %MEM"
fi
# <<< Resource usage alias configure >>>

# >>> ls alias configure >>>
alias l="ls -1hA"
alias ll="ls -lh"
alias lv="ll -v"
alias la="ll -A"
alias lva="ll -vA"
alias kk="ll"
alias lll="ll"
alias lm="la | ${PAGER}"
if (( ${+commands[eza]} )) ; then
  alias ls="eza"
  alias ll="${aliases[ll]} --icons --git"
  alias lr="ll -T"
  alias lx="ll -sextension"
  alias lk="ll -ssize"
  alias lt="ll -smodified"
  alias lc="ll -schanged"
else
  alias lr="ll -R"
  if [[ ${(@M)${(f)"$(ls --version 2>&1)"}:#*GNU *} ]] ; then
    alias lx="ll -XB"
  fi
  alias lk="ll -Sr"
  alias lt="ll -tr"
  alias lc="lt -c"
fi
alias ls="${aliases[ls]:-ls} --group-directories-first --color=auto"
alias lu="lt -u"
# <<< ls alias configure <<<

# >>> cd alias configure >>>
alias cdz="cd ${ZSH_CONFIG_DIR}"
# <<< cd alias configure <<<

# >>> source alias configure >>>
alias s="source"
alias sz="source ${HOME}/.zshrc"
# <<< source alias configure <<<

# >>> kill alias configure >>>
alias stop="kill -STOP"
alias restart="kill -CONT"
# <<< kill alias configure <<<

# >>> vim alias configure >>>
if (( ${+commands[nvim]} )) ; then
  alias vi="nvim"
  alias vim="nvim"
  alias neovim="nvim"
  alias vimtutor="nvim -c Tutor"
  NVIM_CONFIG_DIR="${XDG_CONFIG_HOME}/nvim"
  export EDITOR="nvim"
  export VISUAL="nvim"
fi
alias vu="vi"
# <<< vim alias configure <<<

# >>> Personal script alias configure >>>
if (( ${commands[ejobs]} )) ; then
  alias pid="ejobs"
fi
# <<< Personal script alias configure <<<
