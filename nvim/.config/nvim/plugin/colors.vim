set termguicolors
set background=dark
let g:ayucolor = 'mirage'
let g:ayutrans = v:true
colorscheme ayu

highlight QuickScopePrimary   guifg=#86B300 gui=underline,bold,italic
highlight QuickScopeSecondary guifg=#399EE6 gui=underline,bold,italic
highlight Searchlight         guifg=#FFEE99 guibg=#A37ACC
" vim.g.VM_highlight_matches = ''
highlight! link CocHintHighlight NONE
highlight! link shCommandSub    Constant
highlight! link IncSearchCursor IncSearch
highlight! link jsonKeyword     Function
let g:VM_Extend_hl = 'VMExtend'
let g:VM_Cursor_hl = 'VMCursor'
let g:VM_Mono_hl = 'VMMono'