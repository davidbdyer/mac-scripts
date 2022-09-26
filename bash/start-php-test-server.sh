#!/bin/bash
echo http://0.0.0.0:8888 | pbcopy && open http://0.0.0.0:8888 && php -S 0.0.0.0:8888 -t .