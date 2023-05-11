import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'model.dart';

class Category extends StatefulWidget {
  // const Category({Key? key}) : super(key: key);
  String About;

  Category({required this.About});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<NewsQueryModel> newsModelList = <NewsQueryModel>[];
  List<NewsQueryModel> newsModelListCarousel = <NewsQueryModel>[];
  bool isLoading = true;

  getNewsAbout(String about) async {
    String url = "";
    if (about == "Top News" || about == "Bangladesh") {
      url =
          "https://newsapi.org/v2/everything?q=bangladesh&from=2023-04-10&sortBy=publishedAt&apiKey=11a0a87575bf42d786e1b447b6c4ef5f";
    } else {
      url =
          "https://newsapi.org/v2/everything?q=$about&from=2023-04-11&sortBy=publishedAt&apiKey=11a0a87575bf42d786e1b447b6c4ef5f";
    }
    //All articles about $anything/about from the last month, sorted by recent first
    Response response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    setState(() {
      data["articles"].forEach((element) {
        NewsQueryModel newsQueryModel = new NewsQueryModel();
        newsQueryModel = NewsQueryModel.fromMap(element);
        newsModelList.add(newsQueryModel);
        setState(() {
          isLoading = false;
        });
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNewsAbout(widget.About);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News+"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(15, 25, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 1,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        widget.About.toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            letterSpacing: 9),
                      ),
                    ),
                  ],
                ),
              ),
              isLoading
                  ? Container(
                      height: MediaQuery.of(context).size.height - 600,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: newsModelList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              elevation: 1.0,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        newsModelList[index].newsImg,
                                        fit: BoxFit.fitHeight,
                                        width: double.infinity,
                                      )),
                                  Positioned(
                                      left: 0,
                                      right: 0,
                                      bottom: 0,
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              gradient: LinearGradient(
                                                  colors: [
                                                    Colors.black12
                                                        .withOpacity(0),
                                                    Colors.black
                                                  ],
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter)),
                                          padding: EdgeInsets.fromLTRB(
                                              15, 15, 10, 8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                newsModelList[index].newsHead,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                newsModelList[index]
                                                            .newsDes
                                                            .length >
                                                        50
                                                    ? "${newsModelList[index].newsDes.substring(0, 55)}...."
                                                    : newsModelList[index]
                                                        .newsDes,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12),
                                              )
                                            ],
                                          )))
                                ],
                              )),
                        );
                      }),
              // Container(
              //   padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       ElevatedButton(
              //           onPressed: () {}, child: Text("SHOW MORE")),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
