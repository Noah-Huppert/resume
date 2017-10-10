#!/usr/bin/env bash
source ./scripts/view-resume-config.sh

file="resume$VIEW_RESUME_EXT"

# If dvi
if [[ "$VIEW_RESUME_EXT" == ".dvi" ]]; then
	xdvi "$file" &
	echo $! > $VIEW_RESUME_PID_FILE
elif [[ "$VIEW_RESUME_EXT" == ".pdf" ]]; then
	foxit "$file"
	echo $! > $VIEW_RESUME_PID_FILE
else
	echo "Error: Unknown view resume ext: \"$VIEW_RESUME_EXT\""
	return 1
fi
