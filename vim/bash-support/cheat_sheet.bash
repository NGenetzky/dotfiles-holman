#!/usr/bin/env bash


# Table 2-1. Overview of set debugging options
# Short  | Long notation | Result  
# -------+---------------+--------------------------------------------------------------
# set -f | set -o noglob | Disable file name generation using metacharacters (globbing).  
# set -v | set -o verbose| Prints shell input lines as they are read.  
# set -x | set -o xtrace | Print command traces before executing command.  

# set -x is set -o xtrace
# set -x expands variables as requested (and prints a little + sign before the line),
set -o xtrace # Print command traces before executing command.
set -x # Print command traces before executing command.
{ set +x; } 2>/dev/null # Undo set -x without outputing it.

# set -v is set -o verbose
# set -v does not expand variables
set -o verbose # Prints shell input lines as they are read.
set -v # Prints shell input lines as they are read.
{ set +v; } 2>/dev/null # Undo set -x without outputing it.

# Echo the command and then execute it.
echoexec() { echo "\$ $@" ; "$@" ; }

# Define a custom prefix for "set -o xtrace"
export PS4='+(${BASH_SOURCE}:${LINENO}): ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'

# Execute code conditionally. For example, if in debug mode.
debug=1
if_debug() {
 [[ $debug = 1 ]] && "$@" || :
}

need_root() {
    if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi
}
