#!/usr/bin/env bash
source ./scripts/view-resume-config.sh

# Check for dvi viewer pid file
if [[ -f "$VIEW_RESUME_PID_FILE" ]]; then
	# Check if pid is still running 
	if ps -o pid= -p "$(cat $VIEW_RESUME_PID_FILE)"; then
		# If running, kill
		kill "$(cat $VIEW_RESUME_PID_FILE)" && rm "$VIEW_RESUME_PID_FILE"
	fi
fi
