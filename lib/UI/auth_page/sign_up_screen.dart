import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nannce/UI/auth_page/widgets/sign_up_widget.dart';
import 'package:nannce/Utils/App_colors/app_color_file.dart';

import '../../Blocs/auth_bloc/signUp_bloc/signup_bloc_bloc.dart';
import '../../Repo/models/user.dart';
import '../../Utils/widgets/custom_loader.dart';
import '../bottom_navigation_page/bottom_navigation_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  User user = User();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:
          BlocConsumer<SignUpBloc, SignUpBlocState>(listener: (context, state) {
        if (state is SignedUpError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.primaryColor,
              content: Text(
                state.errorMessage!,
                style: const TextStyle(color: Colors.white),
              ),
              action: SnackBarAction(
                label: "Dismiss",
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
              ),
            ),
          );
        }
      }, builder: (context, state) {
        if (state is SignUpLoading) {
          return Center(
            child: Container(
                color: Colors.white,
                height: 50.0.h,
                width: 70.0.w,
                child: Center(child: CustomLoader(label: "Creating Account"))),
          );
        }
        if (state is SignedUpSuccessful) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: AppColors.primaryColor,
              content: Text(
                state.message!,
                style: const TextStyle(color: Colors.white),
              ),
              action: SnackBarAction(
                label: "Dismiss",
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
              ),
            ));
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) {
              return BottomNavigation();
            }));
          });
        }
        return SignUpWidget(formKey: _formKey, user: user);
      }),
    );
  }
}
