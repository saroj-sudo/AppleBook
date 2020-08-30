class Character {
  final int id;
  final String letter;
  final String word;
  final String imagPath;
  final String audioPath;

  const Character({
    this.id,
    this.letter,
    this.word,
    this.imagPath,
    this.audioPath,
  });

  String get appBarName => null;
}

class Content {
  String title;
  String image;
  String appBarName;
  List<Character> listOf;

  Content({
    this.title,
    this.image,
    this.listOf,
    this.appBarName,
  });
}
