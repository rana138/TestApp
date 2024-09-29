import 'package:flutter/material.dart';
import 'package:flutter_application_1/suffatech/success.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SubmitForm extends StatefulWidget {
  String? id;
  SubmitForm({super.key, required this.id});

  @override
  State<SubmitForm> createState() => _SubmitFormState();
}

class _SubmitFormState extends State<SubmitForm> {
  TextEditingController name = TextEditingController();
  TextEditingController fname = TextEditingController();
  TextEditingController cnic = TextEditingController();
  TextEditingController pn = TextEditingController();
  TextEditingController address = TextEditingController();
  final TextEditingController _cnicController = TextEditingController();
  final MaskTextInputFormatter _cnicFormatter = MaskTextInputFormatter(
      mask: '#####-#######-#', filter: {"#": RegExp(r'[0-9]')});
  final MaskTextInputFormatter _phnoFormatter = MaskTextInputFormatter(
      mask: '####-#######', filter: {"#": RegExp(r'[0-9]')});

  Validate() {
    if (name.text.isEmpty) {
      ErrorMessage("Enter your Name", 1);
    } else if (fname.text.isEmpty) {
      ErrorMessage("Enter your Father name", 1);
    } else if (cnic.text.isEmpty) {
      ErrorMessage("Enter your CNIC number", 1);
    } else if (pn.text.isEmpty) {
      ErrorMessage("Enter your Phone", 1);
    } else {
      insert();
    }
  }

  Future insert() async {
    try {
      var res = await http.post(
          Uri.parse(
              "https://suffatechofficial.com/suffatech-app/enrollment.php"),
          body: {
            "user_name": name.text,
            "c_id": widget.id.toString(),
            "user_email": fname.text,
            "user_pass": cnic.text,
            "user_phon": pn.text,
          });

      var response = jsonDecode(res.body);
      if (response["Success"].toString() == 'false') {
        ErrorMessage("Failed", 1);
      } else {
        ErrorMessage("Success", 0);

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) =>
                    success(id: response["Success"].toString()))));
      }
    } catch (e) {
      Navigator.pop(context);
      ErrorMessage(e.toString(), 1);
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
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 4, 70, 125),
        title: const Text("Submit Form"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Applicant Names",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.only(right: 15, left: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 247, 243, 243)),
                child: TextFormField(
                  controller: name,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.purple,
                      ),
                      border: InputBorder.none,
                      hintText: 'Enter Your Name'),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Father Names",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.only(right: 15, left: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 247, 243, 243)),
                child: TextFormField(
                  controller: fname,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.purple,
                      ),
                      border: InputBorder.none,
                      hintText: 'Enter Father Name'),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Applicant CNIC Number",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.only(right: 15, left: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 247, 243, 243)),
                child: TextFormField(
                  controller: cnic,
                  inputFormatters: [_cnicFormatter],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      prefixIcon: Container(
                        height: 15,
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          "assets/images/cnic.png",
                        ),
                      ),
                      border: InputBorder.none,
                      hintText: 'Enter CNIC Number'),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Phone Number",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.only(right: 15, left: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 247, 243, 243)),
                child: TextFormField(
                  controller: pn,
                  inputFormatters: [_phnoFormatter],
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.phone_android,
                        color: Colors.purple,
                      ),
                      border: InputBorder.none,
                      hintText: 'Enter Phone Number'),
                ),
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Padding(
              //       padding:
              //           const EdgeInsets.only(top: 18, left: 10, right: 10),
              //       child: Theme(
              //         data: Theme.of(context).copyWith(
              //           // Set the InputDecoration to remove the underline
              //           inputDecorationTheme: const InputDecorationTheme(
              //             border: InputBorder.none,
              //           ),
              //         ),
              //         child: Container(
              //           width: MediaQuery.of(context).size.width * 0.4,
              //           height: 40,
              //           decoration: const BoxDecoration(
              //               color: Color.fromARGB(255, 247, 243, 243),
              //               borderRadius:
              //                   BorderRadius.all(Radius.circular(20))),
              //           child: Center(
              //             child: DropdownButton<String>(
              //               underline:
              //                   Container(), // Set the underline to an empty container
              //               iconEnabledColor: Colors.purple,
              //               borderRadius: BorderRadius.circular(20),
              //               value: widget.selectedCity,
              //               onChanged: (String? newValue) {
              //                 setState(() {
              //                   widget.selectedCity = newValue!;
              //                 });
              //               },
              //               items: <String>[
              //                 "--Select City--",
              //                 "Sahiwal",
              //                 "Okara",
              //                 "Multan",
              //                 "Lahore",
              //                 "Arif Wala",
              //                 "Pakpattan",
              //                 "Mian Channu", "Haidarabad", "Yousaf Wala",
              //                 "Fortabad",
              //                 "Karachi",
              //                 "Faisalabad",
              //                 "Chicha Wanti",
              //                 // Add more cities as needed
              //               ].map<DropdownMenuItem<String>>((String value) {
              //                 return DropdownMenuItem<String>(
              //                   value: value,
              //                   child: Text(value),
              //                 );
              //               }).toList(),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              GestureDetector(
                onTap: () {
                  Validate();
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 0.1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // color: const Color.fromARGB(255, 2, 34, 59),
                      color: Color.fromARGB(255, 4, 70, 125),
                    ),
                    child: const Center(
                      child: Text(
                        "Submit",
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
        ),
      ),
    );
  }
}
