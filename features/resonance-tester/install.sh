#!/bin/ash

set -e

SCRIPT_DIR="$(readlink -f $(dirname $0))"

test -d ~/printer_data/config/custom || mkdir -p ~/printer_data/config/custom

# add the py file to the klippy/extras folder
ln -sf ${SCRIPT_DIR}/resonance_tester.py \
    /usr/share/klipper/klippy/extras/resonance_tester.py
# add resonance-tester.cfg into the customs folder
ln -sf ${SCRIPT_DIR}/resonance-tester.cfg \
    ~/printer_data/config/custom/resonance-tester.cfg
# add the resonance-tester.cfg macro to the printer.cfg file
    python ${SCRIPT_DIR}/../../scripts/ensure_included.py \
    ~/printer_data/config/printer.cfg custom/resonance-tester.cfg

/etc/init.d/klipper restart
