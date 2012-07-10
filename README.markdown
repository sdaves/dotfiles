Welcome
-------

Herein livith mine dotfiles.

Setup
-----

    git clone https://github.com/sdaves/dotfiles.git --recursive
    cd dotfiles
    python manage.py link
    source ~/.bashrc

Cleanup
-------

To undo the link command, and restore any replaced files, run:

    python manage.py restore

Development
-----------

    git clone https://github.com/sdaves/dotfiles.git --recursive
    cd dotfiles
    git branch develop origin/develop
    git flow init -d    
    echo Enter feature name \(only letters, numbers, spaces, and dashes allowed in name\):
    read feature_name
    git flow feature start $feature_name
    
Do some work here. Then run:

    git flow feature finish $feature_name

Push it up, and send me a merge request!

Enjoy!
======
