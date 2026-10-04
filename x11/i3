#!/usr/bin/env bash

# Define your hex colors (Format: RRGGBBAA where AA is transparency)
BLANK='#00000000'
CLEAR='#ffffff22'
DEFAULT='#00897bE6'
TEXT='#eeffffFF'
WRONG='#880000bb'
VERIFYING='#00564dE6'

# Run i3lock-color with your configuration
i3lock \
--insidever-color=$CLEAR     \
--ringver-color=$VERIFYING   \
--insidewrong-color=$CLEAR   \
--ringwrong-color=$WRONG     \
--inside-color=$BLANK        \
--ring-color=$DEFAULT        \
--line-color=$BLANK          \
--separator-color=$DEFAULT   \
--verif-color=$TEXT          \
--wrong-color=$TEXT          \
--time-color=$TEXT           \
--date-color=$TEXT           \
--layout-color=$TEXT         \
--keyhl-color=$WRONG         \
--bshl-color=$WRONG          \
--blur 7                     \
--clock                      \
--indicator                  \
--time-str="%H:%M:%S"        \
--date-str="%A, %Y-%m-%d"
