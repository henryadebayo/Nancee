import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Blocs/auth_bloc/signUp_bloc/signup_bloc_bloc.dart';
import '../../../Repo/models/user.dart';
import 'customTextButton.dart';
import 'formField.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.user,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final User user;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                "Create an account",
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
                      CustomTextForm(
                        label: "Name",
                        autofill: AutofillHints.name,
                        validator: (value) {
                          if (value.isEmpty ||
                              !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                            return "Name is required";
                          }
                          return null;
                        },
                        onChanged: (String value) {},
                      ),
                      SizedBox(
                        height: 20.0.h,
                      ),
                      CustomTextForm(
                        formatter: [LengthLimitingTextInputFormatter(11)],
                        keyboardType: TextInputType.number,
                        label: "Input Phone Number",
                        autofill: AutofillHints.telephoneNumber,
                        onChanged: (value) {
                          user.phoneNumber = value;
                        },
                        validator: (value) {
                          if (value.isEmpty
                              // ||
                              // !RegExp(r'^[a-z A-Z]+$')
                              //     .hasMatch(value)
                              ) {
                            return "Phone Number is required ";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.0.h,
                      ),
                      CustomTextForm(
                        label: "Email",
                        autofill: AutofillHints.email,
                        onChanged: (value) {},
                        validator: (value) {
                          if (value.isEmpty
                              // ||
                              // !RegExp(r'^[a-z A-Z]+$').hasMatch(value)
                              ) {
                            return "Please Enter a valid email address";
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
                            user.password = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return "enter a strong password";
                            }
                          }),
                    ],
                  )),
              SizedBox(
                height: 40.0.h,
              ),
              CustomTextButton(
                onSubmit: () {
                  print(user.phoneNumber);
                  print(user.password);
                  if (_formKey.currentState!.validate()) {
                    context.read<SignUpBloc>().add(SignUp(
                        phoneNumber: user.phoneNumber!,
                        password: user.password!));
                  }
                },
                label: "Sign Up",
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
                label: "Sign up with Facebook",
                logo: "assets/images/facebook.png",
              ),
              SizedBox(height: 10.0.h),
              CustomSocialTextButton(
                buttonColor: Colors.white,
                textColor: Colors.black,
                onSubmit: () {
                  // _formKey.currentState?.validate();
                },
                label: "Sign up with Google",
                logo: "assets/images/google.png",
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pushNamed("/signIn"),
                child: Text(
                  "Sign In instead ?",
                  style: TextStyle(color: Colors.amber[800]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
