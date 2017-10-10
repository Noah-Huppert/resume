#!/usr/bin/env bash
source ./scripts/view-resume-config.sh

xdvi resume.dvi &
echo $! > $VIEW_RESUME_PID_FILE
