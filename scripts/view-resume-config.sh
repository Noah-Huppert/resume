#!/usr/bin/env bash

# Check that first argument is provided, and save as VIEW_RESUME_EXT
if [[ ! -z "$1" ]]; then
	export VIEW_RESUME_EXT="$1"
else
	echo "Error: File extension of resume to view must be provided as first argument"
	return 1
fi

# Check VIEW_RESUME_EXT is valid, must be: .pdf or .dvi
if [[ ("$VIEW_RESUME_EXT" != ".pdf") && ("$VIEW_RESUME_EXT" != ".dvi") ]]; then
	echo "Error: File extension must be one of: .pdf, .dvi"
	return 1
fi

# Pid file path
export VIEW_RESUME_PID_FILE="view-resume$VIEW_RESUME_EXT.pid"
