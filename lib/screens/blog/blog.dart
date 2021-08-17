import 'dart:convert';

class Blog {
  String? author;
  String? title;
  String? urlToImage;
  String? content;
  bool? isFavorite;
  int? favoriteCount;

  Blog(this.author, this.title, this.content, this.urlToImage, this.isFavorite,
      this.favoriteCount);
}
