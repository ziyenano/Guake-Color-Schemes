## Guake Color Schemes

### Introduction

__An easy way to configure the  color schemes of guake__.

Note that, all themes  are cited from the awesome repository [Gogh](https://github.com/Mayccoll/Gogh), and you can preview all  themes [here](https://github.com/Mayccoll/Gogh/blob/master/content/themes.md). Unfortunately, it seems not to provide an interface for guake. Inspired by [guake-color-palettes](https://github.com/coolwanglu/guake-colors-solarized), this repository provides an easy way to configure  the color schemes of guake. 

<br/>

![themes](https://github.com/ziyenano/Guake-Color-Schemes/blob/master/images/themes.gif)

-------------

<br/>

### Usage

```
git clone https://github.com/ziyenano/Guake-Color-Schemes.git
```
enter the directory 
```
chmod a+x  guake_theme.sh  browser_guake_theme.sh
```


Use command

```
./guake_theme.sh  -l
```
to list all available themes.

And use 
```
./guake_theme.sh  theme_name
```
to set the corresponding theme, e.g., __./guake_theme.sh tin__ setting the tin theme.

### Browser Mode (Suggested)

Inspired by [iTerm2-Color-Schemes](https://github.com/mbadolato/iTerm2-Color-Schemes), it also provides a more convenient approach. 

Type the following command in your guake terminal,

```
./browser_guake_theme.sh
```
then click keys <kbd>p</kbd> / <kbd>n</kbd> for browsing the _previous_ / _next_ theme and click key <kbd>y</kbd> for choosing the theme you perfer.


###Note
* It has been validated on Ubuntu and Linux Mint platforms. 
* If you test it on other platforms, please tell me by creating an issue.

