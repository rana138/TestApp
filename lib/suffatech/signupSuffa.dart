import 'package:flutter/material.dart';
import 'package:flutter_application_1/suffatech/home.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import 'login.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController pnh = TextEditingController();
  final MaskTextInputFormatter _phnoFormatter = MaskTextInputFormatter(
      mask: '####-#######', filter: {"#": RegExp(r'[0-9]')});
  String? id;

  Validate() {
    if (name.text.isEmpty) {
      ErrorMessage("Enter Your Name", 1);
    } else if (email.text.isEmpty) {
      ErrorMessage("Enter Your Email", 1);
    } else if (pass.text.isEmpty) {
      ErrorMessage("Enter Your Password", 1);
    } else if (pnh.text.isEmpty) {
      ErrorMessage("Enter Your Phone", 1);
    } else {
      insert();
    }
  }

  Future insert() async {
    try {
      var res = await http.post(
          Uri.parse("https://suffatechofficial.com/suffatech-app/insert.php"),
          body: {
            "user_name": name.text,
            "user_email": email.text,
            "user_pass": pass.text,
            "user_phon": pnh.text,
          });

      var response = jsonDecode(res.body);
      if (response["Success"].toString() == 'true') {
        ErrorMessage("Success", 0);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => suffa()));
      } else {
        ErrorMessage("Failed", 1);
      }
    } catch (e) {
      ErrorMessage("Something went wrong try again", 1);
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

  Future<void> _navigateToHomeScreen() async {
    await Future.delayed(const Duration(seconds: 10));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => suffa()),
    );
  }

  var hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 30),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5000),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 255, 255, 255)
                              .withAlpha(120),
                          blurRadius: 116.0,
                          spreadRadius: 60.0,
                          offset: const Offset(
                            0.0,
                            3.0,
                          ),
                        ),
                      ],
                    ),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "No Look Further",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "!",
                      style: TextStyle(
                          color: Colors.purple,
                          fontSize: 20,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Let's Start Today",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 245, 244, 244)),
                          child: TextFormField(
                            controller: name,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.purple,
                                ),
                                border: InputBorder.none,
                                hintText: 'User name'),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 245, 244, 244)),
                          child: TextFormField(
                            controller: email,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.purple,
                                ),
                                border: InputBorder.none,
                                hintText: 'User Email'),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 245, 244, 244)),
                          child: TextFormField(
                            controller: pass,
                            obscureText: hidePassword,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Colors.purple,
                                ),
                                suffixIcon: IconButton(
                                  icon: hidePassword
                                      ? const Icon(Icons.visibility_off)
                                      : const Icon(Icons.visibility),
                                  onPressed: () {
                                    setState(() {
                                      hidePassword = !hidePassword;
                                    });
                                  },
                                ),
                                hintText: 'User Password'),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 245, 244, 244)),
                          child: TextFormField(
                            inputFormatters: [_phnoFormatter],
                            keyboardType: TextInputType.number,
                            controller: pnh,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.mobile_friendly,
                                  color: Colors.purple,
                                ),
                                border: InputBorder.none,
                                hintText: 'Phone Number'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () {
                    Validate();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 255, 255, 255)),
                    child: const Center(
                        child: Text(
                      "SignUp!",
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 20,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.w600),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 1.0),
                        child: InkWell(
                            onTap: () {
                              print('hello');
                            },
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const login()),
                                );
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            )),
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
