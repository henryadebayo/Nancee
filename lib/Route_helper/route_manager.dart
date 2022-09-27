import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nannce/UI/bottom_navigation_page/bottom_navigation_screen.dart';

import '../UI/auth_page/sign_in_page.dart';
import '../UI/auth_page/sign_up_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case "/bottomNav":
        return MaterialPageRoute(
            builder: (_) => const BottomNavigationScreen());

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
