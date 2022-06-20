class Album {
  String title;
  String author;
  String image;
  String songsAmount;
  bool isFavorite;

  Album(this.title, this.author, this.image, [this.songsAmount = "1", this.isFavorite = false]);
}