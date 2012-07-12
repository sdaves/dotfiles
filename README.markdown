Welcome
-------

Herein livith mine dotfiles.

Setup
-----

    git clone --recursive https://github.com/sdaves/dotfiles.git
    python dotfiles/manage.py link && source ~/.bashrc

Cleanup
-------

To undo the link command, and restore any replaced files, run:

    python dotfiles/manage.py restore

Development
-----------

Hit the "Fork" button located in the top right of this github page. Clone your new
repo by running:

    git clone --recursive YOUR-URL

Replace YOUR-URL with the url of your fork. Then run:

    cd dotfiles && git branch develop origin/develop && git flow init -d
    git flow feature start YOUR-FEATURE-NAME

Just remember to replace YOUR-FEATURE-NAME with the name of your new feature (no spaces are allowed). Now create your awesome feature! When you have finished committing all your changes, run:

    git flow feature publish YOUR-FEATURE-NAME

Now just send me a pull request for your feature branch, and your done!

Enjoy!
======
