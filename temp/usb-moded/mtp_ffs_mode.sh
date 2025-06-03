#!/bin/sh
# Start/stop the MTP daemon uMTP-Responder
#
# Copyright (c) Dylan Van Assche (2025)

MTP_DAEMON=umtprd

up() {
    $MTP_DAEMON &
}

down() {
    killall -9 $MTP_DAEMON
}

case $1 in
    up)
        up
        ;;
    down)
        down
        ;;
    *)
        echo "need an argument (up|down)"
        exit 0
        ;;
esac

