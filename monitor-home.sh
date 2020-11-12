#!/bin/bash

inotifywait --monitor --event create $HOME | xargs -I{} dunstify "{}"
