import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo_blog/screens/read_premium_news.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../conscent_sdk/conscent_initializer.dart';
import '../news_response.dart';
import '../utils/constants.dart';

class Premium extends StatefulWidget {
  const Premium({super.key});

  @override
  State<Premium> createState() => _Premium();
}

class _Premium extends State<Premium> {
  @override
  Widget build(BuildContext context) {
    return generalNews();
  }
}

Widget generalNews() {
  var generalNews = Constants().getGeneralNews();
  return ListView.builder(
    itemCount: generalNews.articles?.length,
    itemBuilder: (context, index) {
      if (generalNews.articles != null) {
        return getView(context, generalNews.articles![index], index);
      }
      return const CircularProgressIndicator();
    },
  );
}

Widget getView(BuildContext context, Article article, int index) {
  var dateTimePublishedAt = DateFormat('yyyy-MM-ddTHH:mm:ssZ')
      .parse(article.publishedAt ?? "2023-07-05T21:17:22Z", true);
  var strPublishedAt =
      DateFormat('MMM dd, yyyy HH:mm').format(dateTimePublishedAt);
  String date = strPublishedAt;
  return InkWell(
    onTap: () {
      ConscentInitializer.setContentId("Client-Story-Id-$index");

      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ReadPremiumNews(article: article)),
        );
      }
    },
    child: Container(
      margin: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          getImage(context, article),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 8),
                  child: Text(
                    article.title ??
                        "OnePlustolaunchOnePlusNord3,otherdevicestoday;checkspecsandfeaturesnow-HTTech",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 8),
                        child: Text(
                          date,
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget getImage(BuildContext context, Article article) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.2,
    width: MediaQuery.of(context).size.width * 0.3,
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
