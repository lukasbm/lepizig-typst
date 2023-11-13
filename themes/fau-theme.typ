#import "../lib/main.typ";
#import "../lib/colors.typ": ThemeFAU;

#let title-slide(
  title: "Title",
  subtitle: "Subtitle",
  authors: ("author1", "author 2"),
  institution: "FAU",
  date: datetime.today(),
) = main.title-slide(
  theme: ThemeFAU,
  title: title,
  subtitle: subtitle,
  authors: authors,
  institution: institution,
  date: date,
)
