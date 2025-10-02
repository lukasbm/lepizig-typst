# Leipzig Typst theme

:rocket: the Leipzig style, but in *typst*.
Inspired by [Leipzig Beamer](https://github.com/bmondal94/Leipzig-Beamer-Template)

## :gear: Prerequisites

- Arial font family (Liberation Sans as fallback)
- Futura font family (Jost as fallback)
- `typst >= 0.12.0` compiler installed
- `git` and `python3` installed

## :wrench: Installation

This theme will not be published in the package repository of typst due to distribution restrictions.

However you can easily install it locally as follows:

```bash
git clone git@github.com:lukasbm/leipzig-typst.git
cd leipzig-typst
# make sure you execute the python script from the project root!
python3 install.py  # run the cross-platform install script (just copies the source files to the right location)
```

## :rocket: Usage

After installing the dependencies (Fonts, git, Typst compiler) and the local package (using the python script),
you can start writing your own documents.
The default setup will look like this:

```typst
#import "@preview/polylux:0.4.0": *
#import "@local/leipzig-typst:0.0.1": leipzig-theme, main

// initialize the template with this function (important!)
#show: main.setup-theme.with(
  short-author: "Lukas Böhm",
  short-title: "Test Document",
  short-date: datetime.today(),
  short-organization: "Lab1",
)
```

You're ready to get going!
Write your first presentation. For example like this:

```typst
#title-slide(
  title: "Test Document showing off the theme",
  subtitle: "in Typst, the new Markup Language",
  authors: (
    (
      name: "Theresa Tungsten",
      affiliation: "Artos Institute",
      email: "tung@artos.edu",
    ),
    (name: "Eugene Deklan", affiliation: "Honduras State"),
    (name: "Lukas Böhm"),
  ),
)

#slide(title: "Introduction", subtitle: "What is this?")[
  This file demonstrates the usage of the Leipzig theme for typst.
]
```

## :sparkles: Examples

While more extensive documentation is in the works,
take a look at the [example directory](./example/) to get a better indication of how to use this template.

## :bulb: More Information

For more information, take a look at the [Developer Guide](./DEVELOPER.md)

## :page_facing_up: License

TODO

## :lightning: Debugging

### Polylux Error

In case there are inexplicable compiler errors, try redownloading the dependency packages (polylux).
First delete it from [the cache where it is saved](https://docs.rs/dirs/latest/dirs/fn.cache_dir.html).
(e.g. `rm -rf ~/.cache/typst/packages/preview/polylux` on linux) then try again.
