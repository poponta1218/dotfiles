# vim: set ft=sh

# >>> Terminal configure >>>
setopt COMBINING_CHARS
setopt INTERACTIVE_COMMENTS
setopt RC_QUOTES
unsetopt MAIL_WARNING
unsetopt BEEP
setopt CORRECT
setopt PROMPT_SUBST

setopt COMPLETE_IN_WORD
setopt ALWAYS_TO_END
setopt PATH_DIRS
setopt AUTO_MENU
setopt AUTO_LIST
setopt AUTO_PARAM_SLASH
setopt EXTENDED_GLOB
setopt NO_NO_MATCH
unsetopt MENU_COMPLETE
unsetopt FLOW_CONTROL
unsetopt LIST_BEEP

unsetopt CASE_GLOB

[[ -r ${TTY:-} && -w ${TTY:-} && ${+commands[stty]} == 1 ]] && stty -ixon < ${TTY} > ${TTY}

WORDCHARS="*?_-.[]~&;!#$%^(){}<>"
WORDCHARS=${WORDCHARS//[\/]}

ZSH_COMP_DIR="${ZDOTDIR}/external-comp"
FPATH="${ZSH_COMP_DIR}${FPATH:+:${FPATH}}"
# <<< Terminal configure <<<

# >>> Color configure >>>
if (( terminfo[colors] >= 8 )); then
  if (( ! ${+GREP_COLOR} )); then
    export GREP_COLOR="37;45"
  fi
  if (( ! ${+GREP_COLORS} )); then
    export GREP_COLORS="mt=${GREP_COLOR}"
  fi
  if [[ ${OSTYPE} == openbsd* ]]; then
    if (( ${+commands[ggrep]} )); then
      alias grep="ggrep --color=auto"
    fi
  elif (( ${+commands[grep]} )); then
    alias grep="grep --color=auto"
  fi
fi

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[00;47;30m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

if [[ -s "${HOME}/.dir_colors" ]]; then
  eval "$(dircolor --sh ${HOME}/.dir_colors)"
else
  export LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:"
fi
# <<< Color configure <<<

# >>> Jobs configure >>>
setopt LONG_LIST_JOBS
setopt AUTO_RESUME
setopt NOTIFY
unsetopt BG_NICE
unsetopt HUP
unsetopt CHECK_JOBS
# <<< Jobs configure <<<

# >>> History configure >>>
setopt BANG_HIST
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
unsetopt HIST_BEEP

HISTFILE="${HISTFILE:-${ZDOTDIR}/.zsh_history}"
HISTSIZE=10000
SAVEHIST=${HISTSIZE}
# <<< History configure <<<

# >>> Directory configure >>>
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
setopt PUSHD_TO_HOME
setopt CDABLE_VARS
setopt MULTIOS
setopt EXTENDED_GLOB
unsetopt CLOBBER
# <<< Directory configure <<<
