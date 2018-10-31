# rhcos-scripts

A collection of system utility scripts for RHCOS systems.

### taint-on-ssh

A simple script to be run when an ssh connection is attempted, which:
 - Notifies the user that the ssh connection taints the node
 - Updates motd for future connections
 - Writes to a file to notify MCD, which will take further action

