Welcome
-------

Herein livith mine dotfiles.

Setup
-----

    git clone https://github.com/sdaves/dotfiles.git --recursive
    python dotfiles/manage.py link
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
    echo && echo Enter feature name \(only letters, numbers, spaces, and dashes allowed\): && read feature_name

Enter the name of your new awesome feature. Only letters, numbers, spaces, and dashes are allowed. Then run:

    git flow feature start $feature_name

All set! Now create your awesome feature. When you have finished committing all your changes, run:

    git flow feature finish $feature_name

The only thing left, is to push it up, and send me a merge request!

Enjoy!
======
