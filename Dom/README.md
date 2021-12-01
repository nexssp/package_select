# Select/Dom Nexss PROGRAMMER 2.x

Selects DOM from the parsed html

## Examples

```sh
nexss Select/Dom ".footer__bottom"
```

## .nexss examples

run .nexss files or any programming language by command:

```sh
nexss <file>
nexss readWebsiteTitle.nexss
nexss readWebsiteTitleAndH1 .nexss
```

### readWebsiteTitle.nexss

```nexss
https://nexss.com
Select/Dom --_selector=title
Speak
Output/End "Done."
```

### readWebsiteTitleAndH1.nexss

```nexss
https://nexss.com --nxsAs=myWebsiteSource
Select/Dom --nxsInFrom=myWebsiteSource --_selector=title
Speak
Select/Dom --nxsInFrom=myWebsiteSource --_selector=h1
Speak
Output/End "Done."

```
