Welcome
-------

Herein livith mine dotfiles.

Getting Started
---------------

    git clone https://github.com/sdaves/dotfiles.git --recursive
    cd dotfiles
    git branch develop origin/develop
    git flow init -d

Setup
------------

The file dotfiles.txt contains a list of files and folders in this repo to be linked to the home directory. To link the files, run:

    python manage.py link

To undo the link command, and restore any replaced files, run:

    python manage.py restore

Enjoy!
======
