import 'package:flutter/material.dart';
import 'package:flutter_application_1/suffatech/home.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'login.dart';

class forget extends StatefulWidget {
  const forget({super.key});

  @override
  State<forget> createState() => _signupState();
}

class _signupState extends State<forget> {
  TextEditingController email = TextEditingController();
  TextEditingController pnh = TextEditingController();
  final MaskTextInputFormatter _phnoFormatter = MaskTextInputFormatter(
      mask: '####-#######', filter: {"#": RegExp(r'[0-9]')});
  Validate() {
    if (email.text.isEmpty) {
      ErrorMessage("Enter Your Email", 1);
    } else if (pnh.text.isEmpty) {
      ErrorMessage("Enter Phone no", 1);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const suffa()),
      );
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
          child: Column(
            children: <Widget>[
              Row(children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const login()));
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
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
              ]),
              const SizedBox(
                height: 130,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
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
                    "Reset Password",
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
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 1, vertical: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(right: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color:
                                    const Color.fromARGB(255, 245, 244, 244)),
                            child: TextFormField(
                              inputFormatters: [_phnoFormatter],
                              keyboardType: TextInputType.number,
                              controller: pnh,
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.phone,
                                    color: Colors.purple,
                                  ),
                                  border: InputBorder.none,
                                  hintText: 'Phone Number'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 26,
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
                    "Get OTP!",
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.w600),
                  )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
