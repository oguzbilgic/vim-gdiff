# Gdiff

The missing :Gdiff command for Vim. Populates the QuickFix list with the output
of git-diff command

**Credit:** Originally written by @eloytoro
https://github.com/tpope/vim-fugitive/issues/132#issuecomment-290644034

## Install

Using `vim-plug` add the following line to your vimrc.

```vim
Plug 'oguzbilgic/vim-gdiff
```

Run the command bellow to install the plugin: 

```vim
:PlugInstall
```

## Usage

```
:Gdiff {revision}
```

## Example

If you are on a feature branch, the following command will populate the quick
fix list with all the files changed only on that branch, useful for code
reviews.

```
:Gdiff master... 
```

## Extra

Once you populate the quick fix list you can easily cycle through the using
following mappings. You can add these to your `.vimrc`

```
" Quickfix motions
nnoremap [q :cprevious<cr>
nnoremap ]q :cnext<cr>
nnoremap [Q :cfirst<cr>
nnoremap ]Q :clast<cr>
```

Additionally, you can cycle the list using `fugitive` :Gdiffsplit command. 

```
nnoremap ]r :%bd<CR>:cnext<CR>:Gdiffsplit master<CR>
nnoremap [r :%bd<CR>:cprevious<CR>:Gdiffsplit master<CR>
nnoremap ]R :%bd<CR>:clast<CR>:Gdiffsplit master<CR>
nnoremap [R :%bd<CR>:cfirst<CR>:Gdiffsplit master<CR>
```

`]r` will open the next file with a diff view.
