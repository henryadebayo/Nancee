import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case "/bottomNav":
        return MaterialPageRoute(builder: (_) => const BottomNavigation());

      case "/signUp":
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      case "/signIn":
        return MaterialPageRoute(builder: (_) => const SignInScreen());

        // if(args is String){
        //   //do something
        // }
        return _errorRoute();

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(
          child: Text(" error 404"),
        ),
      );
    });
  }
}
