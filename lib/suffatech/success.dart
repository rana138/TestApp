import 'package:flutter/material.dart';
import 'package:flutter_application_1/suffatech/home.dart';

class success extends StatefulWidget {
  String? id;
  success({super.key, required this.id});

  @override
  State<success> createState() => _successState();
}

class _successState extends State<success> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.3),
                    child: Image.asset(
                      "assets/images/success.png",
                      height: 100,
                      width: 100,
                      color: Color.fromARGB(255, 4, 70, 125),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  widget.id.toString() != null && widget.id.toString() != ''
                      ? Text(
                          "Registeration # 010" + widget.id.toString(),
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        )
                      : Text("We Are Thankful"),
                  widget.id.toString() != null && widget.id.toString() != ''
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 5),
                          child: Text(
                            "Please remember to take a screenshot and bring it with you when you visit the office.",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      : Container(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const suffa())));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          // color: const Color.fromARGB(255, 2, 34, 59),
                          color: Color.fromARGB(255, 4, 70, 125),
                        ),
                        child: const Center(
                          child: Text(
                            "Continue",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
