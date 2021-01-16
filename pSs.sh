#!/bin/bash

yay -Ss "$1" | paste - - | sed 's/\t/::/g' | tr -s ' ' | tac
