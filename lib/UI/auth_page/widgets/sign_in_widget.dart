import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Blocs/auth_bloc/signIn_bloc/sign_in_bloc_bloc.dart';
import '../../../Repo/models/user.dart';
import 'customTextButton.dart';
import 'formField.dart';

class SignInWidget extends StatelessWidget {
  const SignInWidget({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.newUser,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final User newUser;

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
                        keyboardType: TextInputType.number,
                        formatter: [LengthLimitingTextInputFormatter(11)],
                        label: "Input Phone Number",
                        autofill: AutofillHints.telephoneNumber,
                        onChanged: (value) {
                          newUser.phoneNumber = value;
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
                      SizedBox(
                        height: 20.0.h,
                      ),
                      CustomTextForm(
                        label: "Password",
                        formatter: [LengthLimitingTextInputFormatter(18)],
                        autofill: AutofillHints.password,
                        onChanged: (value) {
                          newUser.password = value;
                        },
                        validator: (email) => email == null
                            // &&
                            //     !EmailValidator.validate(email)
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
                  if (_formKey.currentState!.validate()) {
                    context.read<SignInBloc>().add(SignIn(
                        phoneNumber: newUser.phoneNumber!,
                        password: newUser.password!));
                  }
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
                onPressed: () => Navigator.of(context).pushNamed("/signUp"),
                child: Text(
                  "Sign Up instead ?",
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
