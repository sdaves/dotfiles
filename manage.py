'''
This module is responsible for managing the setup and teardown of the
dotfile config.
'''


import sys
import os


class DotFileConfig(object):
    '''
    Can set up and tear down your dotfile config.
    '''
    def __init__(self):
        os.chdir(os.path.abspath(os.path.dirname(__file__)))

        self.home_dir = os.environ['HOME']

        if not os.path.exists(self.home_dir):
            self.home_dir = raw_input('Please enter your home directory '\
                'absolute path: ')
        else:
            self.home_dir = os.path.abspath(self.home_dir)

        self.backup_path = os.path.abspath('backup')

        self.file_data = {
            'vim/.vim': None,
            'vim/.vimrc': None,
            'screen/.screenrc': None,
        }

        item = ''.join(sys.argv[1:])

        if item in dir(self):
            getattr(self, item)()
        elif not item:
            print 'Please specify a command to perform.'
        else:
            print 'Command not found. Here are the available commands:'
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
        if os.path.exists(self.backup_path):
            print 'Backup directory exists, please remove it before '\
                'running the setup.'
        else:
            os.mkdir(self.backup_path)
            destination_path = self.home_dir

            for key, item in self.file_data.iteritems():
                if item is not None:
                    destination_path = os.path.abspath(item)

                if os.path.exists(destination_path):
                    file_name = os.path.split(key)[-1]

                    to_path = os.path.abspath(
                        os.path.join(destination_path, file_name),
                    )

                    if os.path.isfile(to_path) or os.path.islink(to_path):
                        #backup link
                        os.link(
                            to_path,
                            os.path.join(self.backup_path, file_name),
                        )

                        #remove existing link
                        os.unlink(to_path)

                    os.symlink(os.path.abspath(key), to_path)

    def restore(self):
        '''
        Tears down your dotfile config by first removing the previously
        created symbolic links, and lastly restoring any backups.
        '''
        raise Exception('todo')


def main():
    DotFileConfig()

if __name__ == '__main__':
    main()
