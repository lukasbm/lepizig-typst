#import "../lib/main.typ";
#import "../lib/colors.typ": ThemeTech;

#let title-slide(
  title: "Title",
  subtitle: "Subtitle",
  authors: ("author1", "author 2"),
  institution: "Tech",
  date: datetime.today(),
) = main.title-slide(
  theme: ThemeTech,
  title: title,
  subtitle: subtitle,
  authors: authors,
  institution: institution,
  date: date,
)

#let slide(slide-args: (:), body) = main.slide(theme: ThemeTech, ..slide-args, body)
