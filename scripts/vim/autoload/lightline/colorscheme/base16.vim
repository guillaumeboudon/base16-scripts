let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:color_00 = ["#".g:base16_gui00,  0]
let s:color_01 = ["#".g:base16_gui01, 10]
let s:color_02 = ["#".g:base16_gui02, 11]
let s:color_03 = ["#".g:base16_gui03,  8]
let s:color_04 = ["#".g:base16_gui04, 12]
let s:color_05 = ["#".g:base16_gui05,  7]
let s:color_06 = ["#".g:base16_gui06, 13]
let s:color_07 = ["#".g:base16_gui07, 15]
let s:color_08 = ["#".g:base16_gui08,  1]
let s:color_09 = ["#".g:base16_gui09,  9]
let s:color_0A = ["#".g:base16_gui0A,  3]
let s:color_0B = ["#".g:base16_gui0B,  2]
let s:color_0C = ["#".g:base16_gui0C,  6]
let s:color_0D = ["#".g:base16_gui0D,  4]
let s:color_0E = ["#".g:base16_gui0E,  5]
let s:color_0F = ["#".g:base16_gui0F, 14]

let s:p.normal.left     = [[s:color_00, s:color_0D], [s:color_05, s:color_03]]
let s:p.insert.left     = [[s:color_00, s:color_0B], [s:color_05, s:color_03]]
let s:p.visual.left     = [[s:color_00, s:color_0E], [s:color_05, s:color_03]]
let s:p.replace.left    = [[s:color_00, s:color_08], [s:color_05, s:color_03]]
let s:p.inactive.left   = [[s:color_07, s:color_02]]
" let s:p.inactive.left   = [[ s:color_02, s:color_00 ]]

let s:p.normal.middle   = [[s:color_07, s:color_02]]
let s:p.inactive.middle = [[s:color_07, s:color_02]]
" let s:p.inactive.middle = [[s:color_01, s:color_00]]

let s:p.normal.right    = [[s:color_00, s:color_05], [s:color_06, s:color_03]]
let s:p.inactive.right  = [[s:color_07, s:color_02]]
" let s:p.inactive.right  = [[s:color_01, s:color_00]]

let s:p.normal.error    = [[s:color_01, s:color_08]]
let s:p.normal.warning  = [[s:color_01, s:color_09]]

let s:p.tabline.left    = [[s:color_05, s:color_03]]
let s:p.tabline.middle  = [[s:color_05, s:color_02]]
let s:p.tabline.right   = [[s:color_05, s:color_03]]
let s:p.tabline.tabsel  = [[s:color_02, s:color_0A]]

let g:lightline#colorscheme#base16#palette = lightline#colorscheme#flatten(s:p)

unlet s:color_00 s:color_01 s:color_02 s:color_03 s:color_04 s:color_05 s:color_06 s:color_07 s:color_08 s:color_09 s:color_0A s:color_0B s:color_0C s:color_0D s:color_0E s:color_0F
