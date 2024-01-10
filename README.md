# FAU Typst theme

:rocket: the FAU style, but in *typst*.
Inspired by [FAU beamer](https://github.com/FAU-AMMN/fau-beamer)

## :gear: Prerequisites

- [`FAUSans Office` font family](https://www.intern.fau.de/kommunikation-und-marke/corporate-design/fau-schrift/) installed
- `typst >= 0.9.0` compiler installed
- `git` and `python3` installed 

## :wrench: Installation

This theme will not be published in the package repository of typst due to distribution restrictions.

However you can easily install it locally as follows:
```bash
git clone git@github.com:lukasbm/fau-typst.git
cd fau-typst
# make sure you execute the python script from the project root!
python3 install.py  # run the cross-platform install script (just copies the source files to the right location)
```

## :rocket: Usage

After installing the dependencies (Fonts, git, Typst compiler) and the local package (using the python script),
you can start writing your own documents.
The default setup will look like this:
```typst
#import "@preview/polylux:0.3.1": *
#import "@local/fau-typst:0.0.1": <institution>-theme, main
#import <intitution>-theme: *  // import everything from the theme (slide types)

// initialize the template with this function (important!)
#show: main.fau-theme.with(
  short-author: "Lukas Böhm",
  short-title: "Test Document",
  short-date: datetime.today(),
  short-organization: "Lab1",
  institution: "FAU",
)
```
Where `<institution>` can be replaced with either: `fau`, `nat`, `phil`, `rw`, `tech`, `med`.
Just changing the import statement will update the entire theme.
No need for more complicated settings!

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
  This file demonstrates the usage of the FAU theme for typst.
]

```

## :sparkles: Examples

While more extensive documentation is in the works,
take a look at the [example directory](./example/) to get a better indication of how to use this template.


## :bulb: More Information

For more information, take a look at the [Developer Guide](./DEVELOPER.md)

## :page_facing_up: License

TODO
