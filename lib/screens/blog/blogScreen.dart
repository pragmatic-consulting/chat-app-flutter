import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'blog.dart';
import 'favoriteWidget.dart';

class BlogScreen extends StatelessWidget {
  final Blog blog;

  const BlogScreen({Key? key, required this.blog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget infosSection = Container(
        padding: const EdgeInsets.only(right: 48, left: 48),
        child: Row(
          children: [
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text("Par: " + blog.author!,
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16,
                          fontWeight: FontWeight.bold))
                ])),
            FavoriteWidget(
                isFavorite: blog.isFavorite!,
                favoriteCount: blog.favoriteCount!)
          ],
        ));

    Widget buttonSection = Container(
        padding: const EdgeInsets.only(top: 24),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          _buildButtonColumn(
              Color.fromRGBO(226, 149, 120, 1.0), Icons.add_comment, "Comment"),
          _buildButtonColumn(
              Color.fromRGBO(226, 149, 120, 1.0), Icons.share, "Share")
        ]));

    Widget descriptionSection = Column(children: [
      Row(children: [
        Expanded(
            child: Container(
                padding: const EdgeInsets.only(
                    top: 32, bottom: 16, right: 32, left: 32),
                child: Text(blog.title!,
                    softWrap: true,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color.fromRGBO(0, 109, 119, 1.0),
                        fontFamily: 'Playfair'))))
      ]),
      Row(children: [
        Expanded(
            child: Container(
                padding: const EdgeInsets.all(28), child: Text(blog.content!)))
      ]),
    ]);

    Widget imageSection = Stack(children: [
      Container(
        width: double.infinity,
        height: 240,
        child: Center(child: CircularProgressIndicator()),
      ),
      Container(
          padding: const EdgeInsets.only(bottom: 12),
          child: Hero(
            tag: "imageBlog" + blog.title!, // unique
            child: CachedNetworkImage(
                imageUrl: blog.urlToImage!,
                errorWidget: (context, url, error) => Icon(Icons.error),
                width: double.infinity,
                height: 240,
                fit: BoxFit.cover),
          ))
    ]);

    return Scaffold(
        appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text("Article Details"),
            backgroundColor: Color.fromRGBO(0, 109, 119, 1.0)),
        body: ListView(
          children: [
            imageSection,
            infosSection,
            buttonSection,
            descriptionSection
          ],
        ));
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          padding: const EdgeInsets.only(bottom: 4),
          child: Icon(icon, color: color)),
      Text(label,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: color))
    ]);
  }
}
