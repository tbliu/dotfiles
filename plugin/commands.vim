nnoremap <leader>p :call DisplayRelativePath()<cr>
nnoremap <leader>fp :call DisplayFullPath()<cr>
nnoremap <leader>ls :call ListFiles()<cr>

function! DisplayRelativePath()
    echo expand('%')
endfunction

function! DisplayFullPath()
    echo expand('%:p')
endfunction

function! ListFiles()
    echo globpath('.', '*')
endfunction

