" 'nms.vim' -- A color scheme, only supports 24bit true color
" Maintainer Alex Lende (ajlende@gmail.com)
" Colors inspired by http://i.imgur.com/Q4KPsHe.jpg

hi clear

if exists("syntax_on")
	syntax reset
endif

let g:colors_name = "nms"

let s:dark_black     = "#002635"
let s:black          = "#00384d"
let s:bright_black   = "#06858d"
let s:dark_red       = "#b13f49"
let s:red            = "#ff5a67"
let s:bright_red     = "#ff828c"
let s:pale_red       = "#ffb3b9"
let s:dark_green     = "#58874d"
let s:green          = "#7fc06e"
let s:bright_green   = "#aff59d"
let s:dark_yellow    = "#b19021"
let s:yellow         = "#ffcc1b"
let s:bright_yellow  = "#ffec86"
let s:dark_blue      = "#009592"
let s:blue           = "#00d7d1"
let s:bright_blue    = "#79dcda"
let s:dark_magenta   = "#a86433"
let s:magenta        = "#f08e48"
let s:bright_magenta = "#f0aa78"
let s:dark_cyan      = "#6d4f74"
let s:cyan           = "#9a70a4"
let s:bright_cyan    = "#c196cc"
let s:dark_white     = "#a1a19a"
let s:white          = "#e6e6dc"
let s:bright_white   = "#fafaf8"

let s:none="NONE"
let s:bold="bold"
let s:reverse="reverse"
let s:undercurl="undercurl"

if !exists("g:nms_background")
    let g:nms_background=1
endif

if &background == "light"
    let s:fg=s:black
    if g:nms_background == 1
        let s:bg=s:white
    else
        let s:bg=s:none
        " let s:bg=s:white
    endif
    execute 'hi Boolean      gui='.s:none.'      guifg='.s:dark_green.'    guibg='.s:none
    execute 'hi ColorColumn  gui='.s:none.'      guifg='.s:none.'          guibg='.s:bright_white
    execute 'hi Comment      gui='.s:none.'      guifg='.s:dark_white.'    guibg='.s:none
    execute 'hi Conceal      gui='.s:bold.'      guifg='.s:black.'         guibg='.s:none
    execute 'hi Conditional  gui='.s:none.'      guifg='.s:dark_blue.'     guibg='.s:none
    execute 'hi Constant     gui='.s:none.'      guifg='.s:dark_magenta.'  guibg='.s:none
    execute 'hi Cursor       gui='.s:reverse.'   guifg='.s:none.'          guibg='.s:none
    execute 'hi CursorColumn gui='.s:none.'      guifg='.s:none.'          guibg='.s:none
    execute 'hi CursorLine   gui='.s:none.'      guifg='.s:none.'          guibg='.s:bright_white
    execute 'hi CursorLineNr gui='.s:none.'      guifg='.s:black.'         guibg='.s:bright_white
    execute 'hi DiffAdd      gui='.s:none.'      guifg='.s:none.'          guibg='.s:bright_green
    execute 'hi DiffChange   gui='.s:none.'      guifg='.s:none.'          guibg='.s:bright_blue
    execute 'hi DiffDelete   gui='.s:none.'      guifg='.s:none.'          guibg='.s:pale_red
    execute 'hi DiffText     gui='.s:bold.'      guifg='.s:none.'          guibg='.s:bright_blue
    execute 'hi Directory    gui='.s:none.'      guifg='.s:red.'           guibg='.s:none
    execute 'hi Error        gui='.s:none.'      guifg='.s:none.'          guibg='.s:pale_red
    execute 'hi ErrorMsg     gui='.s:none.'      guifg='.s:none.'          guibg='.s:pale_red
    execute 'hi FoldColumn   gui='.s:none.'      guifg='.s:dark_white.'    guibg='.s:none
    execute 'hi Folded       gui='.s:none.'      guifg='.s:dark_white.'    guibg='.s:none
    execute 'hi Ignore       gui='.s:none.'      guifg='.s:none.'          guibg='.s:none
    execute 'hi IncSearch    gui='.s:none.'      guifg='.s:none.'          guibg='.s:bright_white
    execute 'hi LineNr       gui='.s:none.'      guifg='.s:dark_white.'    guibg='.s:none
    execute 'hi MatchParen   gui='.s:none.'      guifg='.s:none.'          guibg='.s:bright_blue
    execute 'hi ModeMsg      gui='.s:none.'      guifg='.s:none.'          guibg='.s:none
    execute 'hi MoreMsg      gui='.s:none.'      guifg='.s:red.'           guibg='.s:none
    execute 'hi NonText      gui='.s:none.'      guifg='.s:dark_white.'    guibg='.s:bg
    execute 'hi Normal       gui='.s:none.'      guifg='.s:fg.'            guibg='.s:bg
    execute 'hi Number       gui='.s:none.'      guifg='.s:cyan.'          guibg='.s:none
    execute 'hi Pmenu        gui='.s:none.'      guifg='.s:none.'          guibg='.s:bright_white
    execute 'hi PmenuSbar    gui='.s:none.'      guifg='.s:none.'          guibg='.s:dark_white
    execute 'hi PmenuSel     gui='.s:bold.'      guifg='.s:bright_white.'  guibg='.s:red
    execute 'hi PmenuThumb   gui='.s:none.'      guifg='.s:none.'          guibg='.s:white
    execute 'hi Question     gui='.s:none.'      guifg='.s:none.'          guibg='.s:none
    execute 'hi Search       gui='.s:none.'      guifg='.s:none.'          guibg='.s:none
    execute 'hi SignColumn   gui='.s:none.'      guifg='.s:dark_white.'    guibg='.s:none
    execute 'hi Special      gui='.s:none.'      guifg='.s:red.'           guibg='.s:none
    execute 'hi SpecialKey   gui='.s:none.'      guifg='.s:dark_white.'    guibg='.s:none
    execute 'hi SpellBad     gui='.s:undercurl.' guifg='.s:none.'          guibg='.s:pale_red
    execute 'hi SpellCap     gui='.s:undercurl.' guifg='.s:none.'          guibg='.s:none
    execute 'hi SpellLocal   gui='.s:undercurl.' guifg='.s:none.'          guibg='.s:bright_green
    execute 'hi SpellRare    gui='.s:undercurl.' guifg='.s:none.'          guibg='.s:bright_blue
    execute 'hi Statement    gui='.s:none.'      guifg='.s:bright_black.'  guibg='.s:none
    execute 'hi StatusLine   gui='.s:none.'      guifg='.s:none.'          guibg='.s:bright_white
    execute 'hi StatusLineNC gui='.s:none.'      guifg='.s:none.'          guibg='.s:bright_white
    execute 'hi StorageClass gui='.s:none.'      guifg='.s:red.'           guibg='.s:none
    execute 'hi String       gui='.s:none.'      guifg='.s:dark_yellow.'   guibg='.s:none
    execute 'hi TabLine      gui='.s:none.'      guifg='.s:none.'          guibg='.s:bright_white
    execute 'hi TabLineFill  gui='.s:none.'      guifg='.s:blue.'          guibg='.s:bright_white
    execute 'hi TabLineSel   gui='.s:bold.'      guifg='.s:bright_white.'  guibg='.s:red
    execute 'hi Title        gui='.s:none.'      guifg='.s:red.'           guibg='.s:none
    execute 'hi Todo         gui='.s:bold.'      guifg='.s:bright_black.'  guibg='.s:none
    execute 'hi Type         gui='.s:none.'      guifg='.s:dark_yellow.'   guibg='.s:none
    execute 'hi Underlined   gui='.s:none.'      guifg='.s:none.'          guibg='.s:none
    execute 'hi VertSplit    gui='.s:none.'      guifg='.s:dark_white.'    guibg='.s:none
    execute 'hi Visual       gui='.s:none.'      guifg='.s:none.'          guibg='.s:bright_white
    execute 'hi VisualNOS    gui='.s:none.'      guifg='.s:none.'          guibg='.s:none
    execute 'hi WarningMsg   gui='.s:none.'      guifg='.s:none.'          guibg='.s:bright_yellow
    execute 'hi WildMenu     gui='.s:bold.'      guifg='.s:bright_white.'  guibg='.s:red
    execute 'hi Identifier   gui='.s:none.'      guifg='.s:red.'           guibg='.s:none
    execute 'hi PreProc      gui='.s:none.'      guifg='.s:none.'          guibg='.s:none
elseif &background == "dark"
    let s:fg=s:white
    if g:nms_background == 1
        let s:bg=s:black
    else
        let s:bg=s:none
    endif
    execute 'hi Boolean      gui='.s:none.'      guifg='.s:green.'         guibg='.s:none
    execute 'hi ColorColumn  gui='.s:none.'      guifg='.s:none.'          guibg='.s:dark_black
    execute 'hi Comment      gui='.s:none.'      guifg='.s:bright_black.'  guibg='.s:none
    execute 'hi Conceal      gui='.s:none.'      guifg='.s:blue.'          guibg='.s:none
    execute 'hi Conditional  gui='.s:none.'      guifg='.s:blue.'          guibg='.s:none
    execute 'hi Constant     gui='.s:none.'      guifg='.s:magenta.'       guibg='.s:none
    execute 'hi Cursor       gui='.s:reverse.'   guifg='.s:none.'          guibg='.s:none
    execute 'hi CursorColumn gui='.s:none.'      guifg='.s:none.'          guibg='.s:none
    execute 'hi CursorLine   gui='.s:none.'      guifg='.s:none.'          guibg='.s:dark_black
    execute 'hi CursorLineNr gui='.s:none.'      guifg='.s:bright_white.'  guibg='.s:dark_black
    execute 'hi DiffAdd      gui='.s:none.'      guifg='.s:none.'          guibg='.s:green
    execute 'hi DiffChange   gui='.s:none.'      guifg='.s:none.'          guibg='.s:dark_blue
    execute 'hi DiffDelete   gui='.s:none.'      guifg='.s:none.'          guibg='.s:red
    execute 'hi DiffText     gui='.s:bold.'      guifg='.s:none.'          guibg='.s:dark_blue
    execute 'hi Directory    gui='.s:none.'      guifg='.s:bright_black.'  guibg='.s:none
    execute 'hi Error        gui='.s:none.'      guifg='.s:none.'          guibg='.s:red
    execute 'hi ErrorMsg     gui='.s:none.'      guifg='.s:white.'         guibg='.s:red
    execute 'hi FoldColumn   gui='.s:none.'      guifg='.s:bright_black.'  guibg='.s:none
    execute 'hi Folded       gui='.s:none.'      guifg='.s:bright_black.'  guibg='.s:none
    execute 'hi Ignore       gui='.s:none.'      guifg='.s:none.'          guibg='.s:none
    execute 'hi IncSearch    gui='.s:none.'      guifg='.s:none.'          guibg='.s:dark_blue
    execute 'hi LineNr       gui='.s:none.'      guifg='.s:bright_black.'  guibg='.s:none
    execute 'hi MatchParen   gui='.s:none.'      guifg='.s:none.'          guibg='.s:bright_black
    execute 'hi ModeMsg      gui='.s:none.'      guifg='.s:none.'          guibg='.s:none
    execute 'hi MoreMsg      gui='.s:none.'      guifg='.s:bright_black.'  guibg='.s:none
    execute 'hi NonText      gui='.s:none.'      guifg='.s:bright_black.'  guibg='.s:none
    execute 'hi Normal       gui='.s:none.'      guifg='.s:fg.'            guibg='.s:bg
    execute 'hi Number       gui='.s:none.'      guifg='.s:bright_cyan.'   guibg='.s:none
    execute 'hi Pmenu        gui='.s:none.'      guifg='.s:bright_black.'  guibg='.s:black
    execute 'hi PmenuSbar    gui='.s:none.'      guifg='.s:none.'          guibg='.s:black
    execute 'hi PmenuSel     gui='.s:bold.'      guifg='.s:bright_white.'  guibg='.s:black
    execute 'hi PmenuThumb   gui='.s:none.'      guifg='.s:none.'          guibg='.s:black
    execute 'hi Question     gui='.s:none.'      guifg='.s:none.'          guibg='.s:none
    execute 'hi Search       gui='.s:none.'      guifg='.s:black.'         guibg='.s:blue
    execute 'hi SignColumn   gui='.s:none.'      guifg='.s:bright_black.'  guibg='.s:none
    execute 'hi Special      gui='.s:none.'      guifg='.s:red.'           guibg='.s:none
    execute 'hi SpecialKey   gui='.s:none.'      guifg='.s:bright_black.'  guibg='.s:none
    execute 'hi SpellBad     gui='.s:undercurl.' guifg='.s:none.'          guibg='.s:red
    execute 'hi SpellCap     gui='.s:undercurl.' guifg='.s:none.'          guibg='.s:none
    execute 'hi SpellLocal   gui='.s:undercurl.' guifg='.s:none.'          guibg='.s:green
    execute 'hi SpellRare    gui='.s:undercurl.' guifg='.s:none.'          guibg='.s:dark_blue
    execute 'hi Statement    gui='.s:none.'      guifg='.s:blue.'          guibg='.s:none
    execute 'hi StatusLine   gui='.s:none.'      guifg='.s:bright_black.'  guibg='.s:dark_black
    execute 'hi StatusLineNC gui='.s:none.'      guifg='.s:bright_black.'  guibg='.s:dark_black
    execute 'hi StorageClass gui='.s:none.'      guifg='.s:red.'           guibg='.s:none
    execute 'hi String       gui='.s:none.'      guifg='.s:yellow.'        guibg='.s:none
    execute 'hi TabLine      gui='.s:none.'      guifg='.s:bright_black.'  guibg='.s:dark_black
    execute 'hi TabLineFill  gui='.s:none.'      guifg='.s:none.'          guibg='.s:dark_black
    execute 'hi TabLineSel   gui='.s:bold.'      guifg='.s:bright_white.'  guibg='.s:dark_black
    execute 'hi Title        gui='.s:none.'      guifg='.s:green.'         guibg='.s:none
    execute 'hi Todo         gui='.s:bold.'      guifg='.s:yellow.'        guibg='.s:none
    execute 'hi Type         gui='.s:none.'      guifg='.s:yellow.'        guibg='.s:none
    execute 'hi Underlined   gui='.s:none.'      guifg='.s:none.'          guibg='.s:none
    execute 'hi VertSplit    gui='.s:none.'      guifg='.s:bright_black.'  guibg='.s:none
    execute 'hi Visual       gui='.s:none.'      guifg='.s:none.'          guibg='.s:bright_black
    execute 'hi VisualNOS    gui='.s:none.'      guifg='.s:none.'          guibg='.s:none
    execute 'hi WarningMsg   gui='.s:none.'      guifg='.s:black.'         guibg='.s:yellow
    execute 'hi WildMenu     gui='.s:bold.'      guifg='.s:bright_white.'  guibg='.s:dark_black
    execute 'hi Identifier   gui='.s:none.'      guifg='.s:red.'           guibg='.s:none
    execute 'hi PreProc      gui='.s:none.'      guifg='.s:none.'          guibg='.s:none
endif
