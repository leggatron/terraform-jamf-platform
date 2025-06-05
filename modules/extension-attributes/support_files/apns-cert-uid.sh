#!/bin/zsh

# Name of the profile to check
PROFILE_NAME="Jamf Experience - ZTNA and Protect - macOS"

# Check if the profile is installed
if profiles show | grep -q "${PROFILE_NAME}"; then
    echo "<result>true</result>"
else
	echo "<result>false</result>"
fi 