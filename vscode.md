# vscode

## font

- [Source Han Code JP](https://github.com/adobe-fonts/source-han-code-jp, "Source Han Code JP")
- [HackGen](https://github.com/yuru7/HackGen, "HackGen")

### ligatures

- [Cascadia Code](https://github.com/microsoft/cascadia-code, "Cascadia Code")
- [Fira Code](https://github.com/tonsky/FiraCode, "Fira Code")

## settings.json

```json:settings.json
{
    "git.autofetch": true,
    "editor.cursorBlinking": "smooth",
    "editor.fontFamily": "'Cascadia Code', 'Source Han Code JP', Consolas, 'Courier New', monospace",
    "editor.fontLigatures": true,
    "editor.renderWhitespace": "all",
    "editor.renderControlCharacters": false,
    "code-eol.newlineCharacter":"↓",
    "code-eol.returnCharacter" :"←",
    "code-eol.crlfCharacter": "↵",
    "terminal.integrated.shell.windows": "C:\\Program Files\\Git\\bin\\bash.exe",
    "shellLauncher.shells.windows": [
        {
            "shell": "C:\\Windows\\system32\\cmd.exe",
            "label": "cmd"
        },
        {
//            "shell": "C:\\Windows\\system32\\WindowsPowerShell\\v1.0\\powershell.exe",
            "shell": "C:\\Program Files\\PowerShell\\6\\pwsh.exe",
            "label": "PowerShell"
        },
        {
            "shell": "C:\\Program Files\\Git\\bin\\bash.exe",
            "label": "Git bash"
        },
        {
            "shell": "C:\\Windows\\sysnative\\bash.exe",
            "label": "WSL Bash"
        }
    ]
}
```

## 拡張機能

- Japanese Language Pack for Visual Studio Code
- Markdown All in One
- markdownlint
- vscode-reveal
- vscode-textlint
- code-eol 2019
- Shell launcher

## textlint

WIP
