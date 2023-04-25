export PATH=/usr/local/bin:/usr/local/opt/ruby/bin:$PATH
export EDITOR=vim

# get current status of git repo
function parse_git_dirty {
  git_status=`git status 2>&1 | tee`
  dirty=`echo -n "${git_status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
  untracked=`echo -n "${git_status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
  ahead=`echo -n "${git_status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
  newfile=`echo -n "${git_status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
  renamed=`echo -n "${git_status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
  deleted=`echo -n "${git_status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
  bits=''
  if [ "${renamed}" = "0" ]; then
    bits=">${bits}"
  fi
  if [ "${ahead}" = "0" ]; then
    bits="*${bits}"
  fi
  if [ "${newfile}" = "0" ]; then
    bits="+${bits}"
  fi
  if [ "${untracked}" = "0" ]; then
    bits="?${bits}"
  fi
  if [ "${deleted}" = "0" ]; then
    bits="x${bits}"
  fi
  if [ "${dirty}" = "0" ]; then
    bits="!${bits}"
  fi
  if [ ! "${bits}" = "" ]; then
    echo " ${bits}"
  else
    echo ""
  fi
}

# get current branch in git repo
function parse_git_branch {
  BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
  if [ ! "${BRANCH}" = "" ]
  then
    STAT=`parse_git_dirty`
    echo "[${BRANCH}${STAT}]"
  else
    echo ""
  fi
}


alias la="ls -la"
alias gs="git status"
alias diff="git diff"
alias tmux="tmux -2"
alias git-accomplishments='git log --since=1.weeks --author=$USER --abbrev-commit --pretty="%h - %s"'

autoload -U colors && colors
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git*' formats '%S '
setopt PROMPT_SUBST
PROMPT='%F{green}%*%f %F{blue}${vcs_info_msg_0_}%f%F{magenta}$(parse_git_branch)%f '
