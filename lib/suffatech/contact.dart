import 'package:flutter/material.dart';
import 'package:flutter_application_1/suffatech/success.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController message = TextEditingController();
  final MaskTextInputFormatter _phnoFormatter = MaskTextInputFormatter(
      mask: '####-#######', filter: {"#": RegExp(r'[0-9]')});

  Future Validate() async {
    if (name.text.isEmpty) {
      ErrorMessage("Enter Your Name", 1);
    } else if (number.text.isEmpty) {
      ErrorMessage("Enter Your Phone Number", 1);
    } else if (message.text.isEmpty) {
      ErrorMessage("Enter Your Concern", 1);
    } else {
      var res = await http.post(
          Uri.parse("https://suffatechofficial.com/suffatech-app/contact.php"),
          body: {
            "user_name": name.text,
            "user_phon": number.text,
            "mess": message.text,
          });

      var response = jsonDecode(res.body);
      if (response["Success"].toString() == 'true') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => success(id: null)),
        );
      } else {
        print("failed");
      }
    }
  }

  ErrorMessage(String s, int c) {
    return c == 0
        ? showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.success(
              message: s,
            ),
          )
        : showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.error(
              message: s,
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 238, 234, 233),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 225,
                padding: const EdgeInsets.only(top: 35),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: Color.fromARGB(255, 4, 70, 125),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Positioned(
                        top: 20,
                        left: 80,
                        child: Text(
                          "Get in Touch",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                              color: Colors.white),
                        )),
                    const Positioned(
                        top: 52,
                        left: 80,
                        child: Text(
                          "with our 24/7 srvices any time",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        )),
                    Positioned(
                        bottom: 10,
                        right: 15,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 90,
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
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 14,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  const Icon(
                                    Icons.smartphone,
                                    color: Color.fromARGB(255, 2, 36, 63),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    "0301-0910111 \n0310-7073258",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: Color.fromARGB(255, 2, 36, 63),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Flexible(
                                        child: Text(
                                      "House No.68 H block Shadman Town Sahiwal",
                                      overflow: TextOverflow
                                          .ellipsis, // Handles overflow gracefully
                                      maxLines:
                                          2, // Set the maximum number of lines
                                      style: TextStyle(
                                          fontSize:
                                              14), // Adjust the font size as needed
                                    )),
                                  ],
                                ),
                              ),
                            ],
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
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Drop Us A Line",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: TextFormField(
                  controller: name,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: 'Enter Your Name'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: TextFormField(
                  controller: number,
                  inputFormatters: [_phnoFormatter],
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: 'Enter Phone Number'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 160,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: TextFormField(
                  controller: message,
                  maxLines: null, // or set a specific number greater than 1
                  textInputAction:
                      TextInputAction.newline, // display return key
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Write Your Concern',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Validate();
                },
                child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromARGB(255, 4, 70, 125),
                    ),
                    child: const Center(
                        child: Text(
                      "Submit",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ))),
              ),
            ],
          ),
        ));
  }
}
