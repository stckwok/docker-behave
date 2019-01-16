#!/bin/bash
sudo docker run -it --rm -v "$(pwd):/behave:ro"  williamyeh/behave
