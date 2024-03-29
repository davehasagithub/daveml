# DaveML

Adds color to linux files using simple markup.

For example, `<WBB>` for bold white text on a blue background. This becomes
the ANSI color escape sequence: `\x1b[37;44;1m`.

Instead of this, you might want to
[try](https://stackoverflow.com/questions/7851134/syntax-highlighting-colorizing-cat):
`bat`, `ccat`, `pygmentize`, or `highlight`.

## Example

Create a file `demo.txt`, such as:

```text
<WBB>|             |
<WBB>|   Welcome   |
<WBB>|             |

<GXX>This is going to be <CXX>cool <RBX>!!!
```

And it will become:

<img alt="screenshot" src="./sample.png" />

## Usage

```bash
daveml.sh demo.txt
````
```bash
cat demo.txt | daveml.sh
```
```bash
cat <<EOF | daveml.sh -p ""
Usage: <BBX>some-command <YBX>arg1 arg2
EOF
```

The current default is to show a `| ` line prefix. It can be removed or changed with `-p`:

```
daveml.sh -p "" /etc/motd
daveml.sh -p ">> " /etc/motd
```

## Codes

Colors are specified as 3 letter tags, such as `RXX` for red text, or `WBB` for bold white with a blue background.
`CLR` is used to clear/reset.

> &lt;foreground&gt; &lt;bold or X&gt; &lt;background or X&gt;
>
> K = black, R = red, G = green, Y = yellow, B = blue
> M = magenta, C = cyan, W = white, X = default

## Notes

- This does not currently include support for _italic_, _ underline _, or ~~strikethrough~~.
- This uses `perl`, but could be modified to use `sed` instead.
- Remember, if you do a bold color before a non-bold, you'll need a CLR to remove the bold effect: &lt;BBX&gt;...**&lt;CLR&gt;**&lt;BXX&gt;...

## Install

To install globally:
```bash
sudo curl -sL -o /usr/local/bin/daveml.sh https://raw.githubusercontent.com/davehasagithub/daveml/main/daveml.sh
sudo chmod 755 /usr/local/bin/daveml.sh
sudo bash -c 'echo "alias daveml=\"/usr/local/bin/daveml.sh\"" >/etc/profile.d/daveml-alias.sh'
#sign out and back in for the alias to take effect
```

To use locally:
```bash
curl -sLO https://raw.githubusercontent.com/davehasagithub/daveml/main/daveml.sh
chmod u+x ./daveml.sh
```
