import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../news_response.dart';

class ReadNews extends StatefulWidget {
  final Article article;

  const ReadNews({Key? key, required this.article}) : super(key: key);

  @override
  State<ReadNews> createState() => _ReadNews();
}

class _ReadNews extends State<ReadNews> {
  var showContent = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        automaticallyImplyLeading: true,
        title: const Text(
          "News App",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              getImage(context, widget.article),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                child: Text(
                  "${widget.article.title}",
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                child: description(context, widget.article),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget getImage(BuildContext context, Article article) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.25,
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
    decoration: const BoxDecoration(),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: CachedNetworkImage(
        fit: BoxFit.fill,
        imageUrl: article.urlToImage ??
            "https://www.digitalmesh.com/blog/wp-content/uploads/2020/05/404-error.jpg",
        progressIndicatorBuilder: (context, url, downloadProgress) => Container(
          margin: const EdgeInsetsDirectional.fromSTEB(40, 40, 40, 40),
          child: CircularProgressIndicator(
              value: downloadProgress.progress, color: Colors.blueAccent),
        ),
      ),
    ),
  );
}

Widget description(BuildContext context, Article article) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        child: Text(
          "${article.description}",
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.normal, color: Colors.black),
        ),
      ),
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
        child: Text(
          "${article.content}",
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),
        ),
      ),
    ],
  );
}
