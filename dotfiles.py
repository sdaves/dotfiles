'''
Links dotfiles to their proper location, with the ability to restore the
previous dotfile state.
'''


import os
import sys


def get_paths(src_path):
    '''
    Returns the paths needed for linking and restoring.
    '''
    file_name = os.path.abspath(src_path.split('/')[-1])
    target_path = os.path.abspath(os.path.join(os.getcwd(), file_name))
    bak_path = '%s_bak' % target_path
    return (file_name, target_path, bak_path)


def backups_exist(files):
    '''
    Checks if any backup files exist.
    '''
    result = False
    for src_path in files:
        _, target_path, bak_path = get_paths(src_path)
        if os.path.exists(target_path):
            if os.path.exists(bak_path):
                result = True
                continue
    return result


def command_link(files):
    '''
    Links the dotfiles to your home directory, while also backing up any
    existing files.
    '''
    if backups_exist(files):
        return 'Previous backup exists. Exiting with no changes.'

    for src_path in files:
        _, target_path, bak_path = get_paths(src_path)
        if os.path.exists(target_path):
            os.system('mv %s %s' % (target_path, bak_path))
        os.system('ln -s %s %s' % (src_path, target_path))


def command_restore(files):
    '''
    Restores the dotfiles to your home directory that were origionally there.
    '''
    if not backups_exist(files):
        return 'No backups found.'

    for src_path in files:
        _, target_path, bak_path = get_paths(src_path)
        if os.path.exists(target_path):
            os.system('rm %s' % target_path)
        os.system('mv %s %s' % (bak_path, target_path))


def main():
    '''
    Runs a command based on the command line arguments.
    '''
    dir_name = os.path.abspath(os.path.dirname(__file__))
    os.chdir(os.environ['HOME'])
    files = []

    for item in os.listdir(os.path.join(dir_name, 'files')):
        file_name = os.path.join(dir_name, 'files', item)
        for name in os.listdir(file_name):
            files.append(os.path.abspath(os.path.join(file_name, name)))

    name = 'command_%s' % sys.argv[-1]
    if name in globals():
        result = globals()[name](files)
        if result is None:
            print 'Success'
        else:
            print result
    else:
        print 'Command not found.'


if __name__ == '__main__':
    main()
