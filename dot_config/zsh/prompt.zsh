# vim: set ft=sh:

# >>> Git prompt configure >>>
ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
ZSH_THEME_GIT_PROMPT_DETACHED="%{$fg_bold[cyan]%}:"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_UPSTREAM_SYMBOL="%{$fg_bold[yellow]%}⟳ "
ZSH_THEME_GIT_PROMPT_UPSTREAM_NO_TRACKING="%{$fg_bold[red]%}!"
ZSH_THEME_GIT_PROMPT_UPSTREAM_PREFIX="%{$fg[red]%}(%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_UPSTREAM_SUFFIX="%{$fg[red]%})"
ZSH_THEME_GIT_PROMPT_BEHIND="↓"
ZSH_THEME_GIT_PROMPT_AHEAD="↑"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%}✖"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}●"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg[red]%}✚"
ZSH_THEME_GIT_PROMPT_UNTRACKED="…"
ZSH_THEME_GIT_PROMPT_STASHED="%{$fg[blue]%}⚑"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✔"

ZSH_THEME_GIT_PROMPT_SECONDARY_PREFIX=""
ZSH_THEME_GIT_PROMPT_SECONDARY_SUFFIX=""
ZSH_THEME_GIT_PROMPT_TAGS_SEPARATOR=", "
ZSH_THEME_GIT_PROMPT_TAGS_PREFIX="🏷 "
ZSH_THEME_GIT_PROMPT_TAGS_SUFFIX=""
ZSH_THEME_GIT_PROMPT_TAG="%{$fg_bold[magenta]%}"
# <<< Git prompt configure <<<

# >>> General prompt configure >>>
PROMPT='%F{33}%n%f@%F{220}%m%f %F{46}%~%f $(gitprompt)
  $ '
RPROMPT='%F{243}%D{%Y-%m-%d %H:%M:%S}%f'
SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '
# <<< General prompt configure <<<
