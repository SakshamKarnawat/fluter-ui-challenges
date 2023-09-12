class DetailBlockText {
  final String detailText;
  final String detailDescription;
  final String image;

  const DetailBlockText({
    required this.detailText,
    required this.detailDescription,
    required this.image,
  });
}

const List<DetailBlockText> detailBlockTexts = [
  DetailBlockText(
    detailText: "Study Morse\nCode in one app",
    detailDescription: "200+ exciting levels from\nletters to sentences",
    image: "assets/images/background_one.jpg",
  ),
  DetailBlockText(
    detailText: "Learn most\npopular phrases",
    detailDescription: "75 most useful abbreviations\nand prosigns",
    image: "assets/images/background_two.jpg",
  ),
  DetailBlockText(
    detailText: "Train all spheres\nof code",
    detailDescription:
        "5 output models including audio,\nvisual, flashlights and vibrations",
    image: "assets/images/background_three.jpg",
  ),
];
