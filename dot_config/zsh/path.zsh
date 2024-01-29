# >>> General path configure >>>
XDG_CONFIG_HOME="${HOME}/.config"
XDG_CACHE_HOME="${HOME}/.cache"
XDG_DATA_HOME="${HOME}/.local/share"
XDG_STATE_HOME="${HOME}/.local/state"

if [[ "$(uname -r)" == *microsoft* ]] ; then
  WINDOWS_USER=$(/mnt/c/Windows/System32/cmd.exe /c 'echo %USERNAME%' 2> /dev/null | sed -e 's/\r//g')
  export PATH="/mnt/c/Users/${WINDOWS_USER}/AppData/Local/Programs/Microsoft VS Code/bin:${PATH}"
fi
unset WINDOWS_USER
export PATH="${HOME}/.local/bin:${PATH}"
export PATH="/snap/bin:${PATH}"
# <<< General path configure <<<

# >>> Mise path configure >>>
if [[ -e "${HOME}/.local/bin/mise" ]] ; then
  export PATH="${XDG_DATA_HOME}/mise/shims:${PATH}"
fi
# <<< Mise path configure <<<

# >>> TeXLive path configure >>>
if [[ -e "/usr/local/texlive" ]] ; then
  export PATH="/usr/local/texlive/latest/bin/x86_64-linux:${PATH}"
  export MANPATH="/usr/local/texlive/latest/texmf-dist/doc/man:${MANPATH}"
  export INFOPATH="/usr/local/texlive/latest/texmf-dist/doc/info:${INFOPATH}"
fi
# >>> TeXLive path configure <<<

# >>> Perl path configure >>>
if [[ -e "${HOME}/perl5" ]] ; then
  export PATH="${HOME}/perl5/bin${PATH:+:${PATH}}"
  export PERL5LIB="${HOME}/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
  export PERL_LOCAL_LIB_ROOT="${HOME}/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
  export PERL_MB_OPT="--install_base \"${HOME}/perl5\""
  export PERL_MM_OPT="INSTALL_BASE=${HOME}/perl5"
fi
# <<< Perl path configure <<<

# >>> Shell-utilities path configure >>>
gitrepopath="${HOME}/git-repo"
if [[ -e "${gitrepopath}" ]] ; then
  source "${gitrepopath}/shell-utilities/init.sh"
fi
unset gitrepopath
# <<< Shell-utilities path configure <<<
