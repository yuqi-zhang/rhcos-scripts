#!/usr/bin/bash
set -euo pipefail

OCP_NODE_TAINTED_URL=PLACEHOLDER

# Remind the user
echo "RHCOS node are not meant to be accessed manually via ssh. Marking node as tainted."
echo "Please see $OCP_NODE_TAINTED_URL for more information."

# Update the MOTD if need be
if ! grep -q "This node is marked tainted" /etc/motd; then
    echo "NOTE: This node is marked tainted. See $OCP_NODE_TAINTED_URL for more information." | sudo tee -a /etc/motd 1>/dev/null
fi

# Write to a socket/file for MCD to pick up the ssh
# if ! echo "tainted" | sudo nc -U /run/ssh-taint.sock; then
if ! echo "tainted" | sudo tee -a /run/ssh-taint 1>/dev/null; then
    echo "Error trying to write to file, cannot properly taint node."
fi

# Check if we have a TTY assigned
if [ -e "$SSH_TTY" ]; then
    # End passing to the shell for use
    /usr/bin/bash
else
    # If there isn't a tty then show an error and exit
    echo "RHCOS does not support connecting without shell access"
    exit 1
fi
