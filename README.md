# DaveML

Possibly the dumbest project on GitHub.

Create a file `demo.txt`, such as:

```text
<BBG>|             |
<BBG>|   Welcome   |
<BBG>|             |

<GGG>This is going to be <CCC>cool
```

Run `daveml.sh demo.txt` or `cat demo.txt|daveml.sh`,
and it will convert the tags to ANSI color escape codes.
Maybe useful, for example, when showing a motd (message of the day).
Tags are subject to change!

```bash
curl -sLO https://raw.githubusercontent.com/davehasagithub/daveml/main/daveml.sh
chmod u+x ./daveml.sh
```

<img alt="screenshot" src="./sample.png" />
