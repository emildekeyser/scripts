#!/usr/bin/env sh

case "$@" in
	# *.sql)
	# 	(urxvt -e zsh -is eval "psql-query $@" &)
	# 	;;
	# *.py)
	# 	(urxvt -e zsh -is eval "python -i $@" &)
	# 	;;
	# *.go)
	# 	(urxvt -e zsh -is eval "go run $@" &)
	# 	;;
	*)
	 	(urxvt -e zsh -is eval "make" &)
		;;	
esac
