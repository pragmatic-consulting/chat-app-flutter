import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatapp/screens/blog/blogData.dart';
import 'package:chatapp/screens/blog/blogScreen.dart';
import 'package:flutter/material.dart';
import 'blog.dart';

class BlogListScreen extends StatelessWidget {
  List<Blog> _blogs = BlogData.blogs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: _blogs.length,
          itemBuilder: (context, index) {
            return BlogItemWidget(blog: _blogs[index]);
          }),
    );
  }
}

class BlogItemWidget extends StatelessWidget {
  final Blog? blog;

  const BlogItemWidget({Key? key, required this.blog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    BlogScreen(blog: blog!),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  animation =
                      CurvedAnimation(curve: Curves.ease, parent: animation);
                  return FadeTransition(opacity: animation, child: child);
                }));
      },
      child: Card(
        margin: EdgeInsets.all(4),
        elevation: 4,
        child: Row(
          children: [
            Hero(
              tag: "imageBlog" + blog!.title!, // unique
              child: CachedNetworkImage(
                  imageUrl: blog!.urlToImage!,
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: const EdgeInsets.only(
                          bottom: 12, left: 16, right: 16),
                      child: Text(blog!.title!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                              color: Color.fromRGBO(0, 109, 119, 1.0),
                              fontFamily: 'Playfair'))),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: const EdgeInsets.only(left: 16, bottom: 8),
                            child: Text(blog!.author!,
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 14)))
                      ])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
