import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_api/src/config/ktext.dart';
import 'package:news_api/src/controller/newsController.dart';
import 'package:news_api/src/models/article.dart';

class NewsPageCard extends StatefulWidget {
  @override
  State<NewsPageCard> createState() => _NewsPageCardState();
}

class _NewsPageCardState extends State<NewsPageCard> {
  final newsC = Get.put(NewsController(), permanent: true);
  // api calling
  List<News> newsList = [];
  getNews() async {
    newsList = await newsC.getNews();
    setState(() {});
  }

  @override
  void initState() {
    getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (BuildContext context, int index) {
          News news = newsList[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 203,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color(0xff707070),
                    width: 1,
                  ),
                  image: DecorationImage(
                      image: NetworkImage(news.urlToImage.toString()),
                      fit: BoxFit.fill),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: Colors.black.withOpacity(0.33),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Center(
                          child: KText(
                            text: news.title.toString(),
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            maxLines: 3,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              KText(
                text: news.publishedAt.toString(),
                fontSize: 13,
                color: Colors.black54,
              ),
              SizedBox(
                height: 7,
              ),
              KText(
                text: news.description.toString(),
                color: Colors.black,
                fontSize: 23,
                fontWeight: FontWeight.bold,
                maxLines: 5,
              ),
            ],
          );
        },
        padding: EdgeInsets.symmetric(horizontal: 25),
      ),
    );
  }
}
