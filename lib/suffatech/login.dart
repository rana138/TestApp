import 'package:flutter/material.dart';
import 'package:flutter_application_1/suffatech/home.dart';
import 'package:flutter_application_1/suffatech/signupSuffa.dart';
import 'package:flutter_application_1/suffatech/signup.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'forget.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _signupState();
}

class _signupState extends State<login> {
  TextEditingController email = TextEditingController();

  TextEditingController pass = TextEditingController();

  Validate() {
    if (email.text.isEmpty) {
      ErrorMessage(
        "Enter Your Email",
      );
    } else if (pass.text.isEmpty) {
      ErrorMessage(
        "Enter Password",
      );
    } else {
      Login();
    }
  }

  Future Login() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            children: const [
              CircularProgressIndicator(
                color: Color.fromARGB(255, 185, 0, 0),
              ),
              SizedBox(width: 20),
              Text('Login! Please Wait...'),
            ],
          ),
        );
      },
    );

    try {
      var res = await http.post(
          Uri.parse("https://suffatechofficial.com/suffatech-app/login.php"),
          body: {
            "user_email": email.text,
            "user_pass": pass.text,
          });

      var response = jsonDecode(res.body);
      print(response.toString());
      if (response["Success"] == 'true') {
        Navigator.pop(context);
        ErrorMessage("Success");
        Navigator.push(
            context, MaterialPageRoute(builder: (contex) => suffa()));
      } else {
        Navigator.pop(context);
        ErrorMessage(
          "Failed",
        );
      }
    } catch (e) {
      Navigator.pop(context);
      ErrorMessage(e.toString());
    }
  }

  ErrorMessage(String s) {
    return showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(
        message: s,
      ),
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
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height,
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
                      "LogIn",
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
                  child: Column(
                    children: [
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
                    ],
                  ),
                ),
                // const SizedBox(
                //   height: 17,
                // ),
                // GestureDetector(
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => const forget()),
                //     );
                //   },
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: const [
                //       Text(
                //         "Forgot Password?",
                //         style: TextStyle(color: Colors.white),
                //       ),
                //     ],
                //   ),
                // ),

                const SizedBox(
                  height: 30,
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
                      "Login!",
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
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => signup()));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromRGBO(255, 255, 255, 1)),
                    child: const Center(
                      child: Text(
                        "Register!",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 20,
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
