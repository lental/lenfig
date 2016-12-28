# Lenfig

This is a repository of configuration files used for my \*nix computers.

# Define PERSONAL\_REPO\_PATH in your .bash_profile

You need to define `PERSONAL_REPO_PATH` for where you keep all of your repos

Example (.bash_profile):

	export PERSONAL_REPO_PATH=~/repos/personal

# Files that should be sourced in your .bash_profile


Instead of symlinking the following files, it could be easier to just add a source line to your .bash_profile

1. `.bashrc`
1. `.bash_aliases`

Example (.bash_profile):

	export PERSONAL_REPO_PATH=~/repos/personal

	source $PERSONAL_REPO_PATH/lenfig/.bashrc
	source $PERSONAL_REPO_PATH/lenfig/.bash_aliases

# Files that should be aliased

If you check out the repo, you would probably want to symlink the following files to your home directory:

Example (shell commands):

	ln -s $PERSONAL_REPO_PATH/lenfig/.vimrc ~/
	ln -s $PERSONAL_REPO_PATH/lenfig/.vim ~/
	ln -s $PERSONAL_REPO_PATH/lenfig/.slate ~/
	ln -s $PERSONAL_REPO_PATH/lenfig/.gitignore_global ~/

