// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:flutter_banglore_test/ui/home_controller.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List calenderData = [
    "Mo\n10",
    "Tu\n11",
    "We\n12",
    "Th\n13",
    "Fr\n14",
    "Sa\n15",
    "Su\n16"
  ];
  var x = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Omkar'),
        // ),
        body: _body());
  }

  _body() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: GetBuilder<HomeController>(builder: (k) {
            return k.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          //  crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_back)),
                            ),
                            Expanded(
                                child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.only(right: 10.0),
                                    child: Text(
                                      "Your Feelings History",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ))),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        _percentWidget(k.model.value),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 1,
                          color: Colors.black12,
                          width: MediaQuery.of(context).size.width,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black26,
                                      borderRadius: BorderRadius.circular(4.0)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text("Mo"),
                                        Text("10"),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Container(
                                child: Column(
                                  children: [
                                    Text("Tu"),
                                    Text("11"),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                child: Column(
                                  children: [
                                    Text("We"),
                                    Text("12"),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                child: Column(
                                  children: [
                                    Text("Th"),
                                    Text("13"),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                child: Column(
                                  children: [
                                    Text("Fr"),
                                    Text("14"),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                child: Column(
                                  children: [
                                    Text("Sa"),
                                    Text("15"),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                child: Column(
                                  children: [
                                    Text("Su"),
                                    Text("16"),
                                  ],
                                ),
                              )

                              // Expanded(
                              //   // height: 100,
                              //   child: Container(
                              //     height: 100,
                              //     child: ListView.builder(
                              //         shrinkWrap: true,
                              //         scrollDirection: Axis.horizontal,
                              //         itemCount: calenderData.length,
                              //         itemBuilder: (context, i) {
                              //           return Padding(
                              //             padding: const EdgeInsets.all(8.0),
                              //             child: Center(
                              //                 child: Center(
                              //                     child: Text(calenderData[i]))),
                              //           );
                              //         }),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 1,
                          color: Colors.black12,
                          width: MediaQuery.of(context).size.width,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        timeFeelingWidget(),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 1,
                          color: Colors.black12,
                          width: MediaQuery.of(context).size.width,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 10),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            k.video.value.title.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(k.video.value.description.toString()),
                        ),
                        Container(
                          height: 150,
                          //   width: 200,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 2,
                              itemBuilder: (context, i) {
                                return InkWell(
                                  onTap: () async {
                                    launchUrlll(Uri.parse(
                                        k.video.value.youtubeUrl.toString()));
                                  },
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Positioned(
                                          top: 50,
                                          child: Center(
                                              child: IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.play_arrow),
                                          ))),
                                      Container(
                                        margin: EdgeInsets.all(10),
                                        height: 150,
                                        width: 200,
                                        decoration: BoxDecoration(
                                            color: Colors.black12,
                                            borderRadius:
                                                BorderRadius.circular(25.0)),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  );
          }),
        ),
      ),
    );
  }

//Percentage Feeling Widget
  _percentWidget(k) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CircleAvatar(
                      radius: 25, //widget.radius + widget.border,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: CircleAvatar(
                          radius: 35, //widget.radius.toDouble(),
                          backgroundColor: Colors.green,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image(
                              image: AssetImage("assets/icons/eneg.png"),
                            ),
                            //  Image(
                            //     image: AssetImage(
                            //         'assets/icons/Sad.svg'))
                          ))),
                  Positioned(
                      //top: 10,
                      //bottom: -3,
                      child: Container(
                    height: 100,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(25.0)),
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 30),
                        child: Center(child: Text(k.sad.toString() + "%"))),
                  )),
                ],
              ),
              Text("Energetic")
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CircleAvatar(
                      radius: 25, //widget.radius + widget.border,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: CircleAvatar(
                          radius: 35, //widget.radius.toDouble(),
                          backgroundColor: Colors.green,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image(
                              image: AssetImage("assets/icons/sad.png"),
                            ),
                            //  Image(
                            //     image: AssetImage(
                            //         'assets/icons/Sad.svg'))
                          ))),
                  Positioned(
                      //top: 10,
                      //bottom: -3,
                      child: Container(
                    height: 100,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(25.0)),
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 30),
                        child: Center(child: Text(k.sad.toString() + "%"))),
                  )),
                ],
              ),
              Text("Sad")
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CircleAvatar(
                      radius: 25, //widget.radius + widget.border,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: CircleAvatar(
                          radius: 35, //widget.radius.toDouble(),
                          backgroundColor: Colors.green,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image(
                              image: AssetImage("assets/icons/happy.png"),
                            ),
                            //  Image(
                            //     image: AssetImage(
                            //         'assets/icons/Sad.svg'))
                          ))),
                  Positioned(
                      //top: 10,
                      //bottom: -3,
                      child: Container(
                    height: 100,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(25.0)),
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 30),
                        child: Center(child: Text(k.sad.toString() + "%"))),
                  )),
                ],
              ),
              Text("Happy")
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CircleAvatar(
                      radius: 25, //widget.radius + widget.border,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: CircleAvatar(
                          radius: 35, //widget.radius.toDouble(),
                          backgroundColor: Colors.green,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image(
                              image: AssetImage("assets/icons/angry.png"),
                            ),
                            //  Image(
                            //     image: AssetImage(
                            //         'assets/icons/Sad.svg'))
                          ))),
                  Positioned(
                      //top: 10,
                      //bottom: -3,
                      child: Container(
                    height: 100,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(25.0)),
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 30),
                        child: Center(child: Text(k.sad.toString() + "%"))),
                  )),
                ],
              ),
              Text("Angry")
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CircleAvatar(
                      radius: 25, //widget.radius + widget.border,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: CircleAvatar(
                          radius: 35, //widget.radius.toDouble(),
                          backgroundColor: Colors.green,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image(
                              image: AssetImage("assets/icons/calm.png"),
                            ),
                            //  Image(
                            //     image: AssetImage(
                            //         'assets/icons/Sad.svg'))
                          ))),
                  Positioned(
                      //top: 10,
                      //bottom: -3,
                      child: Container(
                    height: 100,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(25.0)),
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 30),
                        child: Center(child: Text(k.sad.toString() + "%"))),
                  )),
                ],
              ),
              Text("Calm")
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CircleAvatar(
                      radius: 25, //widget.radius + widget.border,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: CircleAvatar(
                          radius: 35, //widget.radius.toDouble(),
                          backgroundColor: Colors.green,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image(
                              image: AssetImage("assets/icons/ored.png"),
                            ),
                            //  Image(
                            //     image: AssetImage(
                            //         'assets/icons/Sad.svg'))
                          ))),
                  Positioned(
                      //top: 10,
                      //bottom: -3,
                      child: Container(
                    height: 100,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(25.0)),
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 30),
                        child: Center(child: Text(k.sad.toString() + "%"))),
                  )),
                ],
              ),
              Text("Bored")
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CircleAvatar(
                      radius: 25, //widget.radius + widget.border,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: CircleAvatar(
                          radius: 35, //widget.radius.toDouble(),
                          backgroundColor: Colors.green,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image(
                              image: AssetImage("assets/icons/love.png"),
                            ),
                            //  Image(
                            //     image: AssetImage(
                            //         'assets/icons/Sad.svg'))
                          ))),
                  Positioned(
                      //top: 10,
                      //bottom: -3,
                      child: Container(
                    height: 100,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(25.0)),
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 30),
                        child: Center(child: Text(k.sad.toString() + "%"))),
                  )),
                ],
              ),
              Text("Love")
            ],
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

//Time Wise Feeling
  timeFeelingWidget() {
    return Center(
      child: Row(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "9 AM - 12 PM",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "1 PM - 4 PM",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "4 PM - 6 PM",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image(
                        image: AssetImage("assets/icons/love.png"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Love",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image(
                        image: AssetImage("assets/icons/angry.png"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Angry",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image(
                        image: AssetImage("assets/icons/angry.png"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Angry",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void launchUrlll(url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
