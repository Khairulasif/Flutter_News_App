import 'package:flutter/material.dart';
import 'package:flutter_news_app/ui/all_news.dart';
import 'package:flutter_news_app/ui/breaking_news.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Flutter News App",
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          bottom: TabBar(tabs: [
            Tab(
              text: "Breaking News",
            ),
            Tab(
              text: "All News",
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            BreakingNews(),
            AllNews(),
          ],
        ),
      ),
    );
  }
}
