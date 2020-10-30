" vi:syntax=vim

" base16-vim (https://github.com/chriskempson/base16-vim)
" by Chris Kempson (http://chriskempson.com)

" GUI color definitions
let g:base16_gui00 = $BASE16_00
let g:base16_gui01 = $BASE16_01
let g:base16_gui02 = $BASE16_02
let g:base16_gui03 = $BASE16_03
let g:base16_gui04 = $BASE16_04
let g:base16_gui05 = $BASE16_05
let g:base16_gui06 = $BASE16_06
let g:base16_gui07 = $BASE16_07
let g:base16_gui08 = $BASE16_08
let g:base16_gui09 = $BASE16_09
let g:base16_gui0A = $BASE16_0A
let g:base16_gui0B = $BASE16_0B
let g:base16_gui0C = $BASE16_0C
let g:base16_gui0D = $BASE16_0D
let g:base16_gui0E = $BASE16_0E
let g:base16_gui0F = $BASE16_0F

" Terminal color definitions
let g:base16_cterm00 = "00"
let g:base16_cterm03 = "08"
let g:base16_cterm05 = "07"
let g:base16_cterm07 = "15"
let g:base16_cterm08 = "01"
let g:base16_cterm0A = "03"
let g:base16_cterm0B = "02"
let g:base16_cterm0C = "06"
let g:base16_cterm0D = "04"
let g:base16_cterm0E = "05"
if exists("base16colorspace") && base16colorspace == "256"
  let g:base16_cterm01 = "18"
  let g:base16_cterm02 = "19"
  let g:base16_cterm04 = "20"
  let g:base16_cterm06 = "21"
  let g:base16_cterm09 = "16"
  let g:base16_cterm0F = "17"
else
  let g:base16_cterm01 = "10"
  let g:base16_cterm02 = "11"
  let g:base16_cterm04 = "12"
  let g:base16_cterm06 = "13"
  let g:base16_cterm09 = "09"
  let g:base16_cterm0F = "14"
endif

" Neovim terminal colours
if has("nvim")
  let g:terminal_color_0 =  "#" . g:base16_gui00
  let g:terminal_color_1 =  "#" . g:base16_gui08
  let g:terminal_color_2 =  "#" . g:base16_gui0B
  let g:terminal_color_3 =  "#" . g:base16_gui0A
  let g:terminal_color_4 =  "#" . g:base16_gui0D
  let g:terminal_color_5 =  "#" . g:base16_gui0E
  let g:terminal_color_6 =  "#" . g:base16_gui0C
  let g:terminal_color_7 =  "#" . g:base16_gui05
  let g:terminal_color_8 =  "#" . g:base16_gui03
  let g:terminal_color_9 =  "#" . g:base16_gui08
  let g:terminal_color_10 = "#" . g:base16_gui0B
  let g:terminal_color_11 = "#" . g:base16_gui0A
  let g:terminal_color_12 = "#" . g:base16_gui0D
  let g:terminal_color_13 = "#" . g:base16_gui0E
  let g:terminal_color_14 = "#" . g:base16_gui0C
  let g:terminal_color_15 = "#" . g:base16_gui07
  let g:terminal_color_background = g:terminal_color_0
  let g:terminal_color_foreground = g:terminal_color_5
  if &background == "light"
    let g:terminal_color_background = g:terminal_color_7
    let g:terminal_color_foreground = g:terminal_color_2
  endif
elseif has("terminal")
  let g:terminal_ansi_colors = [
    \  "#" . g:base16_gui00,
    \  "#" . g:base16_gui08,
    \  "#" . g:base16_gui0B,
    \  "#" . g:base16_gui0A,
    \  "#" . g:base16_gui0D,
    \  "#" . g:base16_gui0E,
    \  "#" . g:base16_gui0C,
    \  "#" . g:base16_gui05,
    \  "#" . g:base16_gui03,
    \  "#" . g:base16_gui08,
    \  "#" . g:base16_gui0B,
    \  "#" . g:base16_gui0A,
    \  "#" . g:base16_gui0D,
    \  "#" . g:base16_gui0E,
    \  "#" . g:base16_gui0C,
    \  "#" . g:base16_gui07,
    \ ]
endif

" Theme setup
hi clear
syntax reset
let g:colors_name = "base16"

" Highlighting function
" Optional variables are attributes and guisp
function! g:Base16hi(group, guifg, guibg, ctermfg, ctermbg, ...)
  let l:attr = get(a:, 1, "")
  let l:guisp = get(a:, 2, "")

  if a:guifg != ""
    exec "hi " . a:group . " guifg=#" . a:guifg
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=#" . a:guibg
  endif
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . a:ctermbg
  endif
  if l:attr != ""
    exec "hi " . a:group . " gui=" . l:attr . " cterm=" . l:attr
  endif
  if l:guisp != ""
    exec "hi " . a:group . " guisp=#" . l:guisp
  endif
endfunction


fun <sid>hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  call g:Base16hi(a:group, a:guifg, a:guibg, a:ctermfg, a:ctermbg, a:attr, a:guisp)
endfun

" Vim editor colors
call <sid>hi("Normal",        g:base16_gui05, g:base16_gui00, g:base16_cterm05, g:base16_cterm00, "", "")
call <sid>hi("Bold",          "", "", "", "", "bold", "")
call <sid>hi("Debug",         g:base16_gui08, "", g:base16_cterm08, "", "", "")
call <sid>hi("Directory",     g:base16_gui0D, "", g:base16_cterm0D, "", "", "")
call <sid>hi("Error",         g:base16_gui00, g:base16_gui08, g:base16_cterm00, g:base16_cterm08, "", "")
call <sid>hi("ErrorMsg",      g:base16_gui08, g:base16_gui00, g:base16_cterm08, g:base16_cterm00, "", "")
call <sid>hi("Exception",     g:base16_gui08, "", g:base16_cterm08, "", "", "")
call <sid>hi("FoldColumn",    g:base16_gui0C, g:base16_gui01, g:base16_cterm0C, g:base16_cterm01, "", "")
call <sid>hi("Folded",        g:base16_gui03, g:base16_gui01, g:base16_cterm03, g:base16_cterm01, "", "")
call <sid>hi("IncSearch",     g:base16_gui01, g:base16_gui09, g:base16_cterm01, g:base16_cterm09, "none", "")
call <sid>hi("Italic",        "", "", "", "", "none", "")
call <sid>hi("Macro",         g:base16_gui08, "", g:base16_cterm08, "", "", "")
call <sid>hi("MatchParen",    "", g:base16_gui03, "", g:base16_cterm03,  "", "")
call <sid>hi("ModeMsg",       g:base16_gui0B, "", g:base16_cterm0B, "", "", "")
call <sid>hi("MoreMsg",       g:base16_gui0B, "", g:base16_cterm0B, "", "", "")
call <sid>hi("Question",      g:base16_gui0D, "", g:base16_cterm0D, "", "", "")
call <sid>hi("Search",        g:base16_gui01, g:base16_gui0A, g:base16_cterm01, g:base16_cterm0A,  "", "")
call <sid>hi("Substitute",    g:base16_gui01, g:base16_gui0A, g:base16_cterm01, g:base16_cterm0A, "none", "")
call <sid>hi("SpecialKey",    g:base16_gui03, "", g:base16_cterm03, "", "", "")
call <sid>hi("TooLong",       g:base16_gui08, "", g:base16_cterm08, "", "", "")
call <sid>hi("Underlined",    g:base16_gui08, "", g:base16_cterm08, "", "", "")
call <sid>hi("Visual",        "", g:base16_gui02, "", g:base16_cterm02, "", "")
call <sid>hi("VisualNOS",     g:base16_gui08, "", g:base16_cterm08, "", "", "")
call <sid>hi("WarningMsg",    g:base16_gui08, "", g:base16_cterm08, "", "", "")
call <sid>hi("WildMenu",      g:base16_gui08, g:base16_gui0A, g:base16_cterm08, "", "", "")
call <sid>hi("Title",         g:base16_gui0D, "", g:base16_cterm0D, "", "none", "")
call <sid>hi("Conceal",       g:base16_gui0D, g:base16_gui00, g:base16_cterm0D, g:base16_cterm00, "", "")
call <sid>hi("Cursor",        g:base16_gui00, g:base16_gui05, g:base16_cterm00, g:base16_cterm05, "", "")
call <sid>hi("NonText",       g:base16_gui03, "", g:base16_cterm03, "", "", "")
call <sid>hi("LineNr",        g:base16_gui03, g:base16_gui01, g:base16_cterm03, g:base16_cterm01, "", "")
call <sid>hi("SignColumn",    g:base16_gui03, g:base16_gui01, g:base16_cterm03, g:base16_cterm01, "", "")
call <sid>hi("StatusLine",    g:base16_gui04, g:base16_gui02, g:base16_cterm04, g:base16_cterm02, "none", "")
call <sid>hi("StatusLineNC",  g:base16_gui03, g:base16_gui01, g:base16_cterm03, g:base16_cterm01, "none", "")
call <sid>hi("VertSplit",     g:base16_gui02, g:base16_gui02, g:base16_cterm02, g:base16_cterm02, "none", "")
call <sid>hi("ColorColumn",   "", g:base16_gui01, "", g:base16_cterm01, "none", "")
call <sid>hi("CursorColumn",  "", g:base16_gui01, "", g:base16_cterm01, "none", "")
call <sid>hi("CursorLine",    "", g:base16_gui01, "", g:base16_cterm01, "none", "")
call <sid>hi("CursorLineNr",  g:base16_gui04, g:base16_gui01, g:base16_cterm04, g:base16_cterm01, "", "")
call <sid>hi("QuickFixLine",  "", g:base16_gui01, "", g:base16_cterm01, "none", "")
call <sid>hi("PMenu",         g:base16_gui05, g:base16_gui01, g:base16_cterm05, g:base16_cterm01, "none", "")
call <sid>hi("PMenuSel",      g:base16_gui01, g:base16_gui05, g:base16_cterm01, g:base16_cterm05, "", "")
call <sid>hi("TabLine",       g:base16_gui03, g:base16_gui01, g:base16_cterm03, g:base16_cterm01, "none", "")
call <sid>hi("TabLineFill",   g:base16_gui03, g:base16_gui01, g:base16_cterm03, g:base16_cterm01, "none", "")
call <sid>hi("TabLineSel",    g:base16_gui0B, g:base16_gui01, g:base16_cterm0B, g:base16_cterm01, "none", "")

" Standard syntax highlighting
call <sid>hi("Boolean",      g:base16_gui09, "", g:base16_cterm09, "", "", "")
call <sid>hi("Character",    g:base16_gui08, "", g:base16_cterm08, "", "", "")
call <sid>hi("Comment",      g:base16_gui03, "", g:base16_cterm03, "", "", "")
call <sid>hi("Conditional",  g:base16_gui0E, "", g:base16_cterm0E, "", "", "")
call <sid>hi("Constant",     g:base16_gui09, "", g:base16_cterm09, "", "", "")
call <sid>hi("Define",       g:base16_gui0E, "", g:base16_cterm0E, "", "none", "")
call <sid>hi("Delimiter",    g:base16_gui0F, "", g:base16_cterm0F, "", "", "")
call <sid>hi("Float",        g:base16_gui09, "", g:base16_cterm09, "", "", "")
call <sid>hi("Function",     g:base16_gui0D, "", g:base16_cterm0D, "", "", "")
call <sid>hi("Identifier",   g:base16_gui08, "", g:base16_cterm08, "", "none", "")
call <sid>hi("Include",      g:base16_gui0D, "", g:base16_cterm0D, "", "", "")
call <sid>hi("Keyword",      g:base16_gui0E, "", g:base16_cterm0E, "", "", "")
call <sid>hi("Label",        g:base16_gui0A, "", g:base16_cterm0A, "", "", "")
call <sid>hi("Number",       g:base16_gui09, "", g:base16_cterm09, "", "", "")
call <sid>hi("Operator",     g:base16_gui05, "", g:base16_cterm05, "", "none", "")
call <sid>hi("PreProc",      g:base16_gui0A, "", g:base16_cterm0A, "", "", "")
call <sid>hi("Repeat",       g:base16_gui0A, "", g:base16_cterm0A, "", "", "")
call <sid>hi("Special",      g:base16_gui0C, "", g:base16_cterm0C, "", "", "")
call <sid>hi("SpecialChar",  g:base16_gui0F, "", g:base16_cterm0F, "", "", "")
call <sid>hi("Statement",    g:base16_gui08, "", g:base16_cterm08, "", "", "")
call <sid>hi("StorageClass", g:base16_gui0A, "", g:base16_cterm0A, "", "", "")
call <sid>hi("String",       g:base16_gui0B, "", g:base16_cterm0B, "", "", "")
call <sid>hi("Structure",    g:base16_gui0E, "", g:base16_cterm0E, "", "", "")
call <sid>hi("Tag",          g:base16_gui0A, "", g:base16_cterm0A, "", "", "")
call <sid>hi("Todo",         g:base16_gui0A, g:base16_gui01, g:base16_cterm0A, g:base16_cterm01, "", "")
call <sid>hi("Type",         g:base16_gui0A, "", g:base16_cterm0A, "", "none", "")
call <sid>hi("Typedef",      g:base16_gui0A, "", g:base16_cterm0A, "", "", "")

" C highlighting
call <sid>hi("cOperator",   g:base16_gui0C, "", g:base16_cterm0C, "", "", "")
call <sid>hi("cPreCondit",  g:base16_gui0E, "", g:base16_cterm0E, "", "", "")

" C# highlighting
call <sid>hi("csClass",                 g:base16_gui0A, "", g:base16_cterm0A, "", "", "")
call <sid>hi("csAttribute",             g:base16_gui0A, "", g:base16_cterm0A, "", "", "")
call <sid>hi("csModifier",              g:base16_gui0E, "", g:base16_cterm0E, "", "", "")
call <sid>hi("csType",                  g:base16_gui08, "", g:base16_cterm08, "", "", "")
call <sid>hi("csUnspecifiedStatement",  g:base16_gui0D, "", g:base16_cterm0D, "", "", "")
call <sid>hi("csContextualStatement",   g:base16_gui0E, "", g:base16_cterm0E, "", "", "")
call <sid>hi("csNewDecleration",        g:base16_gui08, "", g:base16_cterm08, "", "", "")

" CSS highlighting
call <sid>hi("cssBraces",      g:base16_gui05, "", g:base16_cterm05, "", "", "")
call <sid>hi("cssClassName",   g:base16_gui0E, "", g:base16_cterm0E, "", "", "")
call <sid>hi("cssColor",       g:base16_gui0C, "", g:base16_cterm0C, "", "", "")

" Diff highlighting
call <sid>hi("DiffAdd",      g:base16_gui0B, g:base16_gui01,  g:base16_cterm0B, g:base16_cterm01, "", "")
call <sid>hi("DiffChange",   g:base16_gui03, g:base16_gui01,  g:base16_cterm03, g:base16_cterm01, "", "")
call <sid>hi("DiffDelete",   g:base16_gui08, g:base16_gui01,  g:base16_cterm08, g:base16_cterm01, "", "")
call <sid>hi("DiffText",     g:base16_gui0D, g:base16_gui01,  g:base16_cterm0D, g:base16_cterm01, "", "")
call <sid>hi("DiffAdded",    g:base16_gui0B, g:base16_gui00,  g:base16_cterm0B, g:base16_cterm00, "", "")
call <sid>hi("DiffFile",     g:base16_gui08, g:base16_gui00,  g:base16_cterm08, g:base16_cterm00, "", "")
call <sid>hi("DiffNewFile",  g:base16_gui0B, g:base16_gui00,  g:base16_cterm0B, g:base16_cterm00, "", "")
call <sid>hi("DiffLine",     g:base16_gui0D, g:base16_gui00,  g:base16_cterm0D, g:base16_cterm00, "", "")
call <sid>hi("DiffRemoved",  g:base16_gui08, g:base16_gui00,  g:base16_cterm08, g:base16_cterm00, "", "")

" Git highlighting
call <sid>hi("gitcommitOverflow",       g:base16_gui08, "", g:base16_cterm08, "", "", "")
call <sid>hi("gitcommitSummary",        g:base16_gui0B, "", g:base16_cterm0B, "", "", "")
call <sid>hi("gitcommitComment",        g:base16_gui03, "", g:base16_cterm03, "", "", "")
call <sid>hi("gitcommitUntracked",      g:base16_gui03, "", g:base16_cterm03, "", "", "")
call <sid>hi("gitcommitDiscarded",      g:base16_gui03, "", g:base16_cterm03, "", "", "")
call <sid>hi("gitcommitSelected",       g:base16_gui03, "", g:base16_cterm03, "", "", "")
call <sid>hi("gitcommitHeader",         g:base16_gui0E, "", g:base16_cterm0E, "", "", "")
call <sid>hi("gitcommitSelectedType",   g:base16_gui0D, "", g:base16_cterm0D, "", "", "")
call <sid>hi("gitcommitUnmergedType",   g:base16_gui0D, "", g:base16_cterm0D, "", "", "")
call <sid>hi("gitcommitDiscardedType",  g:base16_gui0D, "", g:base16_cterm0D, "", "", "")
call <sid>hi("gitcommitBranch",         g:base16_gui09, "", g:base16_cterm09, "", "bold", "")
call <sid>hi("gitcommitUntrackedFile",  g:base16_gui0A, "", g:base16_cterm0A, "", "", "")
call <sid>hi("gitcommitUnmergedFile",   g:base16_gui08, "", g:base16_cterm08, "", "bold", "")
call <sid>hi("gitcommitDiscardedFile",  g:base16_gui08, "", g:base16_cterm08, "", "bold", "")
call <sid>hi("gitcommitSelectedFile",   g:base16_gui0B, "", g:base16_cterm0B, "", "bold", "")

" GitGutter highlighting
call <sid>hi("GitGutterAdd",     g:base16_gui0B, g:base16_gui01, g:base16_cterm0B, g:base16_cterm01, "", "")
call <sid>hi("GitGutterChange",  g:base16_gui0D, g:base16_gui01, g:base16_cterm0D, g:base16_cterm01, "", "")
call <sid>hi("GitGutterDelete",  g:base16_gui08, g:base16_gui01, g:base16_cterm08, g:base16_cterm01, "", "")
call <sid>hi("GitGutterChangeDelete",  g:base16_gui0E, g:base16_gui01, g:base16_cterm0E, g:base16_cterm01, "", "")

" HTML highlighting
call <sid>hi("htmlBold",    g:base16_gui0A, "", g:base16_cterm0A, "", "", "")
call <sid>hi("htmlItalic",  g:base16_gui0E, "", g:base16_cterm0E, "", "", "")
call <sid>hi("htmlEndTag",  g:base16_gui05, "", g:base16_cterm05, "", "", "")
call <sid>hi("htmlTag",     g:base16_gui05, "", g:base16_cterm05, "", "", "")

" JavaScript highlighting
call <sid>hi("javaScript",        g:base16_gui05, "", g:base16_cterm05, "", "", "")
call <sid>hi("javaScriptBraces",  g:base16_gui05, "", g:base16_cterm05, "", "", "")
call <sid>hi("javaScriptNumber",  g:base16_gui09, "", g:base16_cterm09, "", "", "")
" pangloss/vim-javascript highlighting
call <sid>hi("jsOperator",          g:base16_gui0D, "", g:base16_cterm0D, "", "", "")
call <sid>hi("jsStatement",         g:base16_gui0E, "", g:base16_cterm0E, "", "", "")
call <sid>hi("jsReturn",            g:base16_gui0E, "", g:base16_cterm0E, "", "", "")
call <sid>hi("jsThis",              g:base16_gui08, "", g:base16_cterm08, "", "", "")
call <sid>hi("jsClassDefinition",   g:base16_gui0A, "", g:base16_cterm0A, "", "", "")
call <sid>hi("jsFunction",          g:base16_gui0E, "", g:base16_cterm0E, "", "", "")
call <sid>hi("jsFuncName",          g:base16_gui0D, "", g:base16_cterm0D, "", "", "")
call <sid>hi("jsFuncCall",          g:base16_gui0D, "", g:base16_cterm0D, "", "", "")
call <sid>hi("jsClassFuncName",     g:base16_gui0D, "", g:base16_cterm0D, "", "", "")
call <sid>hi("jsClassMethodType",   g:base16_gui0E, "", g:base16_cterm0E, "", "", "")
call <sid>hi("jsRegexpString",      g:base16_gui0C, "", g:base16_cterm0C, "", "", "")
call <sid>hi("jsGlobalObjects",     g:base16_gui0A, "", g:base16_cterm0A, "", "", "")
call <sid>hi("jsGlobalNodeObjects", g:base16_gui0A, "", g:base16_cterm0A, "", "", "")
call <sid>hi("jsExceptions",        g:base16_gui0A, "", g:base16_cterm0A, "", "", "")
call <sid>hi("jsBuiltins",          g:base16_gui0A, "", g:base16_cterm0A, "", "", "")

" Mail highlighting
call <sid>hi("mailQuoted1",  g:base16_gui0A, "", g:base16_cterm0A, "", "", "")
call <sid>hi("mailQuoted2",  g:base16_gui0B, "", g:base16_cterm0B, "", "", "")
call <sid>hi("mailQuoted3",  g:base16_gui0E, "", g:base16_cterm0E, "", "", "")
call <sid>hi("mailQuoted4",  g:base16_gui0C, "", g:base16_cterm0C, "", "", "")
call <sid>hi("mailQuoted5",  g:base16_gui0D, "", g:base16_cterm0D, "", "", "")
call <sid>hi("mailQuoted6",  g:base16_gui0A, "", g:base16_cterm0A, "", "", "")
call <sid>hi("mailURL",      g:base16_gui0D, "", g:base16_cterm0D, "", "", "")
call <sid>hi("mailEmail",    g:base16_gui0D, "", g:base16_cterm0D, "", "", "")

" Markdown highlighting
call <sid>hi("markdownCode",              g:base16_gui0B, "", g:base16_cterm0B, "", "", "")
call <sid>hi("markdownError",             g:base16_gui05, g:base16_gui00, g:base16_cterm05, g:base16_cterm00, "", "")
call <sid>hi("markdownCodeBlock",         g:base16_gui0B, "", g:base16_cterm0B, "", "", "")
call <sid>hi("markdownHeadingDelimiter",  g:base16_gui0D, "", g:base16_cterm0D, "", "", "")

" NERDTree highlighting
call <sid>hi("NERDTreeDirSlash",  g:base16_gui0D, "", g:base16_cterm0D, "", "", "")
call <sid>hi("NERDTreeExecFile",  g:base16_gui05, "", g:base16_cterm05, "", "", "")

" PHP highlighting
call <sid>hi("phpMemberSelector",  g:base16_gui05, "", g:base16_cterm05, "", "", "")
call <sid>hi("phpComparison",      g:base16_gui05, "", g:base16_cterm05, "", "", "")
call <sid>hi("phpParent",          g:base16_gui05, "", g:base16_cterm05, "", "", "")
call <sid>hi("phpMethodsVar",      g:base16_gui0C, "", g:base16_cterm0C, "", "", "")

" Python highlighting
call <sid>hi("pythonOperator",  g:base16_gui0E, "", g:base16_cterm0E, "", "", "")
call <sid>hi("pythonRepeat",    g:base16_gui0E, "", g:base16_cterm0E, "", "", "")
call <sid>hi("pythonInclude",   g:base16_gui0E, "", g:base16_cterm0E, "", "", "")
call <sid>hi("pythonStatement", g:base16_gui0E, "", g:base16_cterm0E, "", "", "")

" Ruby highlighting
call <sid>hi("rubyAttribute",               g:base16_gui0D, "", g:base16_cterm0D, "", "", "")
call <sid>hi("rubyConstant",                g:base16_gui0A, "", g:base16_cterm0A, "", "", "")
call <sid>hi("rubyInterpolationDelimiter",  g:base16_gui0F, "", g:base16_cterm0F, "", "", "")
call <sid>hi("rubyRegexp",                  g:base16_gui0C, "", g:base16_cterm0C, "", "", "")
call <sid>hi("rubySymbol",                  g:base16_gui0B, "", g:base16_cterm0B, "", "", "")
call <sid>hi("rubyStringDelimiter",         g:base16_gui0B, "", g:base16_cterm0B, "", "", "")

" SASS highlighting
call <sid>hi("sassidChar",     g:base16_gui08, "", g:base16_cterm08, "", "", "")
call <sid>hi("sassClassChar",  g:base16_gui09, "", g:base16_cterm09, "", "", "")
call <sid>hi("sassInclude",    g:base16_gui0E, "", g:base16_cterm0E, "", "", "")
call <sid>hi("sassMixing",     g:base16_gui0E, "", g:base16_cterm0E, "", "", "")
call <sid>hi("sassMixinName",  g:base16_gui0D, "", g:base16_cterm0D, "", "", "")

" Signify highlighting
call <sid>hi("SignifySignAdd",     g:base16_gui0B, g:base16_gui01, g:base16_cterm0B, g:base16_cterm01, "", "")
call <sid>hi("SignifySignChange",  g:base16_gui0D, g:base16_gui01, g:base16_cterm0D, g:base16_cterm01, "", "")
call <sid>hi("SignifySignDelete",  g:base16_gui08, g:base16_gui01, g:base16_cterm08, g:base16_cterm01, "", "")

" Spelling highlighting
call <sid>hi("SpellBad",     "", "", "", "", "undercurl", g:base16_gui08)
call <sid>hi("SpellLocal",   "", "", "", "", "undercurl", g:base16_gui0C)
call <sid>hi("SpellCap",     "", "", "", "", "undercurl", g:base16_gui0D)
call <sid>hi("SpellRare",    "", "", "", "", "undercurl", g:base16_gui0E)

" Startify highlighting
call <sid>hi("StartifyBracket",  g:base16_gui03, "", g:base16_cterm03, "", "", "")
call <sid>hi("StartifyFile",     g:base16_gui07, "", g:base16_cterm07, "", "", "")
call <sid>hi("StartifyFooter",   g:base16_gui03, "", g:base16_cterm03, "", "", "")
call <sid>hi("StartifyHeader",   g:base16_gui0B, "", g:base16_cterm0B, "", "", "")
call <sid>hi("StartifyNumber",   g:base16_gui09, "", g:base16_cterm09, "", "", "")
call <sid>hi("StartifyPath",     g:base16_gui03, "", g:base16_cterm03, "", "", "")
call <sid>hi("StartifySection",  g:base16_gui0E, "", g:base16_cterm0E, "", "", "")
call <sid>hi("StartifySelect",   g:base16_gui0C, "", g:base16_cterm0C, "", "", "")
call <sid>hi("StartifySlash",    g:base16_gui03, "", g:base16_cterm03, "", "", "")
call <sid>hi("StartifySpecial",  g:base16_gui03, "", g:base16_cterm03, "", "", "")

" Java highlighting
call <sid>hi("javaOperator",     g:base16_gui0D, "", g:base16_cterm0D, "", "", "")

" Remove functions
delf <sid>hi
