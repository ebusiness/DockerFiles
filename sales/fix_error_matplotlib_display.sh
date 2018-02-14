#!/bin/sh

# matplotlibの$DISPLAYが未定義エラー対策
cp /usr/local/lib/python2.7/site-packages/matplotlib/mpl-data/matplotlibrc ~/.config/matplotlib/matplotlibrc.bak
FILENAME=~/.config/matplotlib/matplotlibrc

sed 's/backend\s*:\s*tkagg/backend      : Agg/ig' ${FILENAME}.bak >${FILENAME}
rm ${FILENAME}.bak