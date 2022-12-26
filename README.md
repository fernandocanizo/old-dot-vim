# dot-vim

**Note: archiving this repo as I'm not using it anymore.**

My configuration files for [Vim](http://www.vim.org/).

Includes `~/.vim` directory and `~/.vimrc` as `~/.vim/vimrc` which I link at `$HOME` when bringing in configuration to new machines:

```
cd $HOME
ln -s .vim/vimrc .vimrc
```

Feel free to peruse and use whatever you may find useful.


## Submodules

If you already cloned this repo, then run:

```
git submodule init
git submodule update
```

in order to bring in submodules.

But if you're about to clon it, then you can do everything in one sweep like this:

```
git clone --recursive https://github.com/fernandocanizo/dot-vim.git
```

Currently only LearnVim, since it's a work in progress I wanted to be updated when changes occur.

Then follow submodules installation instructions as I haven't automatized that yet.
