" Function calls
syn match pythonFunctionCall '\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\ze\%(\s*(\)'


" Keywords
syn keyword pythonStatement     break continue del return pass yield global assert lambda with
syn keyword pythonStatement     raise nextgroup=pythonExClass skipwhite
syn keyword pythonStatement     def nextgroup=pythonFunction skipwhite
syn keyword pythonStatement     class nextgroup=pythonClass skipwhite
syn keyword pythonClassVar    self cls mcs
syn keyword pythonRepeat        for while
syn keyword pythonConditional   if elif else
syn keyword pythonException     try except finally
" The standard pyrex.vim unconditionally removes the pythonInclude group, so
" we provide a dummy group here to avoid crashing pyrex.vim.
syn keyword pythonInclude       import
syn keyword pythonImport        import
syn match pythonRaiseFromStatement      '\<from\>'
syn match pythonImport          '^\s*\zsfrom\>'

"
" Operators
"
syn keyword pythonOperator      and in is not or
syn match pythonOperator        '\V=\|-\|+\|*\|@\|/\|%\|&\||\|^\|~\|<\|>\|!=\|:='
syn match pythonError           '[$?]\|\([-+@%&|^~]\)\1\{1,}\|\([=*/<>]\)\2\{2,}\|\([+@/%&|^~<>]\)\3\@![-+*@/%&|^~<>]\|\*\*[*@/%&|^<>]\|=[*@/%&|^<>]\|-[+*@/%&|^~<]\|[<!>]\+=\{2,}\|!\{2,}=\+' display

syn match   pythonDecorator    '^\s*\zs@' display nextgroup=pythonDottedName skipwhite
syn match   pythonDottedName '\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\%(\.\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\)*' display contained
syn match   pythonDot        '\.' display containedin=pythonDottedName

"
" Comments
"
syn match   pythonComment       '#.*$' display contains=pythonTodo,@Spell
syn match   pythonRun         '\%^#!.*$' nextgroup=pythonDocString skipempty
syn match   pythonCoding      '\%^.*\%(\n.*\)\?#.*coding[:=]\s*[0-9A-Za-z-_.]\+.*$' nextgroup=pythonDocString skipempty
syn keyword pythonTodo          TODO FIXME XXX contained

"
" Errors
"
syn match pythonError           '\<\d\+[^0-9[:space:]]\+\>' display
" Mixing spaces and tabs also may be used for pretty formatting multiline
" statements
syn match pythonIndentError   '^\s*\%( \t\|\t \)\s*\S'me=e-1 display
" Trailing space errors
syn match pythonSpaceError    '\s\+$' display

"
" Strings
"
syn region pythonBytes    start=+[bB]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonBytesError,pythonBytesContent,@Spell
syn region pythonBytes    start=+[bB]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonBytesError,pythonBytesContent,@Spell
syn region pythonBytes    start=+[bB]'''+ skip=+\\'+ end=+'''+ keepend contains=pythonBytesError,pythonBytesContent,pythonDocTest,pythonSpaceError,@Spell
syn region pythonBytes    start=+[bB]"""+ skip=+\\"+ end=+"""+ keepend contains=pythonBytesError,pythonBytesContent,pythonDocTest2,pythonSpaceError,@Spell

syn match pythonBytesError    '.\+' display contained
syn match pythonBytesContent  '[\u0000-\u00ff]\+' display contained contains=pythonBytesEscape,pythonBytesEscapeError


syn match pythonBytesEscape       +\\[abfnrtv'"\\]+ display contained
syn match pythonBytesEscape       '\\\o\o\=\o\=' display contained
syn match pythonBytesEscapeError  '\\\o\{,2}[89]' display contained
syn match pythonBytesEscape       '\\x\x\{2}' display contained
syn match pythonBytesEscapeError  '\\x\x\=\X' display contained
syn match pythonBytesEscape       '\\$'

syn match pythonUniEscape         '\\u\x\{4}' display contained
syn match pythonUniEscapeError    '\\u\x\{,3}\X' display contained
syn match pythonUniEscape         '\\U\x\{8}' display contained
syn match pythonUniEscapeError    '\\U\x\{,7}\X' display contained
syn match pythonUniEscape         '\\N{[A-Z ]\+}' display contained
syn match pythonUniEscapeError    '\\N{[^A-Z ]\+}' display contained

syn region pythonString start=+'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,@Spell
syn region pythonString start=+"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,@Spell
syn region pythonString start=+'''+ skip=+\\'+ end=+'''+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,pythonDocTest,pythonSpaceError,@Spell
syn region pythonString start=+"""+ skip=+\\"+ end=+"""+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,pythonDocTest2,pythonSpaceError,@Spell

syn region pythonFString matchgroup=pythonString start=+[fF]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,@Spell
syn region pythonFString matchgroup=pythonString start=+[fF]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,@Spell
syn region pythonFString matchgroup=pythonString start=+[fF]'''+ skip=+\\'+ end=+'''+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,pythonDocTest,pythonSpaceError,@Spell
syn region pythonFString matchgroup=pythonString start=+[fF]"""+ skip=+\\"+ end=+"""+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,pythonDocTest2,pythonSpaceError,@Spell


syn match pythonRawEscape +\\['"]+ display contained

syn match pythonStrFormatting '%\%(([^)]\+)\)\=[-#0 +]*\d*\%(\.\d\+\)\=[hlL]\=[diouxXeEfFgGcrs%]' contained containedin=pythonString,pythonRawString,pythonBytesContent
syn match pythonStrFormatting '%[-#0 +]*\%(\*\|\d\+\)\=\%(\.\%(\*\|\d\+\)\)\=[hlL]\=[diouxXeEfFgGcrs%]' contained containedin=pythonString,pythonRawString,pythonBytesContent


syn match pythonStrFormat "{\%(\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\|\d\+\)\=\%(\.\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\|\[\%(\d\+\|[^!:\}]\+\)\]\)*\%(![rsa]\)\=\%(:\%({\%(\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\|\d\+\)}\|\%([^}]\=[<>=^]\)\=[ +-]\=#\=0\=\d*,\=\%(\.\d\+\)\=[bcdeEfFgGnosxX%]\=\)\=\)\=}" contained containedin=pythonString,pythonRawString
syn region pythonStrInterpRegion matchgroup=pythonStrFormat start="{" end="\%(![rsa]\)\=\%(:\%({\%(\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\|\d\+\)}\|\%([^}]\=[<>=^]\)\=[ +-]\=#\=0\=\d*,\=\%(\.\d\+\)\=[bcdeEfFgGnosxX%]\=\)\=\)\=}" extend contained containedin=pythonFString,pythonRawFString contains=pythonStrInterpRegion,@pythonExpression
syn match pythonStrFormat "{{\|}}" contained containedin=pythonFString,pythonRawFString


syn match pythonStrTemplate '\$\$' contained containedin=pythonString,pythonRawString
syn match pythonStrTemplate '\${[a-zA-Z_][a-zA-Z0-9_]*}' contained containedin=pythonString,pythonRawString
syn match pythonStrTemplate '\$[a-zA-Z_][a-zA-Z0-9_]*' contained containedin=pythonString,pythonRawString

" DocTests
syn region pythonDocTest   start='^\s*>>>' skip=+\\'+ end=+'''+he=s-1 end='^\s*$' contained
syn region pythonDocTest2  start='^\s*>>>' skip=+\\"+ end=+"""+he=s-1 end='^\s*$' contained

" Docstrings
syn match pythonColon ':' nextgroup=pythonDocString skipempty
syn region pythonDocString start=+^\s*'''+ skip=+\\'+ end=+'''+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,pythonDocTest,pythonSpaceError,@Spell
syn region pythonDocString start=+^\s*"""+ skip=+\\"+ end=+"""+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,pythonDocTest2,pythonSpaceError,@Spell
syn region pythonString start=+^\s*'''+ skip=+\\'+ end=+'''+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,pythonDocTest,pythonSpaceError,@Spell
syn region pythonString start=+^\s*"""+ skip=+\\"+ end=+"""+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,pythonDocTest2,pythonSpaceError,@Spell
syn region pythonDocString start=+\%^\s*'''+ skip=+\\'+ end=+'''+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,pythonDocTest,pythonSpaceError,@Spell
syn region pythonDocString start=+\%^\s*"""+ skip=+\\"+ end=+"""+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,pythonDocTest2,pythonSpaceError,@Spell


" Numbers
syn match   pythonOctError    '\<0[oO]\=\o*\D\+\d*\>' display
" pythonHexError comes after pythonOctError so that 0xffffl is pythonHexError
syn match   pythonHexError    '\<0[xX]\x*[g-zG-Z]\x*\>' display
syn match   pythonBinError    '\<0[bB][01]*\D\+\d*\>' display

syn match   pythonHexNumber   '\<0[xX][_0-9a-fA-F]*\x\>' display
syn match   pythonOctNumber   '\<0[oO][_0-7]*\o\>' display
syn match   pythonBinNumber   '\<0[bB][_01]*[01]\>' display

syn match   pythonNumberError '\<\d[_0-9]*\D\>' display
syn match   pythonNumberError '\<0[_0-9]\+\>' display
syn match   pythonNumberError '\<0_x\S*\>' display
syn match   pythonNumberError '\<0[bBxXoO][_0-9a-fA-F]*_\>' display
syn match   pythonNumberError '\<\d[_0-9]*_\>' display
syn match   pythonNumber      '\<\d\>' display
syn match   pythonNumber      '\<[1-9][_0-9]*\d\>' display
syn match   pythonNumber      '\<\d[jJ]\>' display
syn match   pythonNumber      '\<[1-9][_0-9]*\d[jJ]\>' display

syn match   pythonOctError    '\<0[oO]\=\o*[8-9]\d*\>' display
syn match   pythonBinError    '\<0[bB][01]*[2-9]\d*\>' display

syn match   pythonFloat       '\.\d\%([_0-9]*\d\)\=\%([eE][+-]\=\d\%([_0-9]*\d\)\=\)\=[jJ]\=\>' display
syn match   pythonFloat       '\<\d\%([_0-9]*\d\)\=[eE][+-]\=\d\%([_0-9]*\d\)\=[jJ]\=\>' display
syn match   pythonFloat       '\<\d\%([_0-9]*\d\)\=\.\d\=\%([_0-9]*\d\)\=\%([eE][+-]\=\d\%([_0-9]*\d\)\=\)\=[jJ]\=' display



" Builtin objects
syn keyword pythonNone        None
syn keyword pythonBoolean     True False
syn keyword pythonSingleton   Ellipsis NotImplemented
syn keyword pythonBuiltinObj  __debug__ __doc__ __file__ __name__ __package__
syn keyword pythonBuiltinObj  __loader__ __spec__ __path__ __cached__

let s:funcs_re = '__import__|abs|all|any|bin|callable|chr|classmethod|compile|complex|delattr|dir|divmod|enumerate|eval|filter|format|getattr|globals|hasattr|hash|help|hex|id|input|isinstance|issubclass|iter|len|locals|map|max|memoryview|min|next|oct|open|ord|pow|property|range|repr|reversed|round|setattr|slice|sorted|staticmethod|sum|super|type|vars|zip'
let s:funcs_re .= '|ascii|breakpoint|exec|print'
let s:funcs_re = 'syn match pythonBuiltinFunc ''\v\.@<!\zs<%(' . s:funcs_re . ')>'
let s:funcs_re .= '\=@!'
execute s:funcs_re . ''''
unlet s:funcs_re


" Builtin types
syn match pythonBuiltinType    '\v\.@<!<%(object|bool|int|float|tuple|str|list|dict|set|frozenset|bytearray|bytes)>'

" Builtin exceptions and warnings
let s:exs_re = 'BaseException|Exception|ArithmeticError|LookupError|EnvironmentError|AssertionError|AttributeError|BufferError|EOFError|FloatingPointError|GeneratorExit|IOError|ImportError|IndexError|KeyError|KeyboardInterrupt|MemoryError|NameError|NotImplementedError|OSError|OverflowError|ReferenceError|RuntimeError|StopIteration|SyntaxError|IndentationError|TabError|SystemError|SystemExit|TypeError|UnboundLocalError|UnicodeError|UnicodeEncodeError|UnicodeDecodeError|UnicodeTranslateError|ValueError|VMSError|WindowsError|ZeroDivisionError|Warning|UserWarning|BytesWarning|DeprecationWarning|PendingDeprecationWarning|SyntaxWarning|RuntimeWarning|FutureWarning|ImportWarning|UnicodeWarning'
let s:exs_re .= '|BlockingIOError|ChildProcessError|ConnectionError|BrokenPipeError|ConnectionAbortedError|ConnectionRefusedError|ConnectionResetError|FileExistsError|FileNotFoundError|InterruptedError|IsADirectoryError|NotADirectoryError|PermissionError|ProcessLookupError|TimeoutError|StopAsyncIteration|ResourceWarning|ModuleNotFoundError|BaseExceptionGroup|ExceptionGroup|RecursionError|EncodingWarning'
execute 'syn match pythonExClass ''\v\.@<!\zs<%(' . s:exs_re . ')>'''
unlet s:exs_re


" Misc
syn sync minlines=2000
" command -nargs=+ HiLink hi def link <args>

if v:version >= 508 || !exists('did_python_syn_inits')
    if v:version <= 508
        let did_python_syn_inits = 1
        command -nargs=+ HiLink hi link <args>
    else
        command -nargs=+ HiLink hi def link <args>
    endif
    HiLink pythonStatement        Statement
    HiLink pythonRaiseFromStatement   Statement
    HiLink pythonImport           Include
    HiLink pythonFunction         Function
    HiLink pythonFunctionCall     Function
    HiLink pythonConditional      Conditional
    HiLink pythonRepeat           Repeat
    HiLink pythonException        Exception
    HiLink pythonOperator         Operator

    HiLink pythonDecorator        Define
    HiLink pythonDottedName       Function

    HiLink pythonComment          Comment
    HiLink pythonCoding           Special
    HiLink pythonRun              Special
    HiLink pythonTodo             Todo

    HiLink pythonError            Error
    HiLink pythonIndentError      Error
    HiLink pythonSpaceError       Error

    HiLink pythonString           String
    HiLink pythonRawString        String
    HiLink pythonRawEscape        Special

    HiLink pythonUniEscape        Special
    HiLink pythonUniEscapeError   Error

    HiLink pythonBytes              String
    HiLink pythonRawBytes           String
    HiLink pythonBytesContent       String
    HiLink pythonBytesError         Error
    HiLink pythonBytesEscape        Special
    HiLink pythonBytesEscapeError   Error
    HiLink pythonFString            String
    HiLink pythonRawFString         String

    HiLink pythonStrFormatting    Special
    HiLink pythonStrFormat        Special
    HiLink pythonStrTemplate      Special

    HiLink pythonDocString        Comment

    HiLink pythonDocTest          Special
    HiLink pythonDocTest2         Special

    HiLink pythonNumber           Number
    HiLink pythonHexNumber        Number
    HiLink pythonOctNumber        Number
    HiLink pythonBinNumber        Number
    HiLink pythonFloat            Float
    HiLink pythonNumberError      Error
    HiLink pythonOctError         Error
    HiLink pythonHexError         Error
    HiLink pythonBinError         Error

    HiLink pythonBoolean          Boolean
    HiLink pythonNone             Constant
    HiLink pythonSingleton        Constant

    HiLink pythonBuiltinObj       Identifier
    HiLink pythonBuiltinFunc      Function
    HiLink pythonBuiltinType      Structure

    HiLink pythonExClass          Structure
    HiLink pythonClass            Structure
    HiLink pythonClassVar         Identifier

    delcommand HiLink
endif

let b:current_syntax = 'python'
