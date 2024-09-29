import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Analytics extends StatefulWidget {
  const Analytics({Key? key}) : super(key: key);

  @override
  State<Analytics> createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 4, 70, 125),
            title: Text("Analytics")),
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
              "Analytics will show after 20 days of enrollment",
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
