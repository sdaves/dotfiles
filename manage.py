'''
This module is responsible for managing the setup and teardown of the
dotfile config.
'''


__version__ = '1.0'


import sys
import os


class DotFileConfig(object):
    '''
    Sets up and tears down your dotfile config.
    '''
    def __init__(self):
        os.chdir(os.path.abspath(os.path.dirname(__file__)))

        self.home_dir = os.environ['HOME']

        if not os.path.exists(self.home_dir):
            self.home_dir = raw_input('Please enter your home directory '\
                'absolute path: ')
        else:
            self.home_dir = os.path.abspath(self.home_dir)

        self.backup_link_path = os.path.abspath('backup_link')
        self.backup_restore_path = os.path.abspath('backup_restore')

        self.file_data = ''.join(file('dotfiles.txt').readlines()).split(
            '\n')[0:-1]

        item = ''.join(sys.argv[1:])

        if item in dir(self):
            getattr(self, item)()
        else:
            if item:
                print 'Command not found. Here are the available commands:'
            else:
                print 'Please specify a command to perform.'

            print

            for item in dir(self):
                target = getattr(self, item)
                if type(target).__name__ == 'instancemethod':
                    if target.__name__ != '__init__':
                        print target.__name__

            print

    def link(self):
        '''
        Sets up your dotfile config by first backing up any files that
        will be changesd, and lastly it creates symbolic links to each
        file needed.
        '''
        if os.path.exists(self.backup_link_path):
            print 'Backup directory "%s" exists, please remove it, and '\
                'run this command again.' % self.backup_link_path
        else:
            os.mkdir(self.backup_link_path)
            destination_path = self.home_dir

            for key in self.file_data:
                if os.path.exists(destination_path):
                    file_name = os.path.split(key)[-1]

                    to_path = os.path.abspath(
                        os.path.join(destination_path, file_name),
                    )

                    if os.path.isfile(to_path) or os.path.islink(to_path):
                        #backup link
                        os.link(
                            to_path,
                            os.path.join(self.backup_link_path, file_name),
                        )

                        #remove existing link
                        os.unlink(to_path)

                    os.symlink(os.path.abspath(key), to_path)

    def restore(self):
        '''
        Tears down your dotfile config by first removing the previously
        created symbolic links, and lastly restoring any backups.
        '''
        if os.path.exists(self.backup_restore_path):
            print 'Backup directory "%s" exists, please remove it, and '\
                'run this command again.' % self.backup_restore_path
            return
        else:
            os.mkdir(self.backup_restore_path)

        if not os.path.exists(self.backup_link_path):
            return

        for key in self.file_data:
            destination_path = self.home_dir

            if os.path.exists(destination_path):
                file_name = os.path.split(key)[-1]

                to_path = os.path.abspath(
                    os.path.join(destination_path, file_name),
                )

                if os.path.isfile(to_path) or os.path.islink(to_path):
                    #backup link
                    os.link(
                        to_path,
                        os.path.join(self.backup_restore_path, file_name),
                    )

                    #remove existing link
                    os.unlink(to_path)

                os.link(
                    os.path.join(self.backup_link_path, file_name),
                    to_path,
                )


def main():
    '''
    Runs the main application.
    '''
    DotFileConfig()


if __name__ == '__main__':
    main()
