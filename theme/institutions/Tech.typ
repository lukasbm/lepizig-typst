#import "../main.typ";
#import "../colors.typ": ThemeTech;

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

// TODO: do this for the other slide methods
