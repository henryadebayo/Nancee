import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nannce/UI/auth_page/widgets/getting_started_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const GetStartedScreen())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: RotatedBox(
            quarterTurns: 1,
            child: Center(
              child: Text(
                'Nance.',
                style: TextStyle(
                    color: Colors.amber[800],
                    letterSpacing: 1.0,
                    fontSize: 170.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
          )),
    );
  }
}
