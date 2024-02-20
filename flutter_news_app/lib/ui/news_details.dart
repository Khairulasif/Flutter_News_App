import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/model/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatefulWidget {
  final NewsModel newsModel;
  const NewsDetails({super.key, required this.newsModel});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  // late final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          title: Text(
            widget.newsModel.title.toString(),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CachedNetworkImage(
              height: 250,
              // width: double.infinity,
              fit: BoxFit.fitWidth,
              imageUrl: widget.newsModel.urlToImage.toString(),
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => Icon(
                Icons.error,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.all(6),
                  child: Text(
                    widget.newsModel.source!.name.toString(),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  widget.newsModel.publishedAt.toString(),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              widget.newsModel.author == null
                  ? ""
                  : "Written by: " + widget.newsModel.author.toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              widget.newsModel.title.toString(),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              widget.newsModel.description.toString(),
            ),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () async {
                final Uri uri = Uri.parse(
                  widget.newsModel.url.toString(),
                );
                if (!await launchUrl(uri)) {
                  throw Exception("Could not Launch");
                }
              },
              child: Text("Read More..."),
            ),
          ],
        ),
      ),
    );
  }
}
