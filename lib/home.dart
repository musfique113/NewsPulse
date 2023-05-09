import 'main.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = new TextEditingController();
  List<String> navBarItem = [
    "Top News",
    "World",
    "Finanace",
    "Health",
    "Bangladesh"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NewsPlus"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              //Search Wala Container
              padding: EdgeInsets.symmetric(horizontal: 8),
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(24)),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if ((searchController.text).replaceAll(" ", "") == "") {
                        print("Blank search");
                      } else {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => Search(searchController.text)));
                      }
                    },
                    child: Container(
                      child: Icon(
                        Icons.search,
                        color: Colors.blueAccent,
                      ),
                      margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      textInputAction: TextInputAction.search,
                      onSubmitted: (value) {
                        print(value);
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Search Health"),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 50,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: navBarItem.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        print(navBarItem[index]);
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            navBarItem[index],
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  }),
            ),

            CarouselSlider(
              options: CarouselOptions(
                  height: 200, autoPlay: true, enlargeCenterPage: true),
              items: items.map((item) {
                return Builder(builder: (BuildContext context) {
                  return InkWell(
                    onTap: () {
                      print("MUJHE MARRO MAT");
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 14),
                      child: Text(item),
                    ),
                  );
                });
              }).toList(),
            ),

            // CarouselSlider(
            //   options: CarouselOptions(
            //       height: 200, autoPlay: true, enlargeCenterPage: true),
            //   items: items.map((item) {
            //     return Builder(builder: (BuildContext context) {
            //       return InkWell(
            //         onTap: () {
            //           print("carosol taped");
            //         },
            //         child: Container(
            //           margin: EdgeInsets.symmetric(horizontal: 5, vertical: 14),
            //           decoration: BoxDecoration(color: item),
            //         ),
            //       );
            //     });
            //   }).toList(),
            // ),

            Container(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13)),
                          elevation: 1.0,
                          child: Stack(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(13),
                                  child: Image.asset(
                                    "images/demonews.jpg",
                                  )),
                              Positioned(
                                  left: 0,
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(colors: [
                                        Colors.black54.withOpacity(0),
                                        Colors.black
                                      ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter

                                      ),
                                    ),
                                    padding: EdgeInsets.fromLTRB(10, 15, 10, 4),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "news headline",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25),
                                        ),

                                        Text("dfsdfsdgsg",style: TextStyle(color: Colors.white, fontSize: 10),)
                                      ],

                                    ),
                                  ))
                            ],
                          ),
                        ));
                  }),
            ),
          ],
        ),
      ),
    );
  }

  final List items = ["HELLO MAN", "test text", "Random text"];
//final List items = [Colors.yellowAccent, Colors.red, Colors.blue];
}
