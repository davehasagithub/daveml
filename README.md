# DaveML

> Possibly the dumbest project on GitHub. :)
>
> You probably want to
> [try](https://stackoverflow.com/questions/7851134/syntax-highlighting-colorizing-cat):
> `bat`, `ccat`, `pygmentize`, or `highlight`.

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

cat demo.txt | daveml.sh
```

The `| ` line prefix can be removed or changed:

```
daveml.sh -p "" /etc/motd
daveml.sh -p ">> " /etc/motd
```

## Codes

Colors are specified as 3 letter tags, such as `RXX` for red text, or `WBB` for bold white with a blue background.

> &lt;foreground&gt; &lt;bold or X&gt; &lt;background or X&gt;
>
> K = black, R = red, G = green, Y = yellow, B = blue
> M = magenta, C = cyan, W = white, X = default

_This does not include support for italic, underline, or strikethrough._

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
