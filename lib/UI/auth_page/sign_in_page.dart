import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nannce/UI/auth_page/widgets/customTextButton.dart';
import 'package:nannce/UI/auth_page/widgets/formField.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late final String email;
  late final String password;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: 8.0.w, right: 8.0.w, top: 20.0.h, bottom: 40.0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.0.h,
                ),
                const Center(
                    child: Text(
                  "Welcome back Sign in",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400),
                )),
                SizedBox(
                  height: 40.0.h,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.0.h,
                        ),
                        CustomTextForm(
                          label: "Email",
                          autofill: AutofillHints.email,
                          onChanged: (value) {
                            email = value;
                          },
                          validator: (value) {
                            if (value.isEmpty ||
                                !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                              return "Please Enter a valid Last Name";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20.0.h,
                        ),
                        CustomTextForm(
                          label: "Password",
                          autofill: AutofillHints.password,
                          onChanged: (value) {
                            password = value;
                          },
                          validator: (email) =>
                              email != null && !EmailValidator.validate(email)
                                  ? "enter a valid email"
                                  : null,
                        ),
                      ],
                    )),
                SizedBox(
                  height: 40.0.h,
                ),
                CustomTextButton(
                  onSubmit: () {
                    _formKey.currentState?.validate();
                  },
                  label: "Sign In",
                ),
                SizedBox(
                  height: 30.0.h,
                ),
                const Divider(
                  color: Colors.white,
                ),
                SizedBox(
                  height: 30.0.h,
                ),
                CustomSocialTextButton(
                  buttonColor: Colors.white,
                  textColor: Colors.black,
                  onSubmit: () {
                    // _formKey.currentState?.validate();
                  },
                  label: "Sign In with Facebook",
                  logo: "assets/images/facebook.png",
                ),
                SizedBox(height: 10.0.h),
                CustomSocialTextButton(
                  buttonColor: Colors.white,
                  textColor: Colors.black,
                  onSubmit: () {
                    // _formKey.currentState?.validate();
                  },
                  label: "Sign In with Google",
                  //LogoSpacewidth: 20.0.w,
                  logo: "assets/images/google.png",
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Sign Up instead ?",
                    style: TextStyle(color: Colors.amber[800]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
