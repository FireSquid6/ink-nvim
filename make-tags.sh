#!/bin/sh
rg --files | ctags -R --links=no -L -
