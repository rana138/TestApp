import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/suffatech/internship.dart';
import 'package:flutter_application_1/suffatech/mycourse.dart';
import 'package:flutter_application_1/suffatech/submit_form.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:material_dialogs/material_dialogs.dart';
import 'package:url_launcher/url_launcher.dart';
import 'about.dart';
import 'analytics.dart';
import 'contact.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'detail.dart';
import 'login.dart';

class suffa extends StatefulWidget {
  const suffa({super.key});

  @override
  State<suffa> createState() => _HomeState();
}

class _HomeState extends State<suffa> {
  bool isclicked = false;
  bool isclicked2 = false;
  List courses = [];
  List services = [];

  Future GetData() async {
    try {
      var res = await http.post(
        Uri.parse("https://suffatechofficial.com/suffatech-app/courses.php"),
      );
      if (res.statusCode == 200) {
        var red = json.decode(res.body);
        setState(() {
          courses.addAll(red);
        });
      }
    } catch (e) {
      print("sdf");
    }
  }

  openSite(String websiteUrl) async {
    if (await canLaunch(websiteUrl)) {
      await launch(websiteUrl);
      setState(() {
        isclicked = false;
      });
    } else {
      throw 'Could not launch $websiteUrl';
    }
  }

  Future getServices() async {
    try {
      var res = await http.post(
        Uri.parse("https://suffatechofficial.com/suffatech-app/services.php"),
      );

      if (res.statusCode == 200) {
        var red = json.decode(res.body);
        setState(() {
          services.addAll(red);
        });
      }
    } catch (e) {
      print("sdf");
    }
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  void initState() {
    GetData();
    getServices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 1,
        backgroundColor: Color(0xFF007ACC),
      ),
      backgroundColor: Color.fromARGB(255, 238, 237, 237),
      key: _key,
      drawer: MyDrawer(context),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                color: Color(0xFF007ACC),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _key.currentState!.openDrawer();
                      },
                      child: Image.asset(
                        "assets/images/menu.png",
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(2000),
                        child: Image.asset(
                          "assets/images/main_logo.jpeg",
                          width: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 140,
                decoration: BoxDecoration(
                    color: Color(0xFF007ACC),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Welcome",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 32,
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Enhance Your Skill in The Development!",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 16,
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -50,
                      right: MediaQuery.of(context).size.width * 0.02,
                      left: MediaQuery.of(context).size.width * 0.02,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 115,
                          width: MediaQuery.of(context).size.width * 0.7,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: <Color>[
                                Color.fromARGB(255, 243, 243, 243),
                                Color.fromARGB(255, 255, 255, 255)
                              ],
                            ),

                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 225, 225, 225),
                                blurRadius: 32.0,
                                offset: Offset(5, 4),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(20), //18
                          ),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                  width: MediaQuery.of(context)
                                      .size
                                      .width, // Adjust the width as needed
                                  height: 180, // Adjust the height as needed
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        top: 30,
                                        left: 10,
                                        child: Text(
                                          "My",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Positioned(
                                        top: 50,
                                        left: 15,
                                        child: Text(
                                          "Progress",
                                          style: TextStyle(
                                              fontSize: 28,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Positioned(
                                        top: 85,
                                        left: 60,
                                        child: Text(
                                          "Report",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Positioned(
                                          right: 70,
                                          bottom: 20,
                                          child: Image.asset(
                                              "assets/images/chr2.png",
                                              height: 80))
                                    ],
                                  )),
                              Positioned(
                                  top: -80,
                                  left: 50,
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10000),
                                        color:
                                            Color.fromARGB(58, 12, 43, 6855)),
                                  )),
                              Positioned(
                                  top: -70,
                                  left: 60,
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10000),
                                        color:
                                            Color.fromARGB(48, 255, 255, 255)),
                                  )),
                              Positioned(
                                bottom: 40,
                                right: 10,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Analytics()));
                                  },
                                  child: Container(
                                    height: 45,
                                    width: 45,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(200),
                                      ),
                                      color: Colors.blue,
                                    ),
                                    child: const Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "All Courses",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 0),
                padding: const EdgeInsets.only(
                  top: 0,
                  bottom: 15,
                ),
                child: courses.isNotEmpty
                    ? ListView.builder(
                        itemCount: courses.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Detail(
                                    name: courses[index]['title'].toString(),
                                    id: courses[index]['id'].toString(),
                                    colr: index,
                                  ),
                                ),
                              );
                            },
                            child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Container(
                                  width: 130.0, // Set your desired item width

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15), //
                                    color: Color.fromARGB(204, 155, 39, 176),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 15,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(70),
                                        topRight: Radius.circular(15),
                                        topLeft: Radius.circular(15),
                                      ),
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 90,
                                          height: 90,
                                          padding: EdgeInsets.only(left: 5),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(200),
                                              color: Colors.purple),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(111120),
                                            child: Image.network(
                                              courses[index]['image'],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          courses[index]['title'],
                                          textAlign: TextAlign.center,
                                          softWrap: true,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          );
                        },
                      )
                    : Container(
                        color: Colors.white,
                        height: 150,
                        padding: EdgeInsets.symmetric(vertical: 20),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              child: Center(
                                child: LoadingIndicator(
                                  indicatorType: Indicator.ballClipRotate,
                                  colors: [Color.fromARGB(201, 33, 149, 243)],
                                  backgroundColor:
                                      Color.fromARGB(0, 252, 252, 252),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Text("Loading Data..")
                          ],
                        ),
                      ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isclicked = true;
                  });
                  openSite('https://www.suffatechofficial.com');
                },
                child: Container(
                  height: 40,
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text("Visit Our Website "),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                              color: Colors.blue,
                              width: 2.0, // Underline thickness
                            ))),
                            child: Text(
                              "Click",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                'For Courses',
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple),
                                speed: const Duration(milliseconds: 100),
                              ),
                              TypewriterAnimatedText(
                                'For Services',
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                                speed: const Duration(milliseconds: 100),
                              ),
                              TypewriterAnimatedText(
                                'For Development',
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                speed: const Duration(milliseconds: 100),
                              ),
                            ],
                            totalRepeatCount: 10000,
                            isRepeatingAnimation: true,
                            pause: const Duration(milliseconds: 0),
                            displayFullTextOnTap: true,
                            stopPauseOnTap: true,
                          ),
                        ],
                      ),
                      isclicked == true
                          ? Container(
                              height: 25,
                              child: Center(
                                child: LoadingIndicator(
                                  indicatorType: Indicator.ballClipRotate,
                                  colors: [Color.fromARGB(201, 33, 149, 243)],
                                  backgroundColor:
                                      Color.fromARGB(0, 252, 252, 252),
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 0),
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Academic Classes",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            services.isNotEmpty
                                ? ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: services.length,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                        onTap: () {
                                          services[index]['title'] != null
                                              ? Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: ((context) =>
                                                          SubmitForm(
                                                              id: services[
                                                                      index]
                                                                  ['id']))))
                                              : null;
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              left: 20, bottom: 10),
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 40,
                                                        vertical: 10),
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 30,
                                                        vertical: 5),
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 211, 235, 255),
                                                      spreadRadius: 1,
                                                      blurRadius: 10,
                                                      offset:
                                                          const Offset(2, 2),
                                                    ),
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  gradient: LinearGradient(
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                    colors: <Color>[
                                                      Colors.white,
                                                      Color.fromARGB(
                                                          255, 208, 232, 252),
                                                      Color.fromARGB(
                                                          255, 222, 240, 255),
                                                      Colors.white,
                                                    ],
                                                  ),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(height: 5),
                                                    Text(
                                                      services[index]['title'],
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    const SizedBox(height: 5),
                                                    Text(
                                                      services[index]
                                                          ['description'],
                                                      maxLines: 2,
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Positioned(
                                                top: 6,
                                                child: CircularPercentIndicator(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  radius: 30.0,
                                                  lineWidth: 3.0,
                                                  percent: 1,
                                                  // int.parse(
                                                  //         services[index]['id']
                                                  //             .toString()) /
                                                  //     3,
                                                  center: Container(
                                                    height: 50,
                                                    width: 50,
                                                    decoration: BoxDecoration(
                                                        color: Color.fromARGB(
                                                            153, 155, 39, 176),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(200)),
                                                    child: Center(
                                                        child: Icon(
                                                            Icons
                                                                .menu_book_sharp,
                                                            size: 25,
                                                            color:
                                                                Colors.white)),
                                                  ),
                                                  progressColor: Color.fromARGB(
                                                      118, 155, 39, 176),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                : Container(
                                    color: Colors.white,
                                    height: 150,
                                    padding: EdgeInsets.symmetric(vertical: 20),
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 60,
                                          child: Center(
                                            child: LoadingIndicator(
                                              indicatorType:
                                                  Indicator.ballClipRotate,
                                              colors: [
                                                Color.fromARGB(
                                                    201, 33, 149, 243)
                                              ],
                                              backgroundColor: Color.fromARGB(
                                                  0, 252, 252, 252),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Text("Loading Data..")
                                      ],
                                    ),
                                  ),
                          ],
                        ),
                      ))
                ],
              ),
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: const [
              //       Text(
              //         "Our Services",
              //         style: TextStyle(
              //             color: Colors.black,
              //             fontSize: 16,
              //             fontWeight: FontWeight.w600),
              //       ),
              //     ],
              //   ),
              // ),
              // Container(
              //   height: 235,
              //   margin: EdgeInsets.only(bottom: 20),
              //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              //   child: services.isNotEmpty
              //       ? ListView.builder(
              //           itemCount: services.length,
              //           scrollDirection: Axis.horizontal,
              //           itemBuilder: (BuildContext context, int index) {
              //             return Container(
              //               padding: EdgeInsets.symmetric(
              //                   horizontal: 10, vertical: 15),
              //               margin: EdgeInsets.symmetric(
              //                   horizontal: 10, vertical: 5),
              //               width: 180,
              //               decoration: BoxDecoration(
              //                 color: Colors.white,
              //                 boxShadow: [
              //                   BoxShadow(
              //                     color: Color.fromARGB(255, 144, 144, 144)
              //                         .withOpacity(0.2),
              //                     spreadRadius: 1,
              //                     blurRadius: 10,
              //                     offset: const Offset(
              //                         2, 2), // horizontal, vertical offset
              //                   ),
              //                 ],
              //                 borderRadius: BorderRadius.circular(10),
              //               ),
              //               child: Container(
              //                 decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(10),
              //                 ),
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     Text(
              //                       int.parse(services[index]['id']) < 9
              //                           ? '0' + services[index]['id']
              //                           : services[index]['id'],
              //                       style: const TextStyle(
              //                           fontSize: 20,
              //                           fontWeight: FontWeight.w500,
              //                           color: Color.fromARGB(255, 0, 0, 0)),
              //                     ),
              //                     const SizedBox(
              //                       height: 10,
              //                     ),
              //                     Text(
              //                       services[index]['title'],
              //                       style: const TextStyle(
              //                         color: Color.fromARGB(255, 0, 0, 0),
              //                         fontSize: 14,
              //                         fontWeight: FontWeight.w500,
              //                       ),
              //                     ),
              //                     const SizedBox(
              //                       height: 20,
              //                     ),
              //                     Text(
              //                       services[index]['s_dec'],
              //                       maxLines: 2,
              //                       style: const TextStyle(
              //                         color: Color.fromARGB(255, 0, 0, 0),
              //                         fontSize: 12,
              //                         fontWeight: FontWeight.w500,
              //                       ),
              //                     ),
              //                     const SizedBox(
              //                       height: 20,
              //                     ),
              //                     Align(
              //                       alignment: Alignment.topRight,
              //                       child: GestureDetector(
              //                           onTap: () {
              //                             Navigator.push(
              //                                 context,
              //                                 MaterialPageRoute(
              //                                     builder: (context) =>
              //                                         const ViewMore()));
              //                           },
              //                           child: Container(
              //                             height: 40,
              //                             width: 40,
              //                             decoration: BoxDecoration(
              //                                 borderRadius:
              //                                     BorderRadius.circular(2000),
              //                                 color: Colors.blue),
              //                             child: Icon(
              //                               Icons.arrow_forward,
              //                               color: Colors.white,
              //                             ),
              //                           )),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             );
              //           })
              //       : Container(
              //           height: 50,
              //           padding: EdgeInsets.symmetric(vertical: 20),
              //           width: MediaQuery.of(context).size.width,
              //           child: Center(
              //             child: LoadingIndicator(
              //               indicatorType: Indicator.ballScaleMultiple,
              //               colors: [Colors.white],
              //               backgroundColor: Color.fromARGB(0, 252, 252, 252),
              //             ),
              //           ),
              //         ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Drawer MyDrawer(BuildContext context) {
    return Drawer(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        child: Stack(
          children: [
            Image.asset(
              "assets/images/bg.jpg",
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            ListView(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(34, 4, 142, 255)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 10, bottom: 20),
                            height: 70,
                            width: 70,
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(1000)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(2000),
                              child: Image.asset(
                                "assets/images/main_logo.jpeg",
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              margin:
                                  const EdgeInsets.only(left: 60, bottom: 50),
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 225, 225, 225),
                                    blurRadius: 32.0,
                                    offset: Offset(5, 4),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.purple,
                              ),
                            ),
                          )
                        ],
                      ),
                      const Text(
                        "Suffa Tech",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                      const Text(
                        "IT Solution Company",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  color: const Color.fromARGB(31, 255, 255, 255),
                  child: ListTile(
                      leading: const Icon(
                        Icons.business,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      title: const Text(
                        'About Company',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => about()));
                      }),
                ),
                const Divider(
                  color: Color.fromARGB(148, 255, 255, 255),
                  height: 2,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  color: const Color.fromARGB(31, 255, 255, 255),
                  child: ListTile(
                      leading: const Icon(
                        Icons.payment,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      title: const Text(
                        'Apply For Internship',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const internship()));
                      }),
                ),
                const Divider(
                  color: Color.fromARGB(148, 255, 255, 255),
                  height: 2,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  color: const Color.fromARGB(31, 255, 255, 255),
                  child: ListTile(
                      leading: const Icon(
                        Icons.laptop,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      title: const Text(
                        'My Course',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const mycourse()));
                      }),
                ),
                const Divider(
                  color: Color.fromARGB(148, 255, 255, 255),
                  height: 2,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  color: const Color.fromARGB(31, 255, 255, 255),
                  child: ListTile(
                      leading: const Icon(
                        Icons.contact_page,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      title: const Text(
                        'Contact Us',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Contact()));
                      }),
                ),
                const Divider(
                  color: Color.fromARGB(148, 255, 255, 255),
                  height: 2,
                ),
                GestureDetector(
                  onTap: () {
                    Dialogs.materialDialog(
                        msg:
                            'Are you sure? you want to delete your account here.',
                        title: "DELETE!",
                        color: Colors.white,
                        context: context,
                        actions: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 7),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.black)),
                              child: const Center(
                                child: Text(
                                  "I don't",
                                  style: TextStyle(
                                      color: Colors.purple,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isclicked2 = true;
                              });
                              openSite(
                                  'https://www.suffatechcenter.com/delete-account.php');
                            },
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black),
                                child: Text(
                                  "Yes",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                )),
                          )
                        ]);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    color: const Color.fromARGB(31, 255, 255, 255),
                    child: ListTile(
                      leading: const Icon(
                        Icons.delete_forever,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      title: const Text(
                        'Delete Account',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),
                ),
                const Divider(
                  color: Color.fromARGB(148, 255, 255, 255),
                  height: 2,
                ),
                GestureDetector(
                  onTap: () {
                    Dialogs.materialDialog(
                        msg: 'Are you sure? you want to delete your data here.',
                        title: "DELETE!",
                        color: Colors.white,
                        context: context,
                        actions: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 7),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.black)),
                              child: const Center(
                                child: Text(
                                  "I don't",
                                  style: TextStyle(
                                      color: Colors.purple,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isclicked2 = true;
                              });
                              openSite(
                                  'https://www.suffatechcenter.com/delete-data.php');
                            },
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black),
                                child: Text(
                                  "Yes",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                )),
                          )
                        ]);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    color: const Color.fromARGB(31, 255, 255, 255),
                    child: ListTile(
                      leading: const Icon(
                        Icons.delete_forever,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      title: const Text(
                        'Delete Data',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    Dialogs.materialDialog(
                        msg:
                            'Are you sure? you want to logout your account here.',
                        title: "LOGOUT!",
                        color: Colors.white,
                        context: context,
                        actions: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 7),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.black)),
                              child: const Center(
                                child: Text(
                                  "I don't",
                                  style: TextStyle(
                                      color: Colors.purple,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => login()),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black),
                              child: const Center(
                                child: Text(
                                  "Yes",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          )
                        ]);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    color: const Color.fromARGB(31, 255, 255, 255),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "LOGOUT",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.logout,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
