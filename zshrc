# 
#
# ZSH Resource file

###       ###
### TO DO ###
###       ###

# 1) - Clean up zstyle section.
# 2) - Check .programs for installed software such as PAGER, EDITOR,
# Metasploit, etc.

###           ###
### FUNCTIONS ###
###           ###

#--------------------------------------------------------------------------
#
# 9.1 - Autoloading Functions: 
#
#    A function can be marked as undefined using the autoload builtin 
#    (or ‘functions -u’ or ‘typeset -fu’). Such a function has no body. 
#    When the function is first executed, the shell searches for its 
#    definition using the elements of the fpath variable. Thus to define 
#    functions for autoloading, a typical sequence is:
#
#        fpath=(~/myfuncs $fpath)
#        autoload myfunc1 myfunc2 ...
#
#    The usual alias expansion during reading will be suppressed if the 
#    autoload builtin or its equivalent is given the option -U. This is 
#    recommended for the use of functions supplied with the zsh distribution.
#
# Enable the Tab Completion System
autoload -U	compinit
compinit
#
# Load vcs_info for vcs (git, mercurial, bazaar, svn, and cvs) support.
autoload -Uz vcs_info
#
# Set any additional predefined functions here 
#
# Search function for the ZSH 'all' manual.
zman() {
    PAGER="less -g -s '+/^       "$1"'" man zshall
}

# Suspend/Resume vim with Ctrl-Z 
# Note: This accompanies 'ZSH LINE EDITOR' and 'BIND KEY' options.
foreground-vim() {
    fg %vim
}
#
#--------------------------------------------------------------------------

###             ###
### SET OPTIONS ###
###             ###

#--------------------------------------------------------------------------
#
# 16.2 - Description of Options
#
#    In the following list, options set by default in all emulations are 
#    marked <D>; those set by default only in csh, ksh, sh, or zsh 
#    emulations are marked <C>, <K>, <S>, <Z> as appropriate. When listing 
#    options (by ‘setopt’, ‘unsetopt’, ‘set -o’ or ‘set +o’), those turned 
#    on by default appear in the list prefixed with ‘no’. Hence (unless 
#    KSH_OPTION_PRINT is set), ‘setopt’ shows all options whose settings 
#    are changed from the default.
#
#    See section 16.2 of the ZSH Documentation
#
# Check if ZSH supports options or not. 
# This may not be needed.
if [[ $ZSH_VERSION > 3.0.6 ]]; then
#--------------------------------------------------------------------------
#
# 16.2.1 - Changing Directories ###    
#
setopt AUTO_CD 
#
#    If a command is issued that can’t be executed as a normal command,
#    and the command is the name of a directory, perform the cd command 
#    to that directory. This option is only applicable if the option
#    SHIN_STDIN is set, i.e. if commands are being read from standard 
#    input. The option is designed for interactive use; it is recommended 
#    that cd be used explicitly in scripts to avoid ambiguity. 
#
setopt AUTO_PUSHD
#
#    Make cd push the old directory onto the directory stack.
#
#setopt CHASE_DOTS    
#
#    When changing to a directory containing a path segment ‘..’ which 
#    would otherwise be treated as canceling the previous segment in the 
#    path (in other words, ‘foo/..’ would be removed from the path, or if 
#    ‘..’ is the first part of the path, the last part of the current 
#    working directory would be removed), instead resolve the path to the 
#    physical directory. This option is overridden by CHASE_LINKS.
#
#    For example, suppose /foo/bar is a link to the directory /alt/rod. 
#    Without this option set, ‘cd /foo/bar/..’ changes to /foo; with it set,
#    it changes to /alt. The same applies if the current directory is 
#    /foo/bar and ‘cd ..’ is used. Note that all other symbolic links in 
#    the path will also be resolved.
#
#setopt CHASE_LINKS
#
#    Resolve symbolic links to their true values when changing directory. 
#    This also has the effect of CHASE_DOTS, i.e. a ‘..’ path segment will 
#    be treated as referring to the physical parent, even if the preceding 
#    path segment is a symbolic link.
#
#setopt POSIX_CD
#
#    Modifies the behaviour of cd, chdir and pushd commands to make them 
#    more compatible with the POSIX standard. The behaviour with the option 
#    unset is described in the documentation for the cd builtin in Shell 
#    Builtin Commands. If the option is set, the shell does not test for 
#    directories beneath the local directory (‘.’) until after all 
#    directories in cdpath have been tested.
#
#    Also, if the option is set, the conditions under which the shell prints 
#    the new directory after changing to it are modified. It is no longer 
#    restricted to interactive shells (although printing of the directory 
#    stack with pushd is still limited to interactive shells); and any use 
#    of a component of CDPATH, including a ‘.’ but excluding an empty 
#    component that is otherwise treated as ‘.’, causes the directory to be 
#    printed. 
#
setopt PUSHD_IGNORE_DUPS
#
#    Don’t push multiple copies of the same directory onto the directory 
#    stack.
#
setopt PUSHD_MINUS
#
#    Exchanges the meanings of ‘+’ and ‘-’ when used with a number to 
#    specify a directory in the stack.
#
setopt PUSHD_SILENT
#
#    Do not print the directory stack after pushd or popd.
#   
setopt PUSHD_TO_HOME
#
#    Have pushd with no arguments act like ‘pushd $HOME’.
#
#--------------------------------------------------------------------------
#
# 16.2.2 - Completion
#
#setopt ALWAYS_LAST_PROMPT 
#
#    If unset, key functions that list completions try to return to the 
#    last prompt if given a numeric argument. If set these functions try 
#    to return to the last prompt if given no numeric argument.
#    
#setopt ALWAYS_TO_END
#
#    If a completion is performed with the cursor within a word, and a 
#    full completion is inserted, the cursor is moved to the end of the 
#    word. That is, the cursor is moved to the end of the word if either 
#    a single match is inserted or menu completion is performed.
#
#setopt AUTO_LIST
#
#    Automatically list choices on an ambiguous completion.
#
#setopt AUTO_MENU
#
#    Automatically use menu completion after the second consecutive 
#    request for completion, for example by pressing the tab key 
#    repeatedly. This option is overridden by MENU_COMPLETE.
#
#setopt AUTO_NAME_DIRS
#
#    Any parameter that is set to the absolute name of a directory 
#    immediately becomes a name for that directory, that will be used by 
#    the ‘%~’ and related prompt sequences, and will be available when 
#    completion is performed on a word starting with ‘~’. (Otherwise, 
#    the parameter must be used in the form ‘~param’ first.)
#
#setopt AUTO_PARAM_KEYS
#
#    If a parameter name was completed and a following character (normally 
#    a space) automatically inserted, and the next character typed is one 
#    of those that have to come directly after the name (like ‘}’, ‘:’, 
#    etc.), the automatically added character is deleted, so that the 
#    character typed comes immediately after the parameter name. 
#    Completion in a brace expansion is affected similarly: the added 
#    character is a ‘,’, which will be removed if ‘}’ is typed next.
#
#setopt AUTO_PARAM_SLASH 
#
#    If a parameter is completed whose content is the name of a directory, 
#    then add a trailing slash instead of a space.
#
#setopt AUTO_REMOVE_SLASH 
#
#    When the last character resulting from a completion is a slash and 
#    the next character typed is a word delimiter, a slash, or a character 
#    that ends a command (such as a semicolon or an ampersand), remove the 
#    slash.
#
#setopt BASH_AUTO_LIST
#
#    On an ambiguous completion, automatically list choices when the 
#    completion function is called twice in succession. This takes 
#    precedence over AUTO_LIST. The setting of LIST_AMBIGUOUS is respected.
#    If AUTO_MENU is set, the menu behaviour will then start with the 
#    third press. Note that this will not work with MENU_COMPLETE, since 
#    repeated completion calls immediately cycle through the list in that 
#    case.
#
#setopt COMPLETE_ALIASES
#
#    Prevents aliases on the command line from being internally 
#    substituted before completion is attempted. The effect is to make the 
#    alias a distinct command for completion purposes.
#
#setopt COMPLETE_IN_WORD
#
#    If unset, the cursor is set to the end of the word if completion is 
#    started. Otherwise it stays there and completion is done from both 
#    ends.
#
#setopt GLOB_COMPLETE
#
#    When the current word has a glob pattern, do not insert all the words 
#    resulting from the expansion but generate matches as for completion 
#    and cycle through them like MENU_COMPLETE. The matches are generated 
#    as if a ‘*’ was added to the end of the word, or inserted at the 
#    cursor when COMPLETE_IN_WORD is set. This actually uses pattern 
#    matching, not globbing, so it works not only for files but for any 
#    completion, such as options, user names, etc.
#
#    Note that when the pattern matcher is used, matching control (for 
#    example, case-insensitive or anchored matching) cannot be used. This 
#    limitation only applies when the current word contains a pattern; 
#    simply turning on the GLOB_COMPLETE option does not have this effect.
#
#setopt HASH_LIST_ALL
#
#    Whenever a command completion or spelling correction is attempted, 
#    make sure the entire command path is hashed first. This makes the 
#    first completion slower but avoids false reports of spelling errors.
#
#setopt LIST_AMBIGUOUS 
#
#    This option works when AUTO_LIST or BASH_AUTO_LIST is also set. If 
#    there is an unambiguous prefix to insert on the command line, that 
#    is done without a completion list being displayed; in other words, 
#    auto-listing behaviour only takes place when nothing would be 
#    inserted. In the case of BASH_AUTO_LIST, this means that the list 
#    will be delayed to the third call of the function.
#
#setopt LIST_BEEP
#
#    Beep on an ambiguous completion. More accurately, this forces the 
#    completion widgets to return status 1 on an ambiguous completion, 
#    which causes the shell to beep if the option BEEP is also set; this 
#    may be modified if completion is called from a user-defined widget.
#
setopt LIST_PACKED
#
#    Try to make the completion list smaller (occupying less lines) by 
#    printing the matches in columns with different widths.
#
#setopt LIST_ROWS_FIRST
#
#    Lay out the matches in completion lists sorted horizontally, that is, 
#    the second match is to the right of the first one, not under it as 
#    usual.
#
#setopt LIST_TYPES
#
#    When listing files that are possible completions, show the type of 
#    each file with a trailing identifying mark.
#
#setopt MENU_COMPLETE
#
#    On an ambiguous completion, instead of listing possibilities or 
#    beeping, insert the first match immediately. Then when completion is 
#    requested again, remove the first match and insert the second match, 
#    etc. When there are no more matches, go back to the first one again. 
#    reverse-menu-complete may be used to loop through the list in the 
#    other direction. This option overrides AUTO_MENU.
#
#setopt REC_EXACT 
#
#    In completion, recognize exact matches even if they are ambiguous.
#
#--------------------------------------------------------------------------
#
# 16.2.3 - Expansion and Globbing
#
#setopt BAD_PATTERN 
#
#    If a pattern for filename generation is badly formed, print an error 
#    message. (If this option is unset, the pattern will be left unchanged.)
#
#setopt BARE_GLOB_QUAL
#    
#    In a glob pattern, treat a trailing set of parentheses as a qualifier 
#    list, if it contains no ‘|’, ‘(’ or (if special) ‘~’ characters. See 
#    Filename Generation.
#
#setopt BRACE_CCL
#
#    Expand expressions in braces which would not otherwise undergo brace 
#    expansion to a lexically ordered list of all the characters. 
#    See Brace Expansion.
#
#setopt CASE_GLOB
#    
#    Make globbing (filename generation) sensitive to case. Note that other 
#    uses of patterns are always sensitive to case. If the option is unset, 
#    the presence of any character which is special to filename generation 
#    will cause case-insensitive matching. For example, cvs(/) can match 
#    the directory CVS owing to the presence of the globbing flag (unless 
#    the option BARE_GLOB_QUAL is unset).
# 
#setopt CASE_MATCH
#    
#    Make regular expressions using the zsh/regex module (including 
#    matches with =~) sensitive to case.
#
#setopt CSH_NULL_GLOB 
#    
#    If a pattern for filename generation has no matches, delete the 
#    pattern from the argument list; do not report an error unless all the 
#    patterns in a command have no matches. Overrides NOMATCH.
#
#setopt EQUALS 
#    
#    Perform = filename expansion. (See Filename Expansion.)
#
setopt EXTENDED_GLOB
#
#    Treat the ‘#’, ‘~’ and ‘^’ characters as part of patterns for 
#    filename generation, etc. (An initial unquoted ‘~’ always produces 
#    named directory expansion.)
#
#setopt FORCE_FLOAT
#    
#    Constants in arithmetic evaluation will be treated as floating point 
#    even without the use of a decimal point; the values of integer 
#    variables will be converted to floating point when used in arithmetic 
#    expressions. Integers in any base will be converted.
#
#setopt GLOB (+F, ksh: +f) <D>
#    
#    Perform filename generation (globbing). (See Filename Generation.)
#
#setopt GLOB_ASSIGN <C>
#    
#    If this option is set, filename generation (globbing) is performed on 
#    the right hand side of scalar parameter assignments of the form 
#    ‘name=pattern (e.g. ‘foo=*’). If the result has more than one word 
#    the parameter will become an array with those words as arguments. 
#    This option is provided for backwards compatibility only: globbing is 
#    always performed on the right hand side of array assignments of the 
#    form ‘name=(value)’ (e.g. ‘foo=(*)’) and this form is recommended for 
#    clarity; with this option set, it is not possible to predict whether 
#    the result will be an array or a scalar.
#
setopt GLOB_DOTS
#    
#    Do not require a leading ‘.’ in a filename to be matched explicitly.
#
#setopt GLOB_STAR_SHORT
#    
#    When this option is set and the default zsh-style globbing is in 
#    effect, the pattern ‘**/*’ can be abbreviated to ‘**’ and the pattern 
#    ‘***/*’ can be abbreviated to ***. Hence ‘**.c’ finds a file ending 
#    in .c in any subdirectory, and ‘***.c’ does the same while also 
#    following symbolic links. A / immediately after the ‘**’ or ‘***’ 
#    forces the pattern to be treated as the unabbreviated form.
#
#setopt GLOB_SUBST <C> <K> <S>
#    
#    Treat any characters resulting from parameter expansion as being 
#    eligible for filename expansion and filename generation, and any 
#    characters resulting from command substitution as being eligible 
#    for filename generation. Braces (and commas in between) do not 
#    become eligible for expansion.
#
#setopt HIST_SUBST_PATTERN
#    
#    Substitutions using the :s and :& history modifiers are performed 
#    with pattern matching instead of string matching. This occurs 
#    wherever history modifiers are valid, including glob qualifiers and 
#    parameters. See Modifiers.
#
#setopt IGNORE_BRACES (-I) <S>
#    
#    Do not perform brace expansion. For historical reasons this also 
#    includes the effect of the IGNORE_CLOSE_BRACES option.
#
#setopt IGNORE_CLOSE_BRACES
#    
#    When neither this option nor IGNORE_BRACES is set, a sole close brace 
#    character ‘}’ is syntactically significant at any point on a command 
#    line. This has the effect that no semicolon or newline is necessary 
#    before the brace terminating a function or current shell construct. 
#    When either option is set, a closing brace is syntactically 
#    significant only in command position. Unlike IGNORE_BRACES, this 
#    option does not disable brace expansion.
#
#    For example, with both options unset a function may be defined in the 
#    following fashion:
#
#        args() { echo $# }
#
#    while if either option is set, this does not work and something 
#    equivalent to the following is required:
#
#        args() { echo $#; }
#
#setopt KSH_GLOB
#
#    In pattern matching, the interpretation of parentheses is affected by 
#    a preceding ‘@’, ‘*’, ‘+’, ‘?’ or ‘!’. See Filename Generation.
#
#setopt MAGIC_EQUAL_SUBST
#    
#    All unquoted arguments of the form ‘anything=expression’ appearing 
#    after the command name have filename expansion (that is, where 
#    expression has a leading ‘~’ or ‘=’) performed on expression as if it 
#    were a parameter assignment. The argument is not otherwise treated 
#    specially; it is passed to the command as a single argument, and not 
#    used as an actual parameter assignment. For example, in 
#    echo foo=~/bar:~/rod, both occurrences of ~ would be replaced. Note 
#    that this happens anyway with typeset and similar statements.
#
#    This option respects the setting of the KSH_TYPESET option. In other 
#    words, if both options are in effect, arguments looking like 
#    assignments will not undergo word splitting.
#
#setopt MARK_DIRS (-8, ksh: -X)
#    
#    Append a trailing ‘/’ to all directory names resulting from filename 
#    generation (globbing).
#
#setopt MULTIBYTE
#    
#    Respect multibyte characters when found in strings. When this option 
#    is set, strings are examined using the system library to determine 
#    how many bytes form a character, depending on the current locale. This 
#    affects the way characters are counted in pattern matching, parameter 
#    values and various delimiters.
#
#    The option is on by default if the shell was compiled with 
#    MULTIBYTE_SUPPORT; otherwise it is off by default and has no effect 
#    if turned on.
#
#    If the option is off a single byte is always treated as a single 
#    character. This setting is designed purely for examining strings known 
#    to contain raw bytes or other values that may not be characters in the 
#    current locale. It is not necessary to unset the option merely because 
#    the character set for the current locale does not contain multibyte 
#    characters.
#
#    The option does not affect the shell’s editor, which always uses the 
#    locale to determine multibyte characters. This is because the 
#    character set displayed by the terminal emulator is independent of 
#    shell settings.
#
#setopt NOMATCH (+3) <C> <Z>
#    
#    If a pattern for filename generation has no matches, print an error, 
#    instead of leaving it unchanged in the argument list. This also 
#    applies to file expansion of an initial ‘~’ or ‘=’.
#
#setopt NULL_GLOB (-G)
#    
#    If a pattern for filename generation has no matches, delete the 
#    pattern from the argument list instead of reporting an error. 
#    Overrides NOMATCH.
#
#setopt NUMERIC_GLOB_SORT
#    
#    If numeric filenames are matched by a filename generation pattern, 
#    sort the filenames numerically rather than lexicographically.
#
#setopt RC_EXPAND_PARAM (-P)
#    
#    Array expansions of the form ‘foo${xx}bar’, where the parameter xx is 
#    set to (a b c), are substituted with ‘fooabar foobbar foocbar’ instead 
#    of the default ‘fooa b cbar’. Note that an empty array will therefore 
#    cause all arguments to be removed.
#
#setopt REMATCH_PCRE <Z>
#    
#    If set, regular expression matching with the =~ operator will use 
#    Perl-Compatible Regular Expressions from the PCRE library, if 
#    available. If not set, regular expressions will use the extended 
#    regexp syntax provided by the system libraries.
#
#setopt SH_GLOB <K> <S>
#    
#    Disables the special meaning of ‘(’, ‘|’, ‘)’ and ’<’ for globbing the 
#    result of parameter and command substitutions, and in some other 
#    places where the shell accepts patterns. If SH_GLOB is set but 
#    KSH_GLOB is not, the shell allows the interpretation of subshell 
#    expressions enclosed in parentheses in some cases where there is no 
#    space before the opening parenthesis, e.g. !(true) is interpreted as 
#    if there were a space after the !. This option is set by default if 
#    zsh is invoked as sh or ksh.
#
#setopt UNSET (+u, ksh: +u) <K> <S> <Z>
#    Treat unset parameters as if they were empty when substituting. 
#    Otherwise they are treated as an error.
#
#setopt WARN_CREATE_GLOBAL
#
#    Print a warning message when a global parameter is created in a 
#    function by an assignment or in math context. This often indicates 
#    that a parameter has not been declared local when it should have been. 
#    Parameters explicitly declared global from within a function using 
#    typeset -g do not cause a warning. Note that there is no warning when 
#    a local parameter is assigned to in a nested function, which may also 
#    indicate an error.
#
#--------------------------------------------------------------------------
#
# 16.2.4 - History
#
#setopt APPEND_HISTORY <D>
#    
#    If this is set, zsh sessions will append their history list to the 
#    history file, rather than replace it. Thus, multiple parallel zsh 
#    sessions will all have the new entries from their history lists added 
#    to the history file, in the order that they exit. The file will still 
#    be periodically re-written to trim it when the number of lines grows 
#    20% beyond the value specified by $SAVEHIST (see also the 
#    HIST_SAVE_BY_COPY option).
#
#setopt BANG_HIST (+K) <C> <Z>
#    
#    Perform textual history expansion, csh-style, treating the character 
#    ‘!’ specially.
#
#setopt EXTENDED_HISTORY <C>
#    
#    Save each command’s beginning timestamp (in seconds since the epoch) 
#    and the duration (in seconds) to the history file. The format of this 
#    prefixed data is:
#
#        ‘: <beginning time>:<elapsed seconds>;<command>’.
#
#setopt HIST_ALLOW_CLOBBER
#    
#    Add ‘|’ to output redirections in the history. This allows history 
#    references to clobber files even when CLOBBER is unset.
#
#setopt HIST_BEEP <D>
#    
#    Beep in ZLE when a widget attempts to access a history entry which 
#    isn’t there.
#
#setopt HIST_EXPIRE_DUPS_FIRST
#    
#    If the internal history needs to be trimmed to add the current 
#    command line, setting this option will cause the oldest history event 
#    that has a duplicate to be lost before losing a unique event from the 
#    list. You should be sure to set the value of HISTSIZE to a larger 
#    number than SAVEHIST in order to give you some room for the 
#    duplicated events, otherwise this option will behave just like 
#    HIST_IGNORE_ALL_DUPS once the history fills up with unique events.
#
#setopt HIST_FCNTL_LOCK
#    
#    When writing out the history file, by default zsh uses ad-hoc file 
#    locking to avoid known problems with locking on some operating 
#    systems. With this option locking is done by means of the system’s 
#    fcntl call, where this method is available. On recent operating 
#    systems this may provide better performance, in particular avoiding 
#    history corruption when files are stored on NFS.
#
#setopt HIST_FIND_NO_DUPS
#    
#    When searching for history entries in the line editor, do not display 
#    duplicates of a line previously found, even if the duplicates are not 
#    contiguous.
#
#setopt HIST_IGNORE_ALL_DUPS
#    
#    If a new command line being added to the history list duplicates an 
#    older one, the older command is removed from the list (even if it is 
#    not the previous event).
#
#setopt HIST_IGNORE_DUPS (-h)
#    
#    Do not enter command lines into the history list if they are 
#    duplicates of the previous event.
#
#setopt HIST_IGNORE_SPACE (-g)
#    
#    Remove command lines from the history list when the first character 
#    on the line is a space, or when one of the expanded aliases contains 
#    a leading space. Only normal aliases (not global or suffix aliases) 
#    have this behaviour. Note that the command lingers in the internal 
#    history until the next command is entered before it vanishes, allowing 
#    you to briefly reuse or edit the line. If you want to make it vanish 
#    right away without entering another command, type a space and press 
#    return.
#
#setopt HIST_LEX_WORDS
#    
#    By default, shell history that is read in from files is split into 
#    words on all white space. This means that arguments with quoted 
#    whitespace are not correctly handled, with the consequence that 
#    references to words in history lines that have been read from a file 
#    may be inaccurate. When this option is set, words read in from a 
#    history file are divided up in a similar fashion to normal shell 
#    command line handling. Although this produces more accurately 
#    delimited words, if the size of the history file is large this can be 
#    slow. Trial and error is necessary to decide.
#
#setopt HIST_NO_FUNCTIONS
#    
#    Remove function definitions from the history list. Note that the 
#    function lingers in the internal history until the next command is 
#    entered before it vanishes, allowing you to briefly reuse or edit the 
#    definition.
#
#setopt HIST_NO_STORE
#    
#    Remove the history (fc -l) command from the history list when invoked. 
#    Note that the command lingers in the internal history until the next 
#    command is entered before it vanishes, allowing you to briefly reuse 
#    or edit the line.
#
#setopt HIST_REDUCE_BLANKS
#    
#    Remove superfluous blanks from each command line being added to the 
#    history list.
#
#setopt HIST_SAVE_BY_COPY <D>
#    
#    When the history file is re-written, we normally write out a copy of 
#    the file named $HISTFILE.new and then rename it over the old one. 
#    However, if this option is unset, we instead truncate the old history 
#    file and write out the new version in-place. If one of the 
#    history-appending options is enabled, this option only has an effect 
#    when the enlarged history file needs to be re-written to trim it down 
#    to size. Disable this only if you have special needs, as doing so 
#    makes it possible to lose history entries if zsh gets interrupted 
#    during the save.
#
#    When writing out a copy of the history file, zsh preserves the old 
#    file’s permissions and group information, but will refuse to write 
#    out a new file if it would change the history file’s owner.
#
setopt HIST_SAVE_NO_DUPS
#    
#    When writing out the history file, older commands that duplicate 
#    newer ones are omitted.
#
#setopt HIST_VERIFY
#    
#    Whenever the user enters a line with history expansion, don’t execute 
#    the line directly; instead, perform history expansion and reload the 
#    line into the editing buffer.
#
setopt INC_APPEND_HISTORY
#    
#    This options works like APPEND_HISTORY except that new history lines 
#    are added to the $HISTFILE incrementally (as soon as they are 
#    entered), rather than waiting until the shell exits. The file will 
#    still be periodically re-written to trim it when the number of lines 
#    grows 20% beyond the value specified by $SAVEHIST (see also the 
#    HIST_SAVE_BY_COPY option).
#
#setopt INC_APPEND_HISTORY_TIME
#    
#    This option is a variant of INC_APPEND_HISTORY in which, where 
#    possible, the history entry is written out to the file after the 
#    command is finished, so that the time taken by the command is 
#    recorded correctly in the history file in EXTENDED_HISTORY format. 
#    This means that the history entry will not be available immediately 
#    from other instances of the shell that are using the same history file.
#
#    This option is only useful if INC_APPEND_HISTORY and SHARE_HISTORY are 
#    turned off. The three options should be considered mutually exclusive.
#
#setopt SHARE_HISTORY <K>
#    
#    This option both imports new commands from the history file, and also 
#    causes your typed commands to be appended to the history file (the 
#    latter is like specifying INC_APPEND_HISTORY, which should be turned 
#    off if this option is in effect). The history lines are also output 
#    with timestamps ala EXTENDED_HISTORY (which makes it easier to find 
#    the spot where we left off reading the file after it gets re-written).
#
#    By default, history movement commands visit the imported lines as well 
#    as the local lines, but you can toggle this on and off with the 
#    set-local-history zle binding. It is also possible to create a zle 
#    widget that will make some commands ignore imported commands, and 
#    some include them.
#
#    If you find that you want more control over when commands get 
#    imported, you may wish to turn SHARE_HISTORY off, INC_APPEND_HISTORY 
#    or INC_APPEND_HISTORY_TIME (see above) on, and then manually import 
#    commands whenever you need them using ‘fc -RI’.
#
#--------------------------------------------------------------------------
#
# 16.2.5 - Initialisation
#
#setopt ALL_EXPORT (-a, ksh: -a)
#    
#    All parameters subsequently defined are automatically exported.
#
#setopt GLOBAL_EXPORT <Z>
#    
#    If this option is set, passing the -x flag to the builtins declare, 
#    float, integer, readonly and typeset (but not local) will also set the 
#    -g flag; hence parameters exported to the environment will not be made 
#    local to the enclosing function, unless they were already or the flag 
#    +g is given explicitly. If the option is unset, exported parameters 
#    will be made local in just the same way as any other parameter.
#
#    This option is set by default for backward compatibility; it is not 
#    recommended that its behaviour be relied upon. Note that the builtin 
#    export always sets both the -x and -g flags, and hence its effect 
#    extends beyond the scope of the enclosing function; this is the most 
#    portable way to achieve this behaviour.
#
#setopt GLOBAL_RCS (-d) <D>
#    
#    If this option is unset, the startup files /etc/zprofile, /etc/zshrc, 
#    /etc/zlogin and /etc/zlogout will not be run. It can be disabled and 
#    re-enabled at any time, including inside local startup files (.zshrc, 
#    etc.).
#
#setopt RCS (+f) <D>
#    
#    After /etc/zshenv is sourced on startup, source the .zshenv, 
#    /etc/zprofile, .zprofile, /etc/zshrc, .zshrc, /etc/zlogin, .zlogin, 
#    and .zlogout files, as described in Files. If this option is unset, 
#    the /etc/zshenv file is still sourced, but any of the others will not 
#    be; it can be set at any time to prevent the remaining startup files 
#    after the currently executing one from being sourced.
#
#--------------------------------------------------------------------------
#
# 16.2.6 - Input/Output
#
#setopt ALIASES <D>
#    
#    Expand aliases.
#
#
setopt NO_CLOBBER
#setopt CLOBBER (+C, ksh: +C) <D>
#    
#    Allows ‘>’ redirection to truncate existing files. Otherwise ‘>!’ or 
#    ‘>|’ must be used to truncate a file.
#
#    If the option is not set, and the option APPEND_CREATE is also not 
#    set, ‘>>!’ or ‘>>|’ must be used to create a file. If either option 
#    is set, ‘>>’ may be used.
#
setopt CORRECT
#
#    Try to correct the spelling of commands. Note that, when the 
#    HASH_LIST_ALL option is not set or when some directories in the path 
#    are not readable, this may falsely report spelling errors the first 
#    time some commands are used.
#
#    The shell variable CORRECT_IGNORE may be set to a pattern to match 
#    words that will never be offered as corrections.
#
setopt CORRECT_ALL
#    
#    Try to correct the spelling of all arguments in a line.
#
#    The shell variable CORRECT_IGNORE_FILE may be set to a pattern to 
#    match file names that will never be offered as corrections.
#
#setopt DVORAK
#    
#    Use the Dvorak keyboard instead of the standard qwerty keyboard as a 
#    basis for examining spelling mistakes for the CORRECT and CORRECT_ALL 
#    options and the spell-word editor command.
#
#setopt FLOW_CONTROL <D>
#    
#    If this option is unset, output flow control via start/stop characters 
#    (usually assigned to ^S/^Q) is disabled in the shell’s editor.
#
#setopt IGNORE_EOF (-7)
#    
#    Do not exit on end-of-file. Require the use of exit or logout instead. 
#    However, ten consecutive EOFs will cause the shell to exit anyway, to 
#    avoid the shell hanging if its tty goes away.
#
#    Also, if this option is set and the Zsh Line Editor is used, widgets 
#    implemented by shell functions can be bound to EOF (normally 
#    Control-D) without printing the normal warning message. This works 
#    only for normal widgets, not for completion widgets.
#
#setopt INTERACTIVE_COMMENTS (-k) <K> <S>
#    
#    Allow comments even in interactive shells.
#
#setopt HASH_CMDS <D>
#    
#    Note the location of each command the first time it is executed. 
#    Subsequent invocations of the same command will use the saved location, 
#    avoiding a path search. If this option is unset, no path hashing is 
#    done at all. However, when CORRECT is set, commands whose names do 
#    not appear in the functions or aliases hash tables are hashed in 
#    order to avoid reporting them as spelling errors.
#
#setopt HASH_DIRS <D>
#
#    Whenever a command name is hashed, hash the directory containing it, 
#    as well as all directories that occur earlier in the path. Has no 
#    effect if neither HASH_CMDS nor CORRECT is set.
#
#setopt HASH_EXECUTABLES_ONLY
#    
#    When hashing commands because of HASH_CMDS, check that the file to 
#    be hashed is actually an executable. This option is unset by default 
#    as if the path contains a large number of commands, or consists of 
#    many remote files, the additional tests can take a long time. Trial 
#    and error is needed to show if this option is beneficial.
#
#setopt MAIL_WARNING (-U)
#    
#    Print a warning message if a mail file has been accessed since the 
#    shell last checked.
#
#setopt PATH_DIRS (-Q)
#    
#    Perform a path search even on command names with slashes in them. 
#    Thus if ‘/usr/local/bin’ is in the user’s path, and he or she types 
#    ‘X11/xinit’, the command ‘/usr/local/bin/X11/xinit’ will be executed 
#    (assuming it exists). Commands explicitly beginning with ‘/’, ‘./’ 
#    or ‘../’ are not subject to the path search. This also applies to 
#    the ‘.’ and source builtins.
#
#    Note that subdirectories of the current directory are always searched 
#    for executables specified in this form. This takes place before any 
#    search indicated by this option, and regardless of whether ‘.’ or 
#    the current directory appear in the command search path.
#
#setopt PATH_SCRIPT <K> <S>
#    
#    If this option is not set, a script passed as the first non-option 
#    argument to the shell must contain the name of the file to open. If 
#    this option is set, and the script does not specify a directory path,
#    the script is looked for first in the current directory, then in the 
#    command path. See Invocation.
#
#setopt PRINT_EIGHT_BIT
#    
#    Print eight bit characters literally in completion lists, etc. This 
#    option is not necessary if your system correctly returns the 
#    printability of eight bit characters (see man page ctype(3)).
#
#setopt PRINT_EXIT_VALUE (-1)
#    
#    Print the exit value of programs with non-zero exit status. This is 
#    only available at the command line in interactive shells.
#
#setopt RC_QUOTES
#    
#    Allow the character sequence ‘''’ to signify a single quote within 
#    singly quoted strings. Note this does not apply in quoted strings 
#    using the format $'...', where a backslashed single quote can be used.
#
#setopt RM_STAR_SILENT (-H) <K> <S>
#    
#    Do not query the user before executing ‘rm *’ or ‘rm path/*’.
#
#setopt RM_STAR_WAIT
#    
#    If querying the user before executing ‘rm *’ or ‘rm path/*’, first 
#    wait ten seconds and ignore anything typed in that time. This avoids 
#    the problem of reflexively answering ‘yes’ to the query when one 
#    didn’t really mean it. The wait and query can always be avoided by 
#    expanding the ‘*’ in ZLE (with tab).
#
#setopt SHORT_LOOPS <C> <Z>
#    
#    Allow the short forms of for, repeat, select, if, and function 
#    constructs.
#
#setopt SUN_KEYBOARD_HACK (-L)
#    
#    If a line ends with a backquote, and there are an odd number of 
#    backquotes on the line, ignore the trailing backquote. This is 
#    useful on some keyboards where the return key is too small, and the 
#    backquote key lies annoyingly close to it. As an alternative the 
#    variable KEYBOARD_HACK lets you choose the character to be removed.
#
#--------------------------------------------------------------------------
#
# 16.2.7 - Job Control
#
#setopt AUTO_CONTINUE
#    
#    With this option set, stopped jobs that are removed from the job 
#    table with the disown builtin command are automatically sent a CONT 
#    signal to make them running.
#
#setopt AUTO_RESUME (-W)
#    
#    Treat single word simple commands without redirection as candidates 
#    for resumption of an existing job.
#
#setopt BG_NICE (-6) <C> <Z>
#    
#    Run all background jobs at a lower priority. This option is set by 
#    default.
#
#setopt CHECK_JOBS <Z>
#    
#    Report the status of background and suspended jobs before exiting a 
#    shell with job control; a second attempt to exit the shell will 
#    succeed. NO_CHECK_JOBS is best used only in combination with NO_HUP, 
#    else such jobs will be killed automatically.
#
#    The check is omitted if the commands run from the previous command 
#    line included a ‘jobs’ command, since it is assumed the user is 
#    aware that there are background or suspended jobs. A ‘jobs’ command 
#    run from one of the hook functions defined in the section Special 
#    Functions in Functions is not counted for this purpose.
#
#setopt HUP <Z>
#    
#    Send the HUP signal to running jobs when the shell exits.
#
#setopt LONG_LIST_JOBS (-R)
#    
#    List jobs in the long format by default.
#
#setopt MONITOR (-m, ksh: -m)
#    
#    Allow job control. Set by default in interactive shells.
#
#setopt NOTIFY (-5, ksh: -b) <Z>
#    
#    Report the status of background jobs immediately, rather than waiting 
#    until just before printing a prompt.
#
#setopt POSIX_JOBS <K> <S>
#    
#    This option makes job control more compliant with the POSIX standard.
#
#    When the option is not set, the MONITOR option is unset on entry to 
#    subshells, so that job control is no longer active. When the option 
#    is set, the MONITOR option and job control remain active in the 
#    subshell, but note that the subshell has no access to jobs in the 
#    parent shell.
#
#    When the option is not set, jobs put in the background or foreground 
#    with bg or fg are displayed with the same information that would be 
#    reported by jobs. When the option is set, only the text is printed. 
#    The output from jobs itself is not affected by the option.
#
#    When the option is not set, job information from the parent shell is 
#    saved for output within a subshell (for example, within a pipeline). 
#    When the option is set, the output of jobs is empty until a job is 
#    started within the subshell.
#
#    In previous versions of the shell, it was necessary to enable 
#    POSIX_JOBS in order for the builtin command wait to return the 
#    status of background jobs that had already exited. This is no longer 
#    the case.
#
#--------------------------------------------------------------------------
#
# 16.2.8 - Prompting
#
#setopt PROMPT_BANG
#    
#    If set, ‘!’ is treated specially in prompt expansion. See Prompt 
#    Expansion.
#
#setopt PROMPT_CR (+V) <D>
#    
#    Print a carriage return just before printing a prompt in the line 
#    editor. This is on by default as multi-line editing is only possible 
#    if the editor knows where the start of the line appears.
#
#setopt PROMPT_SP
#    
#    Attempt to preserve a partial line (i.e. a line that did not end with 
#    a newline) that would otherwise be covered up by the command prompt 
#    due to the PROMPT_CR option. This works by outputting some 
#    cursor-control characters, including a series of spaces, that should 
#    make the terminal wrap to the next line when a partial line is 
#    present (note that this is only successful if your terminal has 
#    automatic margins, which is typical).
#
#    When a partial line is preserved, by default you will see an 
#    inverse+bold character at the end of the partial line: a ‘%’ for a 
#    normal user or a ‘#’ for root. If set, the shell parameter 
#    PROMPT_EOL_MARK can be used to customize how the end of partial 
#    lines are shown.
#
#    NOTE: if the PROMPT_CR option is not set, enabling this option will 
#    have no effect. This option is on by default.
#
#setopt PROMPT_PERCENT <C> <Z>
#    
#    If set, ‘%’ is treated specially in prompt expansion. See Prompt 
#    Expansion.
#
setopt PROMPT_SUBST
#    
#    If set, parameter expansion, command substitution and arithmetic 
#    expansion are performed in prompts. Substitutions within prompts do 
#    not affect the command status.
#
#setopt TRANSIENT_RPROMPT
#    
#    Remove any right prompt from display when accepting a command line. 
#    This may be useful with terminals with other cut/paste methods.
#
#--------------------------------------------------------------------------
#
# 16.2.9 - Scripts and Functions
#
setopt C_BASES
#    
#    Output hexadecimal numbers in the standard C format, for example 
#    ‘0xFF’ instead of the usual ‘16#FF’. If the option OCTAL_ZEROES is 
#    also set (it is not by default), octal numbers will be treated 
#    similarly and hence appear as ‘077’ instead of ‘8#77’. This option 
#    has no effect on the choice of the output base, nor on the output of 
#    bases other than hexadecimal and octal. Note that these formats will 
#    be understood on input irrespective of the setting of C_BASES.
#
#setopt C_PRECEDENCES
#    
#    This alters the precedence of arithmetic operators to be more like 
#    C and other programming languages; Arithmetic Evaluation has an 
#    explicit list.
#
#setopt DEBUG_BEFORE_CMD <D>
#    
#    Run the DEBUG trap before each command; otherwise it is run after 
#    each command. Setting this option mimics the behaviour of ksh 93; 
#    with the option unset the behaviour is that of ksh 88.
#
#setopt ERR_EXIT (-e, ksh: -e)
#    
#    If a command has a non-zero exit status, execute the ZERR trap, if 
#    set, and exit. This is disabled while running initialization scripts.
#
#    The behaviour is also disabled inside DEBUG traps. In this case the 
#    option is handled specially: it is unset on entry to the trap. If 
#    the option DEBUG_BEFORE_CMD is set, as it is by default, and the 
#    option ERR_EXIT is found to have been set on exit, then the command 
#    for which the DEBUG trap is being executed is skipped. The option is 
#    restored after the trap exits.
#
#    Exiting due to ERR_EXIT has certain interactions with asynchronous 
#    jobs noted in Jobs & Signals.
#
#setopt ERR_RETURN
#    
#    If a command has a non-zero exit status, return immediately from the 
#    enclosing function. The logic is identical to that for ERR_EXIT, 
#    except that an implicit return statement is executed instead of an 
#    exit. This will trigger an exit at the outermost level of a 
#    non-interactive script.
#
#setopt EVAL_LINENO <Z>
#    
#    If set, line numbers of expressions evaluated using the builtin eval 
#    are tracked separately of the enclosing environment. This applies 
#    both to the parameter LINENO and the line number output by the 
#    prompt escape %i. If the option is set, the prompt escape %N will 
#    output the string ‘(eval)’ instead of the script or function name as 
#    an indication. (The two prompt escapes are typically used in the 
#    parameter PS4 to be output when the option XTRACE is set.) If 
#    EVAL_LINENO is unset, the line number of the surrounding script or 
#    function is retained during the evaluation.
#
#setopt EXEC (+n, ksh: +n) <D>
#    
#    Do execute commands. Without this option, commands are read and 
#    checked for syntax errors, but not executed. This option cannot be 
#    turned off in an interactive shell, except when ‘-n’ is supplied to 
#    the shell at startup.
#
#setopt FUNCTION_ARGZERO <C> <Z>
#    
#    When executing a shell function or sourcing a script, set $0 
#    temporarily to the name of the function/script. Note that toggling 
#    FUNCTION_ARGZERO from on to off (or off to on) does not change the 
#    current value of $0. Only the state upon entry to the function or 
#    script has an effect. Compare POSIX_ARGZERO.
#
#setopt LOCAL_LOOPS
#    
#    When this option is not set, the effect of break and continue 
#    commands may propagate outside function scope, affecting loops in 
#    calling functions. When the option is set in a calling function, a 
#    break or a continue that is not caught within a called function 
#    (regardless of the setting of the option within that function) 
#    produces a warning and the effect is cancelled.
#
#setopt LOCAL_OPTIONS <K>
#    
#    If this option is set at the point of return from a shell function, 
#    most options (including this one) which were in force upon entry to 
#    the function are restored; options that are not restored are 
#    PRIVILEGED and RESTRICTED. Otherwise, only this option, and the 
#    LOCAL_LOOPS, XTRACE and PRINT_EXIT_VALUE options are restored. Hence 
#    if this is explicitly unset by a shell function the other options in 
#    force at the point of return will remain so. A shell function can 
#    also guarantee itself a known shell configuration with a formulation 
#    like ‘emulate -L zsh’; the -L activates LOCAL_OPTIONS.
#
#setopt LOCAL_PATTERNS
#    
#    If this option is set at the point of return from a shell function, 
#    the state of pattern disables, as set with the builtin command 
#    ‘disable -p’, is restored to what it was when the function was 
#    entered. The behaviour of this option is similar to the effect of 
#    LOCAL_OPTIONS on options; hence ‘emulate -L sh’ (or indeed any other 
#    emulation with the -L option) activates LOCAL_PATTERNS.
#
#setopt LOCAL_TRAPS <K>
#    
#    If this option is set when a signal trap is set inside a function, 
#    then the previous status of the trap for that signal will be restored 
#    when the function exits. Note that this option must be set prior to 
#    altering the trap behaviour in a function; unlike LOCAL_OPTIONS, the 
#    value on exit from the function is irrelevant. However, it does not 
#    need to be set before any global trap for that to be correctly 
#    restored by a function. For example,
#
#        unsetopt localtraps
#        trap - INT
#        fn() { setopt localtraps; trap '' INT; sleep 3; }
#
#    will restore normal handling of SIGINT after the function exits.
#
#setopt MULTI_FUNC_DEF <Z>
#
#    Allow definitions of multiple functions at once in the form 
#    ‘fn1 fn2...()’; if the option is not set, this causes a parse error. 
#    Definition of multiple functions with the function keyword is always 
#    allowed. Multiple function definitions are not often used and can 
#    cause obscure errors.
#
#setopt MULTIOS <Z>
#
#    Perform implicit tees or cats when multiple redirections are 
#    attempted (see Redirection).
#
setopt OCTAL_ZEROES
#
#    Interpret any integer constant beginning with a 0 as octal, per IEEE 
#    Std 1003.2-1992 (ISO 9945-2:1993). This is not enabled by default as 
#    it causes problems with parsing of, for example, date and time 
#    strings with leading zeroes.
#
#    Sequences of digits indicating a numeric base such as the ‘08’ 
#    component in ‘08#77’ are always interpreted as decimal, regardless 
#    of leading zeroes.
#
#setopt PIPE_FAIL
#    
#    By default, when a pipeline exits the exit status recorded by the 
#    shell and returned by the shell variable $? reflects that of the 
#    rightmost element of a pipeline. If this option is set, the exit 
#    status instead reflects the status of the rightmost element of the 
#    pipeline that was non-zero, or zero if all elements exited with zero 
#    status.
#
#setopt SOURCE_TRACE
#    
#    If set, zsh will print an informational message announcing the name 
#    of each file it loads. The format of the output is similar to that 
#    for the XTRACE option, with the message <sourcetrace>. A file may be 
#    loaded by the shell itself when it starts up and shuts down 
#    (Startup/Shutdown Files) or by the use of the ‘source’ and ‘dot’ 
#    builtin commands.
#
#setopt TYPESET_SILENT
#    
#    If this is unset, executing any of the ‘typeset’ family of commands 
#    with no options and a list of parameters that have no values to be 
#    assigned but already exist will display the value of the parameter. 
#    If the option is set, they will only be shown when parameters are 
#    selected with the ‘-m’ option. The option ‘-p’ is available whether 
#    or not the option is set.
#
#setopt VERBOSE (-v, ksh: -v)
#    
#    Print shell input lines as they are read.
#
#setopt XTRACE (-x, ksh: -x)
#    
#    Print commands and their arguments as they are executed. The output 
#    is preceded by the value of $PS4, formatted as described in Prompt 
#    Expansion.
#
#--------------------------------------------------------------------------
#
# 16.2.10 - Shell Emulation
#
#setopt APPEND_CREATE <K> <S>
#    
#    This option only applies when NO_CLOBBER (-C) is in effect.
#
#    If this option is not set, the shell will report an error when a 
#    append redirection (>>) is used on a file that does not already 
#    exists (the traditional zsh behaviour of NO_CLOBBER). If the option 
#    is set, no error is reported (POSIX behaviour).
#
#setopt BASH_REMATCH
#    
#    When set, matches performed with the =~ operator will set the 
#    BASH_REMATCH array variable, instead of the default MATCH and match 
#    variables. The first element of the BASH_REMATCH array will contain 
#    the entire matched text and subsequent elements will contain 
#    extracted substrings. This option makes more sense when KSH_ARRAYS 
#    is also set, so that the entire matched portion is stored at index 0 
#    and the first substring is at index 1. Without this option, the 
#    MATCH variable contains the entire matched text and the match array 
#    variable contains substrings.
#
setopt BSD_ECHO
#    
#    Make the echo builtin compatible with the BSD man page echo(1) 
#    command. This disables backslashed escape sequences in echo strings 
#    unless the -e option is specified.
#
#setopt CONTINUE_ON_ERROR
#    
#    If a fatal error is encountered (see Errors), and the code is running 
#    in a script, the shell will resume execution at the next statement in 
#    the script at the top level, in other words outside all functions or 
#    shell constructs such as loops and conditions. This mimics the 
#    behaviour of interactive shells, where the shell returns to the line 
#    editor to read a new command; it was the normal behaviour in versions 
#    of zsh before 5.0.1.
#
#setopt CSH_JUNKIE_HISTORY <C>
#    
#    A history reference without an event specifier will always refer to 
#    the previous command. Without this option, such a history reference 
#    refers to the same event as the previous history reference on the 
#    current command line, defaulting to the previous command.
#
#setopt CSH_JUNKIE_LOOPS <C>
#    
#    Allow loop bodies to take the form ‘list; end’ instead of ‘do list; 
#    done’.
#
#setopt CSH_JUNKIE_QUOTES <C>
#    
#    Changes the rules for single- and double-quoted text to match that of 
#    csh. These require that embedded newlines be preceded by a backslash; 
#    unescaped newlines will cause an error message. In double-quoted 
#    strings, it is made impossible to escape ‘$’, ‘`’ or ‘"’ (and ‘\’ 
#    itself no longer needs escaping). Command substitutions are only 
#    expanded once, and cannot be nested.
#
#setopt CSH_NULLCMD <C>
#    
#    Do not use the values of NULLCMD and READNULLCMD when running 
#    redirections with no command. This make such redirections fail (see 
#    Redirection).
#
#setopt KSH_ARRAYS <K> <S>
#    
#    Emulate ksh array handling as closely as possible. If this option is 
#    set, array elements are numbered from zero, an array parameter without 
#    subscript refers to the first element instead of the whole array, and 
#    braces are required to delimit a subscript (‘${path[2]}’ rather than 
#    just ‘$path[2]’).
#
#setopt KSH_AUTOLOAD <K> <S>
#    
#    Emulate ksh function autoloading. This means that when a function is 
#    autoloaded, the corresponding file is merely executed, and must 
#    define the function itself. (By default, the function is defined to 
#    the contents of the file. However, the most common ksh-style case - 
#    of the file containing only a simple definition of the function - is 
#    always handled in the ksh-compatible manner.)
#
#setopt KSH_OPTION_PRINT <K>
#    
#    Alters the way options settings are printed: instead of separate lists 
#    of set and unset options, all options are shown, marked ‘on’ if they 
#    are in the non-default state, ‘off’ otherwise.
#
#setopt KSH_TYPESET
#    
#    This option is now obsolete: a better appropximation to the behaviour 
#    of other shells is obtained with the reserved word interface to declare, 
#    export, float, integer, local, readonly and typeset. Note that the 
#    option is only applied when the reserved word interface is not in use.
#
#    Alters the way arguments to the typeset family of commands, including 
#    declare, export, float, integer, local and readonly, are processed. 
#    Without this option, zsh will perform normal word splitting after 
#    command and parameter expansion in arguments of an assignment; with 
#    it, word splitting does not take place in those cases.
#
#setopt KSH_ZERO_SUBSCRIPT
#
#    Treat use of a subscript of value zero in array or string expressions 
#    as a reference to the first element, i.e. the element that usually 
#    has the subscript 1. Ignored if KSH_ARRAYS is also set.
#
#    If neither this option nor KSH_ARRAYS is set, accesses to an element 
#    of an array or string with subscript zero return an empty element or 
#    string, while attempts to set element zero of an array or string are 
#    treated as an error. However, attempts to set an otherwise valid 
#    subscript range that includes zero will succeed. For example, if 
#    KSH_ZERO_SUBSCRIPT is not set,
#
#        array[0]=(element)
#
#    is an error, while
#
#        array[0,1]=(element)
#
#    is not and will replace the first element of the array.
#
#    This option is for compatibility with older versions of the shell and 
#    is not recommended in new code.
#
#setopt POSIX_ALIASES <K> <S>
#    
#    When this option is set, reserved words are not candidates for alias 
#    expansion: it is still possible to declare any of them as an alias, 
#    but the alias will never be expanded. Reserved words are described 
#    in Reserved Words.
#
#    Alias expansion takes place while text is being read; hence when this 
#    option is set it does not take effect until the end of any function 
#    or other piece of shell code parsed as one unit. Note this may cause 
#    differences from other shells even when the option is in effect. For 
#    example, when running a command with ‘zsh -c’, or even 
#    ‘zsh -o posixaliases -c’, the entire command argument is parsed as one 
#    unit, so aliases defined within the argument are not available even in 
#    later lines. If in doubt, avoid use of aliases in non-interactive code.
#
#setopt POSIX_ARGZERO
#    
#    This option may be used to temporarily disable FUNCTION_ARGZERO and 
#    thereby restore the value of $0 to the name used to invoke the shell 
#    (or as set by the -c command line option). For compatibility with 
#    previous versions of the shell, emulations use NO_FUNCTION_ARGZERO 
#    instead of POSIX_ARGZERO, which may result in unexpected scoping of 
#    $0 if the emulation mode is changed inside a function or script. To 
#    avoid this, explicitly enable POSIX_ARGZERO in the emulate command:
#
#        emulate sh -o POSIX_ARGZERO
#
#    Note that NO_POSIX_ARGZERO has no effect unless FUNCTION_ARGZERO was 
#    already enabled upon entry to the function or script.
#
#setopt POSIX_BUILTINS <K> <S>
#    
#    When this option is set the command builtin can be used to execute 
#    shell builtin commands. Parameter assignments specified before shell 
#    functions and special builtins are kept after the command completes 
#    unless the special builtin is prefixed with the command builtin. 
#    Special builtins are ., :, break, continue, declare, eval, exit, 
#    export, integer, local, readonly, return, set, shift, source, times, 
#    trap and unset.
#
#    In addition, various error conditions associated with the above 
#    builtins or exec cause a non-interactive shell to exit and an 
#    interactive shell to return to its top-level processing.
#
#    Furthermore, the getopts builtin behaves in a POSIX-compatible 
#    fashion in that the associated variable OPTIND is not made local to 
#    functions.
#
#setopt POSIX_IDENTIFIERS <K> <S>
#    
#    When this option is set, only the ASCII characters a to z, A to Z, 
#    0 to 9 and _ may be used in identifiers (names of shell parameters 
#    and modules).
#
#    In addition, setting this option limits the effect of parameter 
#    substitution with no braces, so that the expression $# is treated as 
#    the parameter $# even if followed by a valid parameter name. When it 
#    is unset, zsh allows expressions of the form $#name to refer to the 
#    length of $name, even for special variables, for example in expressions 
#    such as $#- and $#*.
#
#    When the option is unset and multibyte character support is enabled 
#    (i.e. it is compiled in and the option MULTIBYTE is set), then 
#    additionally any alphanumeric characters in the local character set 
#    may be used in identifiers. Note that scripts and functions written 
#    with this feature are not portable, and also that both options must 
#    be set before the script or function is parsed; setting them during 
#    execution is not sufficient as the syntax variable=value has already 
#    been parsed as a command rather than an assignment.
#
#    If multibyte character support is not compiled into the shell this 
#    option is ignored; all octets with the top bit set may be used in 
#    identifiers. This is non-standard but is the traditional zsh behaviour.
#
#setopt POSIX_STRINGS <K> <S>
#    
#    This option affects processing of quoted strings. Currently it only 
#    affects the behaviour of null characters, i.e. character 0 in the 
#    portable character set corresponding to US ASCII.
#
#    When this option is not set, null characters embedded within strings 
#    of the form $'...' are treated as ordinary characters. The entire 
#    string is maintained within the shell and output to files where 
#    necessary, although owing to restrictions of the library interface 
#    the string is truncated at the null character in file names, 
#    environment variables, or in arguments to external programs.
#
#    When this option is set, the $'...' expression is truncated at the 
#    null character. Note that remaining parts of the same string beyond 
#    the termination of the quotes are not truncated.
#
#    For example, the command line argument a$'b\0c'd is treated with the 
#    option off as the characters a, b, null, c, d, and with the option on 
#    as the characters a, b, d.
#
#setopt POSIX_TRAPS <K> <S>
#    
#    When this option is set, the usual zsh behaviour of executing traps 
#    for EXIT on exit from shell functions is suppressed. In that case, 
#    manipulating EXIT traps always alters the global trap for exiting 
#    the shell; the LOCAL_TRAPS option is ignored for the EXIT trap. 
#    Furthermore, a return statement executed in a trap with no argument 
#    passes back from the function the value from the surrounding context,
#    not from code executed within the trap.
#
#setopt SH_FILE_EXPANSION <K> <S>
#    
#    Perform filename expansion (e.g., ~ expansion) before parameter 
#    expansion, command substitution, arithmetic expansion and brace 
#    expansion. If this option is unset, it is performed after brace 
#    expansion, so things like ‘~$USERNAME’ and ‘~{pfalstad,rc}’ will work.
#
#setopt SH_NULLCMD <K> <S>
#    
#    Do not use the values of NULLCMD and READNULLCMD when doing 
#    redirections, use ‘:’ instead (see Redirection).
#
#setopt SH_OPTION_LETTERS <K> <S>
#    
#    If this option is set the shell tries to interpret single letter 
#    options (which are used with set and setopt) like ksh does. This also 
#    affects the value of the - special parameter.
#
#setopt SH_WORD_SPLIT (-y) <K> <S>
#    
#    Causes field splitting to be performed on unquoted parameter 
#    expansions. Note that this option has nothing to do with word 
#    splitting. (See Parameter Expansion.)
#
#setopt TRAPS_ASYNC
#    
#    While waiting for a program to exit, handle signals and run traps 
#    immediately. Otherwise the trap is run after a child process has 
#    exited. Note this does not affect the point at which traps are run 
#    for any case other than when the shell is waiting for a child process.
#
#--------------------------------------------------------------------------
#
# 16.2.11 - Shell State
#
#setopt INTERACTIVE (-i, ksh: -i)
#    
#    This is an interactive shell. This option is set upon initialisation 
#    if the standard input is a tty and commands are being read from 
#    standard input. (See the discussion of SHIN_STDIN.) This heuristic 
#    may be overridden by specifying a state for this option on the 
#    command line. The value of this option can only be changed via flags 
#    supplied at invocation of the shell. It cannot be changed once zsh 
#    is running.
#
#setopt LOGIN (-l, ksh: -l)
#    
#    This is a login shell. If this option is not explicitly set, the 
#    shell becomes a login shell if the first character of the argv[0] 
#    passed to the shell is a ‘-’.
#
#setopt PRIVILEGED (-p, ksh: -p)
#    
#    Turn on privileged mode. Typically this is used when script is to be 
#    run with elevated privileges. This should be done as follows directly 
#    withtest -e "${HOME}/.iterm2_shell_integration.zsh" && source 
#    "${HOME}/.iterm2_shell_integration.zsh" the -p option to zsh so that 
#    it takes effect during startup.
#
#         #!/bin/zsh -p
#
#    The option is enabled automatically on startup if the effective user 
#    (group) ID is not equal to the real user (group) ID. In this case, 
#    turning the option off causes the effective user and group IDs to be 
#    set to the real user and group IDs. Be aware that if that fails the 
#    shell may be running with different IDs than was intended so a script 
#    should check for failure and act accordingly, for example:
#
#        unsetopt privileged || exit
#    
#    The PRIVILEGED option disables sourcing user startup files. If zsh 
#    is invoked as ‘sh’ or ‘ksh’ with this option set, /etc/suid_profile 
#    is sourced (after /etc/profile on interactive shells). Sourcing 
#    ~/.profile is disabled and the contents of the ENV variable is ignored. 
#    This option cannot be changed using the -m option of setopt and 
#    unsetopt, and changing it inside a function always changes it 
#    globally regardless of the LOCAL_OPTIONS option.
#
#setopt RESTRICTED (-r)
#    
#    Enables restricted mode. This option cannot be changed using 
#    unsetopt, and setting it inside a function always changes it globally 
#    regardless of the LOCAL_OPTIONS option. See Restricted Shell.
#
#setopt SHIN_STDIN (-s, ksh: -s)
#    
#    Commands are being read from the standard input. Commands are read 
#    from standard input if no command is specified with -c and no file 
#    of commands is specified. If SHIN_STDIN is set explicitly on the 
#    command line, any argument that would otherwise have been taken as a 
#    file to run will instead be treated as a normal positional parameter.
#    Note that setting or unsetting this option on the command line does 
#    not necessarily affect the state the option will have while the shell 
#    is running - that is purely an indicator of whether or not commands 
#    are actually being read from standard input. The value of this option 
#    can only be changed via flags supplied at invocation of the shell. It 
#    cannot be changed once zsh is running.
#
#setopt SINGLE_COMMAND (-t, ksh: -t)
#    
#    If the shell is reading from standard input, it exits after a single 
#    command has been executed. This also makes the shell non-interactive,
#    unless the INTERACTIVE option is explicitly set on the command line. 
#    The value of this option can only be changed via flags supplied at 
#    invocation of the shell. It cannot be changed once zsh is running.
#
#--------------------------------------------------------------------------
#
# 16.2.12 - Zle
#
#setopt BEEP (+B) <D>
#    
#    Beep on error in ZLE.
#    
#setopt COMBINING_CHARS
#    
#    Assume that the terminal displays combining characters correctly. 
#    Specifically, if a base alphanumeric character is followed by one or 
#    more zero-width punctuation characters, assume that the zero-width 
#    characters will be displayed as modifications to the base character 
#    within the same width. Not all terminals handle this. If this option 
#    is not set, zero-width characters are displayed separately with 
#    special mark-up.
#
#    If this option is set, the pattern test [[:WORD:]] matches a 
#    zero-width punctuation character on the assumption that it will be 
#    used as part of a word in combination with a word character. Otherwise 
#    the base shell does not handle combining characters specially.
#
#setopt EMACS
#    
#    If ZLE is loaded, turning on this option has the equivalent effect of 
#    ‘bindkey -e’. In addition, the VI option is unset. Turning it off 
#    has no effect. The option setting is not guaranteed to reflect the 
#    current keymap. This option is provided for compatibility; bindkey 
#    is the recommended interface.
#
#setopt OVERSTRIKE
#    
#    Start up the line editor in overstrike mode.
#
#setopt SINGLE_LINE_ZLE (-M) <K>
#    
#    Use single-line command line editing instead of multi-line.
#
#    Note that although this is on by default in ksh emulation it only 
#    provides superficial compatibility with the ksh line editor and 
#    reduces the effectiveness of the zsh line editor. As it has no 
#    effect on shell syntax, many users may wish to disable this option 
#    when using ksh emulation interactively.
#
setopt VI
#    
#    If ZLE is loaded, turning on this option has the equivalent effect 
#    of ‘bindkey -v’. In addition, the EMACS option is unset. Turning it 
#    off has no effect. The option setting is not guaranteed to reflect 
#    the current keymap. This option is provided for compatibility; bindkey 
#    is the recommended interface.
#
setopt ZLE
#    
#    Use the zsh line editor. Set by default in interactive shells 
#    connected to a terminal.
#
#--------------------------------------------------------------------------
fi

###                       ###
### ZSH LINE EDITOR (ZLE) ###
###                       ###

# Suspend/Resume vim with Ctrl-Z
# Note: Options listed in 'FUNCTIONS' section above and 'BIND KEY' section 
# below are needed for this to work.
zle -N foreground-vim

###            ###
### ZSH STYLES ###
###            ###

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'

zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'

zstyle ':completion:*:cd:*' ignored-patterns '(*/)#CVS'
zstyle ':completion:*:cd:*' ignore-parents parent pwd

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:killall:*' menu yes select
zstyle ':completion:*:killall:*' command 'ps --forest -u $USER -o cmd'

zstyle ':completion:*:descriptions' format '%U%d%u'
zstyle ':completion:*:warnings' format '%Bno matches for: %d%b'

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

zstyle ':completion:*:functions' ignored-patterns '_*'

zstyle ':completion:*:*:xdvi:*' menu yes select
zstyle ':completion:*:*:xdvi:*' file-sort time

zstyle ':completion:*:rm:*' ignore-line yes
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~' \
    '*?.old' '*?.pro'

zstyle ':completion:*:functions' ignored-patterns '_*'

zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'

zstyle :compinstall filename "$HOME/.zshrc"

zstyle ':vcs_info:*' enable git svn

###      ###
### PATH ###
###      ###

# This script sets the $PATH variable from a user-specified configuration file. 
#test -x "${HOME}/.path" && source ${HOME}/.path -s

# Fallback in case .path isn't where it's supposed to be.
#if [[ ! -x ~/.path ]]; then 
    PATH=/usr/local/bin:/usr/bin:/usr/X11/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/Developer/Tools:/hx/bin:/hx/sbin:/Users/silverstorm/.bin:/Users/silverstorm/Projects/Programming/Shell
#fi

###          ###
### PROGRAMS ###
###          ###

# This script determines the programs available on this system.
#test -x "${HOME}/.programs" && source ${HOME}/.programs

###              ###
### KEY BINDINGS ###
###              ###

# Suspend/Resume vim with Ctrl-Z 
# Note: Options listed in 'FUNCTIONS' and 'ZSH LINE EDITOR' sections above 
# are needed for this to work.
bindkey '^Z' foreground-vim

# Use Ctrl-r and Ctrl-s to search history with globbing.
# Note: 'setopt EXTENDED_GLOB' must be enabled for this to work.
bindkey "^R" history-incremental-pattern-search-backward
bindkey "^S" history-incremental-pattern-search-forward

###                         ###
### ENVIRONMENTAL VARIABLES ###
###                         ###

# Environment Variables:
export LANG=en_US.UTF-8             # Language
export TZ="America/New_York"        # Timezone
#export OS_VERSION="$(uname -r)"     # OS Version
#export TERM=xterm-color            # Terminal
export SHELL=/bin/zsh               # Shell

# Check programs to make sure these are installed first. If not, default
# to nano for the editor and less for the pager.
export EDITOR=vim                   # Editor
export PAGER=vimpager               # Pager

# ZSH Options Variables: 
#CORRECT_IGNORE
#CORRECT_IGNORE_FILE

# ZSH History:
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=${HOME}/.history

# Exports directory stack size (see 'dir -v' in .alias)
export DIRSTACKSIZE=9

### Program Variables ###

#--------------------------------------------------------------------------
#
# GNU coreutils:
# Taken from: https://www.gnu.org/software/coreutils/manual/html_node/Block-size.html
#
#export DF_BLOCKSIZE
#
#    This specifies the default block size for the df command. Similarly, 
#    DU_BLOCK_SIZE specifies the default for du and LS_BLOCK_SIZE for ls.
#
#export DU_BLOCKSIZE
#
#    This specifies the default block size for the du command. Similarly, 
#    DF_BLOCK_SIZE specifies the default for df and LS_BLOCK_SIZE for ls.
#
export LS_BLOCKSIZE=1024
#
#    This specifies the default block size for the ls command. Similarly, 
#    DU_BLOCK_SIZE specifies the default for du and DF_BLOCK_SIZE for df.
#
#export BLOCK_SIZE
#
#    This specifies the default block size for all three commands, if the 
#    above command-specific environment variables are not set. 
#
#export BLOCKSIZE
#
#    This specifies the default block size for all values that are normally 
#    printed as blocks, if neither BLOCK_SIZE nor the above command-specific 
#    environment variables are set. Unlike the other environment variables, 
#    BLOCKSIZE does not affect values that are normally printed as byte 
#    counts, e.g., the file sizes contained in ls -l output.  
#
#    If the environment variable BLOCKSIZE is set, the block counts 
#    (see -s in the ls man page) will be displayed in units of that size block.
#
#export POSIXLY_CORRECT 
#
#    If neither command_BLOCK_SIZE, nor BLOCK_SIZE, nor BLOCKSIZE is set, 
#    but this variable is set, the block size defaults to 512.
#
#--------------------------------------------------------------------------
#
# ls:
# Information taken from the LS manual page. Type 'man ls' for details.
#
export CLICOLOR=1
#
#    Use ANSI color sequences to distinguish file types.  See LSCOLORS below.
#    In addition to the file types mentioned in the -F option some extra 
#    attributes (setuid bit set, etc.) are also displayed.  The colorization 
#    is dependent on a terminal type with the proper termcap(5) capabilities.
#    The default ``cons25'' console has the proper capabilities, but to 
#    display the colors in an xterm(1), for example, the TERM variable 
#    must be set to ``xterm-color''.  Other terminal types may require 
#    similar adjustments.  Colorization is silently disabled if the output 
#    isn't directed to a terminal unless the CLICOLOR_FORCE variable is defined.
#
#export CLICOLOR_FORCE 
#
#    Color sequences are normally disabled if the output isn't directed to 
#    a terminal.  This can be overridden by setting this flag.  The TERM 
#    variable still needs to reference a color capable terminal however 
#    otherwise it is not possible to determine which color sequences to use.
#
#export COLUMNS 
#
#    If this variable contains a string representing a decimal integer, it 
#    is used as the column position width for displaying multiple-text-column 
#    output.  The ls utility calculates how many pathname text columns to 
#    display based on the width provided.  (See -C and -x.)
#
#export LANG 
#    
#    The locale to use when determining the order of day and month in the 
#    long -l format output.  See environ(7) for more information.
#
#export LSCOLORS 
#
#    The value of this variable describes what color to use for which 
#    attribute when colors are enabled with CLICOLOR.  This string is a 
#    concatenation of pairs of the format fb, where f is the foreground 
#    color and b is the background color.
#
#    The color designators are as follows:
#
#        a     black
#        b     red
#        c     green
#        d     brown
#        e     blue
#        f     magenta
#        g     cyan
#        h     light grey
#        A     bold black, usually shows up as dark grey
#        B     bold red
#        C     bold green
#        D     bold brown, usually shows up as yellow
#        E     bold blue
#        F     bold magenta
#        G     bold cyan
#        H     bold light grey; looks like bright white
#        x     default foreground or background
#
#    Note that the above are standard ANSI colors.  The actual display may
#    differ depending on the color capabilities of the terminal in use.
#
#    The order of the attributes are as follows:
#
#        1.   directory
#        2.   symbolic link
#        3.   socket
#        4.   pipe
#        5.   executable
#        6.   block special
#        7.   character special
#        8.   executable with setuid bit set
#        9.   executable with setgid bit set
#        10.  directory writable to others, with sticky bit
#        11.  directory writable to others, without sticky bit
#
#     The default is "exfxcxdxbxegedabagacad", i.e. blue foreground and 
#     default background for regular directories, black foreground and red 
#     background for setuid executables, etc.
#
#export LS_COLWIDTHS 
#
#    If this variable is set, it is considered to be a colon-delimited list 
#    of minimum column widths.  Unreasonable and insufficient widths are 
#    ignored (thus zero signifies a dynamically sized column).  Not all 
#    columns have changeable widths.  The fields are, in order: inode, 
#    block count, number of links, user name, group name, flags, file size, 
#    file name.
#
#exprt TERM 
#
#    The CLICOLOR functionality depends on a terminal type with color 
#    capabilities.
#
#export TZ 
#
#    The timezone to use when displaying dates.  See environ(7) for more 
#    information.
#
#--------------------------------------------------------------------------
#
# Grep:
# Information taken from the grep manual page. Type 'man grep' for details.
#
export GREP_OPTIONS="--color=auto"
#
#    May be used to specify default options that will be placed at the 
#    beginning of the argument list.  Backslash-escaping is not supported,
#    unlike the behavior in GNU grep.
#
export GREP_COLOR='1;32'
#
#    Sets the highilght color for grep.
#
#--------------------------------------------------------------------------
#
# Pager:
#export LESS 
#export VIMPAGER_VIM 
#
#--------------------------------------------------------------------------
#
# Metasploit:
#
export MSF_DATABASE_CONFIG=/usr/local/src/metasploit-framework/config/database.yml
#
#

### OS Specific ###

# Determine the Operating System:
if [[ "$OSTYPE" == "darwin"* ]]; then  
# OS X
    export CVSROOT=/usr/local/cvsroot   # CVS Root
    export CVS_RSH=/usr/bin/ssh         # CVS 
    export JAVA_HOME=/Library/Java/Home # Java

    # Use Fink for compiling software
    #export CFLAGS=-I/sw/include 
    #export LDFLAGS=-L/sw/lib 
    #export CXXFLAGS=$CFLAGS 
    #export CPPFLAGS=$CXXFLAGS 
    #export ACLOCAL_FLAGS="-I /sw/share/aclocal"
    #export PKG_CONFIG_PATH="/sw/lib/pkgconfig"
    ##export PATH=/sw/var/lib/fink/path-prefix-10.6:$PATH
    #export PATH=$PATH:/sw/var/lib/fink/path-prefix-10.6
    #export MACOSX_DEPLOYMENT_TARGET=10.5

    # For SQLite under HomeBrew:
    #export LDFLAGS=-L/usr/local/opt/sqlite/lib
    #export CPPFLAGS=-I/usr/local/opt/sqlite/include
    ##LDFLAGS:  -L/usr/local/opt/sqlite/lib
    ##CPPFLAGS: -I/usr/local/opt/sqlite/include
    ##PKG_CONFIG_PATH: /usr/local/opt/sqlite/lib/pkgconfig


    # Fink Display Export
    # Exports the DISPLAY option if OS is less than Leopard
    if [[ $OS_VERSION < 9.0.0 ]]; then
        export DISPLAY=:0
    fi

    # Fink:
    #test -r /sw/bin/init.sh && . /sw/bin/init.sh

    # iTerm: 
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

elif [[ "$OSTYPE" == "freebsd"* ]]; then 
# FreeBSD

elif [[ "$OSTYPE" == "linux-gnu" ]]; then
# Linux

else 
# Anything else.
    echo "Could not determine Operating System." 
fi

# BSD:
#

# Linux:
#

# Test
#export C_INCLUDE_PATH=$C_INCLUDE_PATH:/sw/include
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/sw/lib
#export LIBRARY_PATH=$LIBRARY_PATH:/sw/lib

###        ###
### ALIAS' ###
###        ###

test -e "${HOME}/.alias" && source ${HOME}/.alias                 # File containing alias' information

###        ###
### COLORS ###
###        ###

test -e "${HOME}/.colors" && source ${HOME}/.colors                # File containing filetype color codes

###        ###
### PROMPT ###
###        ###

test -e "${HOME}/.zshprompt" && source ${HOME}/.zshprompt             # File containing ZSH Prompt modification

###      ###
### MAIN ###
###      ###



###              ###
### TESTING AREA ###
###              ###

# Test:
#for tmux: export 256color
#[ -n "$TMUX" ] && export TERM=xterm-256color

# Run Startup App
# Launch tmux at startup.
# If not running interactively, do not do anything.
#[[ $- != *i* ]] && return
#[[ -z "$TMUX" ]] && exec tmux

#if which tmux > /dev/null 2>&1; then
    # if no session is started, start a new session
#    test -z ${TMUX} && tmux;
    
    # when quitting tmux, try to attach
#    while test -z ${TMUX}; do 
#        tmux attach || break
#    done
#fi

#if [ "$PS1" ]; then            # Checks for $PS1 before executing any apps
#	if [ -z "$STY" ]; then      # Checks to see if $STY is running
#    	exec screen -dR         # If PS1 is present and STY is not running, run app
#	fi
#fi

# EOF
