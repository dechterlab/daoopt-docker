#!/bin/bash
#
# Lars Otten <lotten@ics.uci.edu>, 2011
#
# Simple script that sets a limit on the run time (first argument)
# and memory (second argument) before calling a specific command
# (third argument onwards).

# Check for time and memory limit and at least one actual argument
if [ "$1" == "" ] ; then
  echo "First argument (time limit in sec) missing"
  exit 1
fi
if [ "$2" == "" ] ; then
  echo "Second argument (memory limit in KB) missing"
  exit 1
fi
if [ "$3" == "" ] ; then
  echo "Command to be executed missing"
  exit 1
fi

# Set time and memory limit using ulimit
ulimit -S -t $1
ulimit -S -v $2

# Shift time and memory limit argument out
shift 2

# Use remaining arguments to run command, return value will be
# passed up.
$*
