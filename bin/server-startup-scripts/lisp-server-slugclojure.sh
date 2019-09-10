#!/bin/bash
#
# lisp-server-slugclojure        Startup script for the Slugclojure Website
#
# chkconfig: - 85 15
# description: Website for Slugclojure Website
# processname: lisp-server-slugclojure
#
### BEGIN INIT INFO
# Provides: lisp-server-slugclojure
# Required-Start: $local_fs $remote_fs $network $named
# Required-Stop: $local_fs $remote_fs $network
# Short-Description: start and stop lisp-server-slugclojure
# Description: Website for Slug Clojure stuff.
### END INIT INFO

# Source function library.
# . /etc/rc.d/init.d/functions

# Path to screen, sbcl, and the start command(s)
. /home/mcarter/.sssrc
screen=$(which screen)
sbcl=$(which sbcl)
opts="--eval '(ql:quickload :slugclojure)' --eval '(slugclojure:start :port 60444)'"
prog="Slugclojure"

start() {
    echo -n $"Starting $prog: "
    echo "$screen $sbcl $opts"
    $screen -S $prog -d -m $sbcl --eval '(ql:quickload :slugclojure)' --eval "(slugclojure:start :port 60444 :server 'woo)"
    RETVAL=$?
    return $RETVAL
}

stop() {
    echo $"Stopping $prog"
    $screen -S $prog -X quit
}

status() {
    echo -n $"Checking on $prog: "
    $screen -ls $prog
}

restart() {
    stop
    sleep 0
    start
}

case "$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    restart)
        restart
        ;;
    status)
        status
        ;;
    *)
        echo "Usage: $prog {start|stop}"
esac
