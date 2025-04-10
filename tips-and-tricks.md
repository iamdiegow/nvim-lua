# Neovim Tips and Tricks

## Tips and Tricks

- Copy current Word to the command line

```
<C-r><C-w>
```

Useful to start a search with the word under the cursor: `/<C-r><C-w>`

- Power of ":g", the **global command**

```
:[range]g/pattern/cmd
```

Executes the command for **each line**  matching the `pattern`.

- Display context of matching line
`:g/pattern/z#.5`

- Delete lines that match the pattern
`:g/pattern/d`

- Delete all lines that don't match a pattern
`:g!/pattern/d` or `:v/pattern/d`

- Moves all the matching lines to the end of the file
`:g/pattern/m$`

- Copy matching lines and paste them at the end of the file
`let @<register> = ''`
`:g/pattern/yank <register> |`
`$put <register>`

### Substitution

`:s/old_string/string`, substitution in the current line
`:1,10/old_string/string`, substitution in the range 1 to 10.

`%s/\(good\|great\)/awesome/g` replace good or great with awesome.

### Match strings

The match command `:match` can use a highlight group to match a string in the current buffer

`:match ErrorMsg /ERROR/`, matches `/ERROR/` and adds the `ErrorMsg` highlight group.

### Command Line mode

- `<C-w>` deletes a word
- `<C-u>` deletes all

## Concepts

- Ex commands

Ex commands are the ones that start with a colon, such as `:d` for delete.

- Run normal mode as commands

`normal`
`normal!` run the following keystrokes without custom key mappings.

## Search and Replace

### Anatomy of A Substitution Command

`:[range]s[ubstitute]/{pattern}/{string}/[flags] [count]`

- Same line substitution

`:s/old/new`, only replace first occurrence.
`:s/old/new/g`, replace all occurrences in the same line.
`:s/old/new/gc`, confirm each substitution.

- Case sensitive

`:s/\C{pattern}/{string}`, **\C** makes the pattern case sensitive, is case insensitive by default.

- Regex

  - Character classes: `[bp]le`, matches either 'ble' or 'ple'.
  - Anchors: `^apple`, starts with apple, `pie$`, ends with pie.
  - Quantifiers and Atoms:
    - `.`: any single character.
    - `.*`: match zero or more characters.
    - `.+`: match one or more characters.
    - `\w`: matches any word.
    - `\d`: matches any digit.
    - `\s`: matches any white space.
    - `\v`: Vim magic's mode. No need to escape special characters like `()`.

- Using capture groups

`:s/\{pattern}/&-append`, captures pattern and stores it in `&`.

`:s/\(.*\)/"\1"`, captures zero or more characters and adds surrounding quotes.
