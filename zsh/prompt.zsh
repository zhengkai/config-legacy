# autoload -U colors && colors
# autoload -U promptinit && promptinit

local time="%D{%X}"
local host="%n@%m"
local url="%~"
local reset="\[\033[00m\]"

time="%F{39} - ${time} -"
host="%F{39}${host}"
url="%F{39}%B${url}%b"

function vi_prompt_color() {
	local insert_color="%F{10}"
	local normal_color="%F{208}"
	echo "$normal_color${${KEYMAP/vicmd/$insert_color}/(main|viins)}"
}

function git_propmt() {
	local branch=`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1/"`

	if [ -z "$branch" ]; then
		return
	fi
	echo "%F{39}Git[ ${branch}$(git_propmt_dirty) ]$reset_color"
}

function git_propmt_dirty() {

	file=`(git status -s | wc -l) 2> /dev/null`
	if [ $file -lt 1 ]; then
		return
	fi

	s=`git diff -b --shortstat 2> /dev/null`
	if [ -z "$s" ]; then
		echo " ] [ $file"
		return
	fi

	addline=`echo $s | \grep -o '[0-9]\+ insertion' | \grep -o '[0-9]\+'`
	if [ -z "$addline" ]; then
		addline=0
	fi
	subline=`echo $s | \grep -o '[0-9]\+ deletion' | \grep -o '[0-9]\+'`
	if [ -z "$subline" ]; then
		subline=0
	fi

	let count="$addline+$subline"
	echo " ] [ $file / $count"
}

setopt PROMPT_SUBST

local reset="%F{255}%b"

PROMPT='
${time} ${host} ${url}  $(git_propmt)
$(vi_prompt_color) »${reset} '
