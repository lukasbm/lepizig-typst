# FAU Typst theme

## Develop

`cd example && typst watch --root .. --font-path fau-beamer-main/fonts test.typ test.pdf`

### Helper: convert all pdfs to svgs

`find . -type f -name "*.pdf" -exec sh -c 'pdf2svg "$0" "${0%.pdf}.svg"' {} \;`


## Sources

- <https://www.intern.fau.de/kommunikation-und-marke/corporate-design/fau-schrift/>
- <https://www.doc.zuv.fau.de//M/Styleguide/FAU_Styleguide-Essentials_v26_2022-07-14.pdf>
- <https://www.intern.fau.de/kommunikation-und-marke/vorlagen/praesentationsvorlagen-powerpoint>
- <https://www.wordpress.rrze.fau.de/entwicklung/design/schriften/>
- <https://www.intern.fau.de/kommunikation-und-marke/corporate-design/fau-logo/>

### Fonts

- Roboto Bild
- Roboto Bold Italic
- Roboto Italic
- Roboto Light
- Roboto Regular
- FAU Chimera (freie Apache Lizenz)
- Roboto (freie Apache Lizenz)
- FAU Sans (kommerzielle Lizenz, nur für interne Zwecke)
- FAU Sans Office (kommerzielle Lizenz, nur für interne Zwecke)

