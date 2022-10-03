import 'package:flutter/material.dart';
import 'package:nannce/UI/auth_page/widgets/getting_started_screen.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     Timer(
//         const Duration(seconds: 3),
//         () => Navigator.pushReplacement(context,
//             MaterialPageRoute(builder: (context) => const GetStartedScreen())));
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:
//       Container(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           color: Colors.black,
//           child: RotatedBox(
//             quarterTurns: 1,
//             child: Center(
//               child: Text(
//                 'Veegil.',
//                 style: TextStyle(
//                     color: Colors.amber[800],
//                     letterSpacing: 1.0,
//                     fontSize: 170.0,
//                     fontWeight: FontWeight.w500),
//               ),
//             ),
//           )),
//     );
//   }
// }

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = CurvedAnimation(parent: controller!, curve: Curves.easeInOut)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => const GetStartedScreen()));
        }
      });
    controller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Center(
          child: ScaleTransition(
            scale: animation!,
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Center(
                    child: Text(
                      'nance.',
                      style: TextStyle(
                          color: Colors.amber[800],
                          letterSpacing: 1.0,
                          fontSize: 170.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
