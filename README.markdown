Welcome
-------

Here lives my dotfiles.

This repo uses submodules. When cloning, add the command line flag:

    --recursive

If you have already cloned without that flag, run:

    git submodule init 
    git submodule update

from the root of the cloned directory.

The dotfiles.txt file contains a list of files and folders in this repo to be linked to the home directory.

To link the files and folders specified in dotfiles.txt to the home directory, run:

    python manage.py link

To undo the link command, and restore any replaced files, run:

    python manage.py restore

This project uses git flow. After cloning, run:

    git flow init -d

Enjoy!
------
