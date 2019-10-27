" Populates quickfix with all the files changed
" https://github.com/tpope/vim-fugitive/issues/132#issuecomment-290644034

" Letter to word mapping for git diff output
let s:git_status_dictionary = {
      \ "A": "Added",
      \ "B": "Broken",
      \ "C": "Copied",
      \ "D": "Deleted",
      \ "M": "Modified",
      \ "R": "Renamed",
      \ "T": "Changed",
      \ "U": "Unmerged",
      \ "X": "Unknown"
      \ }

function! s:get_diff_files(rev)
  let title = 'Gdiff '.a:rev
  let command = 'git diff --name-status '.a:rev
  let lines = split(system(command), '\n')
  let items = []

  for line in lines
    let filename = matchstr(line, "\\S\\+$")
    let status = s:git_status_dictionary[matchstr(line, "^\\w")]
    let item = { "filename": filename, "text": status }

    call add(items, item)
  endfor

  let list = {'title': title, 'items': items}

  call setqflist([], 'r', list)

  copen
endfunction

" Command
command! -nargs=1 Gdiff call s:get_diff_files(<q-args>)
