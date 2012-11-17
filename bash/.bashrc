# $FreeBSD: release/9.0.0/etc/root/dot.profile 199243 2009-11-13 05:54:55Z ed $
#
PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/games:/usr/local/sbin:/usr/local/bin:~/bin
export PATH
HOME=/home/gullet
export HOME
TERM=${TERM:-xterm}
export TERM
PAGER=more
export PAGER
LC_ALL=sv_SE.ISO8859-1
export LC_ALL

# start keychain
keychain id_rsa
. .keychain/FBFB-sh
# end keychain

#function parse_git_branch {
#ref=$(git-symbolic-ref HEAD 2> /dev/null) || return
#  echo "("${ref#refs/heads/}")"
#}
# Predefined Colors
IBLACK="\[\033[0;90m\]"
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"

# Predefined Variables
Time="\A"
PathShort="\w"
CurrentUser="\u"
HostName="\H"

# function modified from: www.opinionatedprogrammer.com
# Very rudamentary git-prompt: green if clean and not ahead - yellow otherwise
function _git_prompt() {
  git_status="`git status -unormal 2>&1`";
  status_not_a_repo="Not a git repository";
  status_clean="nothing to commit";
  status_ahead="branch is ahead of";
  if ! [[ "$git_status" == *"$status_not_a_repo"* ]]; then
    if [[ "$git_status" == *"$status_ahead"* ]]; then
      color=$YELLOW
    elif [[ "$git_status" == *"$status_clean"* ]]; then
      color=$GREEN
    else
      color=$YELLOW
    fi
    # branch=${BASH_REMATCH[1]}
    branch="(git)"
    echo -n "$RED$Time $color$branch $RED$PathShort$GREEN \$ ";
  else
    echo -n "$RED$Time $PathShort$GREEN \$ ";
  fi
}
function _prompt_command() {
  PS1="`_git_prompt`"
}
PROMPT_COMMAND=_prompt_command
