import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nannce/UI/auth_page/widgets/customTextButton.dart';
import 'package:nannce/Utils/App_colors/app_color_file.dart';

import '../../Blocs/auth_bloc/signUp_bloc/signup_bloc_bloc.dart';
import '../../Repo/models/user.dart';
import '../../Utils/widgets/custom_loader.dart';
import 'widgets/formField.dart';

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
            Navigator.of(context).pushNamed("/bottomNav");
          });
        }
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
      }),
    );
  }
}
