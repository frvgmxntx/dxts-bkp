#!/bin/bash
if ! pkill -INT -P "$(pgrep -xo record-screen)" wf-recorder 2>/dev/null; then
    geometry="$(slurp -d)"
    if [ -n "$geometry" ]; then
        pkill -USR1 -x record-screend
        mkdir -p ~/Videos/Recordings
        wf-recorder -a=alsa_output.pci-0000_06_00.6.analog-stereo.monitor -f ~/Videos/Screenrecords/"screen-record-$(date +%Y-%m-%d-%H-%M-%S).mp4" -g "$geometry"
        pkill -USR2 -x record-screend
    fi
fi
