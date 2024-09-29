import 'package:flutter/material.dart';
import 'package:flutter_application_1/suffatech/home.dart';
import 'package:hexagon/hexagon.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class signupKhalis extends StatefulWidget {
  const signupKhalis({super.key});

  @override
  State<signupKhalis> createState() => _signupKhalisState();
}

class _signupKhalisState extends State<signupKhalis> {
  TextEditingController email = TextEditingController();

  TextEditingController pass = TextEditingController();

  Validate() {
    if (email.text.isEmpty) {
      // ErrorMessage(
      //   "Enter Your Email",
      // );
    } else if (pass.text.isEmpty) {
      // ErrorMessage(
      //   "Enter Password",
      // );
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
        // ErrorMessage("Success");
        Navigator.push(
            context, MaterialPageRoute(builder: (contex) => const suffa()));
      } else {
        Navigator.pop(context);
        // ErrorMessage(
        //   "Failed",
        // );
      }
    } catch (e) {
      Navigator.pop(context);
      // ErrorMessage(e.toString());
    }
  }

  var hidePassword = true;
  final double hexagonSize = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // color: Color.fromARGB(255, 202, 245, 203),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              // ClipRRect(
              //   borderRadius:
              //       BorderRadius.only(bottomRight: Radius.circular(120)),
              //   child: Image.network(
              //     "https://e7.pngegg.com/pngimages/826/240/png-clipart-organic-food-vegetable-fruit-meat-vegetable-natural-foods-leaf-vegetable-thumbnail.png",
              //     height: 180,
              //     width: 250,
              //     fit: BoxFit.cover,
              //   ),
              // ),

              Transform.rotate(
                angle: -185,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    HexagonOffsetGrid.oddPointy(
                      columns: 2,
                      rows: 2,
                      buildTile: (col, row) => HexagonWidgetBuilder(
                        color: Color.fromARGB(255, 202, 245, 203),
                        elevation: 1,
                      ),
                      buildChild: (col, row) {
                        List imagePaths = [
                          'assets/images/gm.png',
                          'assets/images/eg.png',
                          'assets/images/milk.png',
                          'assets/images/gm.png',
                          'assets/images/eg.png',
                          'assets/images/egg.png',
                        ];
                        String randomImagePath = imagePaths[
                            DateTime.now().millisecondsSinceEpoch %
                                imagePaths.length];
                        return Opacity(
                          opacity: 0.7,
                          child: Transform.flip(
                            flipY: true,
                            child: Image.asset(
                              randomImagePath,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 240,
                    ),
                    Text(
                      "Khalis",
                      style: TextStyle(
                          color: Color.fromARGB(255, 39, 120, 42),
                          fontSize: 38,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: 20, left: 10, right: 25, bottom: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: email,
                            decoration: InputDecoration(hintText: 'User Email'),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: pass,
                            obscureText: hidePassword,
                            decoration: InputDecoration(
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
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          Validate();
                        },
                        child: Container(
                            width: 60,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromARGB(255, 39, 120, 42)),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => signupKhalis()));
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
