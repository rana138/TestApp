import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:loading_indicator/loading_indicator.dart';
import 'submit_form.dart';

class Detail extends StatefulWidget {
  final String name;
  final String id;
  int colr;

  Detail({super.key, required this.name, required this.id, required this.colr});
  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  List c_desc = [];
  List<Color> colrs = [
    Color.fromARGB(255, 6, 50, 84),
    Color.fromARGB(255, 103, 237, 255),
    Color.fromARGB(255, 255, 174, 120),
    Color.fromARGB(255, 255, 96, 96),
    Color.fromARGB(255, 126, 255, 94),
    Color.fromARGB(255, 110, 88, 255),
  ];

  Future GetData() async {
    try {
      var res = await http.post(
          Uri.parse("https://suffatechofficial.com/suffatech-app/get_desc.php"),
          body: {
            "c_id": widget.id,
          });

      if (res.statusCode == 200) {
        var red = json.decode(res.body);
        setState(() {
          c_desc.addAll(red);
        });
        print(c_desc[0]['title']);
      }
    } catch (e) {
      print(e.toString() + "       ////");
    }
  }

  Color getColorFromIndex() {
    return colrs[widget.colr];
  }

  @override
  void initState() {
    GetData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color selectedColor = const Color.fromARGB(255, 4, 70, 125);
    return Scaffold(
      body: SingleChildScrollView(
        child: c_desc.length > 0
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 205,
                    padding: const EdgeInsets.only(top: 25),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      color: selectedColor,
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                            top: 20,
                            left: 80,
                            child: Text(
                              widget.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 22,
                                  color: Colors.white),
                            )),
                        Positioned(
                            bottom: -80,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                width: MediaQuery.of(context).size.width - 40,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 7),
                                height: 170,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: const Offset(
                                          0, 3), // horizontal, vertical offset
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.40,
                                          height: 73,
                                          decoration: const BoxDecoration(
                                              color: Colors.transparent,
                                              border: Border(
                                                right: BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 231, 230, 230),
                                                  width: 1.0,
                                                ),
                                              )),
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 73,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: const BoxDecoration(
                                                    color: Colors.transparent,
                                                    border: Border(
                                                      bottom: BorderSide(
                                                        color: Color.fromARGB(
                                                            255, 231, 230, 230),
                                                        width: 1.0,
                                                      ),
                                                    )),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    c_desc[0]['duration']
                                                            .toString()
                                                            .isNotEmpty
                                                        ? Text(
                                                            c_desc[0]
                                                                ['duration'],
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                color:
                                                                    selectedColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          )
                                                        : Text(''),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    const Text(
                                                      "Duration",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Color.fromARGB(
                                                              255, 2, 36, 63),
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.40,
                                          height: 73,
                                          decoration: const BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 73,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: const BoxDecoration(
                                                    color: Colors.transparent,
                                                    border: Border(
                                                      bottom: BorderSide(
                                                        color: Color.fromARGB(
                                                            255, 231, 230, 230),
                                                        width: 1.0,
                                                      ),
                                                    )),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    c_desc[0]['price']
                                                            .toString()
                                                            .isNotEmpty
                                                        ? Text(
                                                            c_desc[0]['price'],
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                color:
                                                                    selectedColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          )
                                                        : Text(''),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    const Text(
                                                      "Course Fee",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Color.fromARGB(
                                                              255, 2, 36, 63),
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.40,
                                          height: 73,
                                          decoration: const BoxDecoration(
                                              color: Colors.transparent,
                                              border: Border(
                                                right: BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 231, 230, 230),
                                                  width: 1.0,
                                                ),
                                              )),
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 73,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: const BoxDecoration(
                                                  color: Colors.transparent,
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    c_desc[0]['Level']
                                                            .toString()
                                                            .isNotEmpty
                                                        ? Text(
                                                            c_desc[0]['Level'],
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                color:
                                                                    selectedColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          )
                                                        : Text(''),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    const Text(
                                                      "Skill Level",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Color.fromARGB(
                                                              255, 2, 36, 63),
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.40,
                                          height: 73,
                                          decoration: const BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 73,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: const BoxDecoration(
                                                  color: Colors.transparent,
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    c_desc[0]['internship']
                                                            .toString()
                                                            .isNotEmpty
                                                        ? Text(
                                                            c_desc[0]
                                                                ['internship'],
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                color:
                                                                    selectedColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          )
                                                        : Text(''),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    const Text(
                                                      "Internship",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Color.fromARGB(
                                                              255, 2, 36, 63),
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )),
                        Positioned(
                          left: -10,
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3330),
                              color: const Color.fromARGB(22, 255, 255, 255),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 1,
                          top: 1,
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3330),
                              color: const Color.fromARGB(18, 255, 255, 255),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 13,
                          top: 15,
                          child: Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      color: const Color.fromARGB(255, 0, 0, 0)
                                          .withAlpha(217),
                                      size: 30,
                                    ),
                                  ),
                                ),
                              )),
                        ),
                        Positioned(
                          right: -21,
                          bottom: 1,
                          child: Container(
                            height: 160,
                            width: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3330),
                              color: const Color.fromARGB(13, 255, 255, 255),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 85,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25, top: 20, bottom: 20, right: 25),
                    child: c_desc.isNotEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Description',
                                      textAlign: TextAlign.justify,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Arial'),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    c_desc[0]['description']
                                            .toString()
                                            .isNotEmpty
                                        ? Text(
                                            c_desc[0]['description'],
                                            textAlign: TextAlign.justify,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'Arial'),
                                          )
                                        : Text(""),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Languages',
                                      textAlign: TextAlign.justify,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Arial'),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    c_desc[0]['language'].toString().isNotEmpty
                                        ? Text(
                                            c_desc[0]['language'],
                                            textAlign: TextAlign.justify,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'Arial'),
                                          )
                                        : Text(''),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : Container(
                            height: 60,
                            child: Center(
                              child: LoadingIndicator(
                                indicatorType: Indicator.ballClipRotate,
                                colors: [Color.fromARGB(201, 33, 149, 243)],
                                backgroundColor:
                                    Color.fromARGB(0, 252, 252, 252),
                              ),
                            )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      c_desc[0]['id'] != null
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      SubmitForm(id: c_desc[0]['id']))))
                          : null;
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 4, 70, 125)),
                      child: const Center(
                        child: Text(
                          "Enroll Now",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  )
                ],
              )
            : Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Text("Loading"),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
