# dotfiles
A collection of my dotfiles.

## `zsh`
I personally do not like to have huge number of `zsh` plugins. I came across `zsh4humans` while
doom watching on YouTube. I like it that it is minimal and still provides the functionality which I need. The project is available on [Github](https://github.com/romkatv/zsh4humans).

You can install `zsh` and the minimal config to get working by running the following in `bash` or `sh`.

```bash
if command -v curl >/dev/null 2>&1; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
else
  sh -c "$(wget -O- https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
fi
```
