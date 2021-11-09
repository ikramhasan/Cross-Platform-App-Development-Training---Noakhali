import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api_response.dart';
import 'package:news_app/fetch_news.dart';
import 'package:news_app/search_page.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({
    Key? key,
    this.query = 'Bangladesh',
  }) : super(key: key);

  final String query;

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  String query = 'Bangladesh';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
        centerTitle: true,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 32),
        child: SearchBarAnimation(
          isSearchBoxOnRightSide: true,
          textEditingController: TextEditingController(),
          isOriginalAnimation: false,
          buttonBorderColour: Colors.black45,
          buttonIcon: Icons.search,
          onFieldSubmitted: (String value) {
            setState(() {
              query = value;
            });
          },
        ),
      ),
      body: FutureBuilder<ApiResponse>(
        future: fetchNews(query),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.articles.length,
              itemBuilder: (context, index) {
                final article = snapshot.data!.articles[index];
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: InkWell(
                    onTap: () async {
                      final url = article.url;
                      await canLaunch(url)
                          ? await launch(url)
                          : throw 'Could not launch $url';
                      //sendMail();
                    },
                    child: Card(
                      child: Column(
                        children: [
                          Image.network(
                            article.urlToImage ??
                                'https://images.unsplash.com/photo-1495020689067-958852a7765e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=869&q=80',
                          ),
                          SizedBox(height: 8),
                          Text(
                            article.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            article.description,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
