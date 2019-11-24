# uti

A command-line utility that prints the
[Uniform Type Identifier](https://en.wikipedia.org/wiki/Uniform_Type_Identifier)
for the files provided as an argument.

## Requirements

- macOS 10.4+

## Usage

```terminal
$ uti Hello.swift
public.swift-source
```

Results for multiple path arguments are printed on separate lines
in the order they're provided:

```terminal
$ uti index.html screen.css app.js
public.html
public.css
com.netscape.javascript-source
```

If any of the provided file path arguments are invalid,
the command exits with status code `1`
and prints a message to standard error.

```terminal
$ uti invalid
error: invalid is not a file or directory
```

You can combine `uti` with other Unix commands.
For example,
to list the UTI for each file in a directory,
you might invoke the `find` command like so:

```terminal
$ ls .
Xcode_11.xip
Xcode.app

$ find . -exec uti {} +
com.apple.xip-archive
com.apple.application-bundle
```

### Installation

#### Homebrew

Run the following command to install using [homebrew](https://brew.sh/):

```terminal
$ brew install nshipster/formulae/uti
```

#### Manually

Run the following commands to build and install manually:

```terminal
$ git clone https://github.com/NSHipster/uti.git
$ cd uti
$ make install
```

## Additional Details

`uti` delegates to the [`mdls`] system command,
requesting the `kMDItemContentType` metadata attribute
and processing the output.

## License

MIT

## Contact

Mattt ([@mattt](https://twitter.com/mattt))

[`mdls`]: https://www.unix.com/man-page/osx/1/mdls/
