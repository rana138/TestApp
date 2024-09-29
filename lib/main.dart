import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/suffatech/home.dart';
import 'package:flutter_application_1/suffatech/signupSuffa.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: suffa(),
    );
  }
}

class Splash1 extends StatefulWidget {
  const Splash1({Key? key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Splash1> {
  @override
  void initState() {
    super.initState();
    _checkUserIdAndNavigate();
  }

  Future<void> _checkUserIdAndNavigate() async {
    // DateTime now = DateTime.now();

    // String formattedDate = DateFormat('yyyy-MM-dd hh:mm a').format(now);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('user_id');
    // String? reward = prefs.getString('reward');

    if (userId != null && userId.isNotEmpty) {
      _navigateToHomeScreen();
    } else {
      // User ID is not present, navigate to login screen
      _navigateToLoginScreen();
    }
  }

  Future<void> _navigateToHomeScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => suffa()),
    );
  }

  Future<void> _navigateToLoginScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => signup()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              left: 0,
              top: MediaQuery.of(context).size.height * 0.4,
              child: Image.asset(
                "assets/images/logo.jpeg",
                height: 130,
              ),
            ),
            // Positioned(
            //   top: MediaQuery.of(context).size.height * 0.56,
            //   child: SizedBox(
            //     width: MediaQuery.of(context).size.width,
            //     child: Column(
            //       children: const [
            //         Text(
            //           '',
            //           style: TextStyle(
            //             fontSize: 24,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
