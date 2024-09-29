import 'package:flutter/material.dart';

class mycourse extends StatefulWidget {
  const mycourse({super.key});

  @override
  State<mycourse> createState() => _SubmitFormState();
}

class _SubmitFormState extends State<mycourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 4, 70, 125),
            title: Text("My Course")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.hourglass_empty, size: 60, color: Colors.grey),
            SizedBox(
              height: 10,
            ),
            Center(
                child: Text(
              "My Course will show after your enrollment",
              style: TextStyle(color: Colors.grey),
            )),
            SizedBox(
              height: 4,
            ),
            Center(
                child: Text(
              "Still not abale any data",
              style: TextStyle(color: Colors.grey),
            ))
          ],
        ));
  }
}
