import 'package:flutter/material.dart';
import 'package:flutter_application_1/suffatech/success.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class internship extends StatefulWidget {
  const internship({Key? key}) : super(key: key);

  @override
  State<internship> createState() => _internshipState();
}

class _internshipState extends State<internship> {
  TextEditingController name = TextEditingController();
  TextEditingController fname = TextEditingController();
  TextEditingController cnic = TextEditingController();
  TextEditingController pn = TextEditingController();

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
      ErrorMessage("Enter your Phone Number", 1);
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => success(
                    id: '1',
                  ))));
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
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 4, 70, 125),
        title: const Text("Apply For Internship"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
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
                    color: Color.fromARGB(255, 255, 255, 255)),
                child: TextFormField(
                  controller: name,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.purple,
                      ),
                      border: InputBorder.none,
                      hintText: 'Name'),
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
                    color: Color.fromARGB(255, 255, 255, 255)),
                child: TextFormField(
                  controller: fname,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.purple,
                      ),
                      border: InputBorder.none,
                      hintText: 'Father Name'),
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
                    color: Color.fromARGB(255, 255, 255, 255)),
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
                      hintText: '#####-#######-#'),
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
                    color: Color.fromARGB(255, 255, 255, 255)),
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
                      hintText: '####-#######'),
                ),
              ),
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
                        color: Color.fromARGB(255, 4, 70, 125)),
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
