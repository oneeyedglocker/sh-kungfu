# Just print a hacker quote randomly when open a terminal.
#
# Config Variables
# ----------------------------------------
#
# ZSH_HACKER_QUOTES_ENABLE_WHEN_INTERACTIVE
#   print quotes if print hacker quotes when shell is an interactive login shell,
#     don't check whether shell is a login shell or not.
#   default only print hacker quotes when shell is an interactive and login shell.
#
# Development Notes
# ----------------------------------------
#
# use namespace `_zp_hq` (Zsh Plugin Hacker Quotes) to avoid naming conflict

_zp_hq::should_print_quote() {
  if [[ ! -o interactive ]]; then
    return 1
  fi

  if [[ -n "${ZSH_HACKER_QUOTES_ENABLE_WHEN_INTERACTIVE+var_defined_or_empty}" ]]; then
    return 0
  fi

  [[ -o login ]]
}

_zp_hq::print_quote() {
  if which fold &>/dev/null && [ -n "${COLUMNS:-}" ]; then
    printf '%b\n\n' "$*" | fold -s -w $COLUMNS
  else
    printf '%b\n\n' "$*"
  fi
}

if _zp_hq::should_print_quote; then
  _zp_hq_hacker_quotes=(
    "Use 'ls -lt' to sort files by last modified time"
    "Use 'ls -A' to view hidden files"
    "Use 'man -k <keyword>' to search for man pages"
    "Use 'df -h' to check disk space in human-readable format"
    "Alias common commands using 'alias' to save time"
    "Check running processes with 'ps -ef'"
    "Use 'netstat -tuln' to view open network ports"
    "Use 'du -sh <directory>' to view the size of a directory"
    "Use 'find /path -name \"filename\"' to find a file by name"
    "Use 'tar -xzf <file>.tar.gz' to extract a compressed tarball"
    "Use 'kill -9 <pid>' to forcefully stop a process"
    "Use 'lsof' to list all open files by processes"
    "Use 'ssh-keygen' to generate SSH keys"
    "Use 'scp user@host:/path/to/file /local/path' to securely copy files"
    "Use 'alias gs=\"git status\"' for a git status shortcut"
    "Use 'chmod 755 <file>' to change file permissions"
    "Use 'chown <user>:<group> <file>' to change file ownership"
    "Use 'htop' to view real-time CPU usage"
    "Use 'iostat' to check disk I/O usage"
    "Use 'df -m' to display disk usage in megabytes"
    "Use 'ping <hostname>' to check network connectivity"
    "Use 'traceroute <hostname>' to trace packet routes"
    "Use 'ps -ef | awk \'/sshd/ {print \$1, \$2}\'' to filter processes using awk"
    "Use 'du -h --max-depth=1' to check directory disk usage"
    "Use 'watch df -h' to continuously monitor disk space"
    "Use 'time <command>' to measure the execution time of a command"
    "Use 'rsync -av <source> <destination>' to synchronize files"
    "Use 'less <file>' to view large files without loading them entirely"
    "Use 'curl -O <url>' to download a file using curl"
    "Use 'ip a' to display network interface information"
    "Use 'free -h' to check memory usage"
    "Use 'uname -r' to check the kernel version"
    "Use 'uptime' to see how long your system has been running"
    "Use 'journalctl -xe' to view system logs"
    "Use 'systemctl status <service>' to check the status of a service"
    "Use 'systemctl start <service>' to start a service"
    "Use 'systemctl stop <service>' to stop a service"
    "Use 'tail -f /var/log/syslog' to view live system logs"
    "Use 'fdisk -l' to view disk partitions"
    "Use 'lsblk' to list block devices"
    "Use 'ssh-copy-id user@host' to copy your SSH key to a remote server"
    "Use 'alias ll=\"ls -la\"' for a detailed directory listing"
    "Use 'du -sh *' to check the size of all directories and files"
    "Use 'nc -zv <host> <port>' to check if a port is open on a server"
    "Use 'find . -type f -size +100M' to find files larger than 100MB"
    "Use 'wget <url>' to download files from the web"
    "Use 'nc -l 12345' to start a simple TCP listener on port 12345"
    "Use 'nc -v -z <host> 1-65535' to scan all open ports on a host"
    "Use 'df --inodes' to check the inode usage on a disk"
    "Use 'netstat -an' to view active network connections"
    "Use 'alias' without arguments to list all aliases"
    "Use 'chmod +x <file>' to make a file executable"
    "Use 'zip -r <archive>.zip <directory>' to compress a directory"
    "Use 'unzip <archive>.zip' to extract a zip file"
    "Use 'hostnamectl' to view and change the hostname"
    "Use 'export EDITOR=nano' to set your default terminal editor to nano"
    "Use 'du -sh /var/*' to view the size of the /var directory and its contents"
    "Use 'grep -r <pattern> <directory>' to recursively search for a pattern"
    "Use 'sed -i \"s/old/new/g\" <file>' to replace all instances of 'old' with 'new' in a file"
    "Use 'awk \'{print \$1, \$3}\' <file>' to extract specific columns from a file"
    "Use 'df -h /' to check the available disk space on the root filesystem"
    "Use 'ps aux | grep <process>' to search for a specific running process"
    "Use 'cut -d\":\" -f1 <file>' to extract the first column from a colon-delimited file"
    "Use 'watch -n 5 <command>' to run a command every 5 seconds"
    "Use 'ln -s <target> <link>' to create a symbolic link"
    "Use 'tail -n 100 <file>' to display the last 100 lines of a file"
    "Use 'history | grep <command>' to search your command history"
    "Use 'free -m' to display memory usage in megabytes"
    "Use 'lscpu' to display CPU architecture information"
    "Use 'lsusb' to list connected USB devices"
    "Use 'last' to view the last login sessions"
    "Use 'ss -tuln' to view listening TCP and UDP ports"
    "Use 'iostat -x 1 10' to display extended I/O statistics every second"
    "Use 'top -o %MEM' to sort processes by memory usage"
    "Use 'lsof -i TCP:80' to view open files and processes on port 80"
    "Use 'sudo !!' to run the last command as root"
    "Use 'python -m SimpleHTTPServer' to serve the current directory tree at http://\$HOSTNAME:8000/"
    "^foo^bar: Really useful for when you have a typo in a previous command."
    "curl ifconfig.me: Get your external IP address"
    "<ctrl+u> [...] <ctrl+y> cut / paste on your command line"
    "ssh user@host cat /path/to/remotefile | diff /path/to/localfile - compare remote file and local file"
    "time read (ctrl-d to stop) stop watch"
    "ssh -t reachable_host ssh unreachable_host jump server"
    "ping -i 60 -a IP_address: Set audible alarm for when IP address comes online"
    "lshw, lscpu, lspci, lsusb, dmidecode: hardware information, including CPU, BIOS, RAID, graphics, devices, etc."
    "id: user/group identity info"
    "dmesg: boot and system error messages"
    "mpstat: CPU usage stats"
    "last: login history"
    "curl cheat.sh/command: Will give a brief 'cheat sheet' with common examples of how to use a shell command."
    "Know ssh, and the basics of passwordless authentication, via ssh-agent, ssh-add, etc."
    "stat: file info"
    "dstat: useful system stats"
    "vmstat: Memory usage stats"
    "To find which socket or process is using bandwidth, try iftop or nethogs."
    "strings: extract text from binary files"
    "htop: improved version of top"
  )

  _zp_hq::print_quote "${_zp_hq_hacker_quotes[RANDOM % $#_zp_hq_hacker_quotes + 1]}"

  # release memory
  unset _zp_hq_hacker_quotes
fi
