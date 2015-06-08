" Vim color file
" Creator: Fernando Canizo (aka conan) - http://conan.muriandre.com/
" Creation Date: Fri, 11 Mar 2011 07:11:12 -0300
" gray background for perl programming
" created from scratch using :help group-name :help highlight-groups and :hi <something>

set background=dark
hi clear " reset to default colors
if exists("syntax_on")
	syntax reset
endif

let g:colors_name = "conanperlgray"

" Console
hi Normal ctermfg=White ctermbg=black
hi Search ctermfg=Black ctermbg=Green cterm=NONE
hi Visual ctermfg=Black ctermbg=White

hi Cursor ctermfg=Black ctermbg=Green cterm=bold
hi StatusLine ctermbg=white ctermfg=blue 
" Note: the bolds are there to remove default underlinement, maybe using NONE would serve too
"hi CursorLine term=bold cterm=bold ctermbg=gray ctermfg=black
hi CursorLine term=bold cterm=bold ctermbg=234
"hi CursorLine term=bold cterm=bold

" start with group-name, define only leaders
"hi Comment ctermfg=100 " yellow-brownish
hi Comment ctermfg=250 " gray

"""""""""""""""""""""""""""""""""""""""""""""""""
hi Constant ctermfg=13
"String
"Character
"Number
"Boolean
"Float

"""""""""""""""""""""""""""""""""""""""""""""""""
hi Identifier cterm=bold ctermfg=14
"Function

"""""""""""""""""""""""""""""""""""""""""""""""""
hi Statement ctermfg=11 term=bold
"Conditional
"Repeat
"Label
hi Operator ctermfg=White
"Keyword
"Exception

"""""""""""""""""""""""""""""""""""""""""""""""""
hi Preproc ctermfg=green
"Include
"Define
"Macro
"PreCondit

"""""""""""""""""""""""""""""""""""""""""""""""""
hi Type ctermfg=121
"StorageClass
"Structure
"Typedef

"""""""""""""""""""""""""""""""""""""""""""""""""
hi Special term=bold ctermfg=224
"SpecialChar
"Tag
"Delimiter
"SpecialComment
"Debug

"""""""""""""""""""""""""""""""""""""""""""""""""
hi Underlined term=underline cterm=underline ctermfg=81

"""""""""""""""""""""""""""""""""""""""""""""""""
hi Ignore ctermfg=0

"""""""""""""""""""""""""""""""""""""""""""""""""
hi Error term=reverse ctermfg=15 ctermbg=9

"""""""""""""""""""""""""""""""""""""""""""""""""
hi Todo cterm=bold ctermfg=1 ctermbg=240 "perlTodo links to Todo

" start perl specifics

"String links to Constant
"perlString links to String
"perlStringUnexpanded links to perlString
"perlQQ links to perlString
"perlShellCommand links to perlString
"perlVarSimpleMemberName links to perlString
"perlMatch links to perlString
"perlSubstitutionGQQ links to perlString
"perlSubstitutionSQ links to perlString
"perlTranslationGQ links to perlString
"perlStringStartEnd links to perlString
"perlHereDoc links to perlString
"perlFormatField links to perlString

"perlStringStartEnd links to perlString
"perlVStringV links to perlStringStartEnd

"perlConditional links to Conditional

"perlElseIfError links to Error
"perlSubError links to Error
"perlSubPrototypeError links to Error
"perlNotEmptyLine links to Error

"perlRepeat links to Repeat

"perlOperator links to Operator

"perlControl links to PreProc
"perlSubAttributes links to PreProc
"perlSharpBang links to PreProc

"perlStatement links to Statement
"perlStatementStorage links to perlStatement
"perlStatementControl links to perlStatement
"perlStatementScalar links to perlStatement
"perlStatementRegexp links to perlStatement
"perlStatementNumeric links to perlStatement
"perlStatementList links to perlStatement
"perlStatementHash links to perlStatement
"perlStatementIOfunc links to perlStatement
"perlStatementFiledesc links to perlStatement
"perlStatementVector links to perlStatement
"perlStatementFiles links to perlStatement
"perlStatementFlow links to perlStatement
"perlStatementInclude links to perlStatement
"perlStatementProc links to perlStatement
"perlStatementSocket links to perlStatement
"perlStatementIPC links to perlStatement
"perlStatementNetwork links to perlStatement
"perlStatementPword links to perlStatement
"perlStatementTime links to perlStatement
"perlStatementMisc links to perlStatement
"perlStatementIndirObj links to perlStatement
"perlMatchStartEnd links to perlStatement
"perlStatementPackage links to perlStatement
"perlList links to perlStatement
"perlMisc links to perlStatement
"perlStatement links to Statement

"perlLabel links to Label

"perlVarPlain links to perlIdentifier
"perlVarNotInMatches links to perlIdentifier
"perlVarSlash links to perlIdentifier
"perlPackageRef links to perlType
"perlVarSimpleMember links to perlIdentifier
"perlMethod links to perlIdentifier
"perlVarPlain2 links to perlIdentifier
"perlFunctionName links to perlIdentifier
"perlArrow links to perlIdentifier
"perlFiledescRead links to perlIdentifier
"perlFiledescStatement links to perlIdentifier
"perlFormatName links to perlIdentifier
"perlIdentifier links to Identifier

"perlFloat links to Float

"perlNumber links to Number

"perlSpecial links to Special
"perlSpecialString links to perlSpecial
"perlSpecialStringU links to perlSpecial
"perlSpecialMatch links to perlSpecial
"perlSpecial links to Special
"perlSpecialAscii links to perlSpecial
"perlSpecialDollar links to perlSpecial

"perlType links to Type
"perlSubPrototype links to Type
"perlPackageDecl links to perlType
"perlFunctionPRef links to perlType
"perlStorageClass links to perlType

"perlSubAttributesCont links to perlSubAttributes

"perlSubName links to Function

"perlFunction links to Keyword

"perlInclude links to Include

"perlCharacter links to Character

"perlComment links to Comment
"perlPOD links to perlComment
"perlDATA links to perlComment

" I don't know what 'cleared' means, I guess it's ignored
"perlSync cleared
"perlSyncPOD cleared
"perlGenericBlock cleared
"perlFiledescStatementNocomma cleared
"perlFiledescStatementComma cleared
"perlStatementIndirObjWrap cleared
"perlVarMember cleared
"perlVarBlock cleared
"perlVarBlock2 cleared
"perlPackageConst cleared
"NONE cleared
""perlParensSQ cleared
"perlBracketsSQ cleared
"perlBracesSQ cleared
"perlAnglesSQ cleared
"perlParensDQ cleared
"perlBracketsDQ cleared
"perlBracesDQ cleared
"perlAnglesDQ cleared
"perlSpecialStringU2 cleared
"perlAutoload cleared
"perlFormat cleared
