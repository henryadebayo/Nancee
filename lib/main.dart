import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Blocs/auth_bloc/signIn_bloc/sign_in_bloc_bloc.dart';
import 'Blocs/auth_bloc/signUp_bloc/signup_bloc_bloc.dart';
import 'Route_helper/route_manager.dart';
import 'UI/auth_page/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MultiBlocProvider(
        providers: [
          // BlocProvider<NewsBloc>(
          //     create: (ctx)=>
          //     NewsBloc(newsServices: NewsServices())
          //       ..add(StartEvent())
          // ),
          BlocProvider<SignUpBloc>(create: (ctx) => SignUpBloc()),
          BlocProvider<SignInBloc>(create: (ctx) => SignInBloc()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.amber,
          ),
          onGenerateRoute: RouteGenerator.generateRoute,
          home: const SplashScreen(),
        ),
      ),
      designSize: const Size(360, 690),
    );
  }
}
