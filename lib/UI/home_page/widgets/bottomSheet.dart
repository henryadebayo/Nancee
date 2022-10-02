import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nannce/Blocs/transaction_bloc/transaction_bloc.dart';
import 'package:provider/provider.dart';

import '../../../Providers/wallet_providers.dart';
import '../../../Repo/models/user.dart';
import '../../../Repo/services/account_action_services.dart';
import '../../../Utils/App_colors/app_color_file.dart';
import '../../../Utils/widgets/custom_loader.dart';
import '../../auth_page/widgets/customTextButton.dart';

class TransferBottomSheet extends StatefulWidget {
  const TransferBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<TransferBottomSheet> createState() => _TransferBottomSheetState();
}

class _TransferBottomSheetState extends State<TransferBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  User userModel = User();
  AccountTransactionServices tdd = AccountTransactionServices();
  double currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0.r),
              topLeft: Radius.circular(20.0.r),
            )),
        child: BlocConsumer<TransactionBloc, TransactionState>(
            listener: (context, state) {
          if (state is TransactionErrorState) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: AppColors.primaryColor,
                content: Text(
                  state.errorMessage,
                  style: TextStyle(color: Colors.white),
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
          if (state is TransactionLoadingState) {
            return Center(
              child: Container(
                  color: Colors.white,
                  height: 50.0.h,
                  width: 70.0.w,
                  child:
                      Center(child: CustomLoader(label: "Creating Account"))),
            );
          }
          if (state is TransferTransactionSuccesful) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: AppColors.primaryColor,
              content: Text(
                state.message,
                style: TextStyle(color: Colors.white),
              ),
              action: SnackBarAction(
                label: "Dismiss",
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
              ),
            ));
          }
          return Column(
            children: [
              SizedBox(
                height: 20.0.h,
              ),
              Container(
                height: 5.0.h,
                width: 60.0.w,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25.0.h,
                    ),
                    Text(
                      "RECEIVERS ACCOUNT NUMBER",
                      style:
                          TextStyle(color: Colors.black, letterSpacing: 0.1.w),
                    ),
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0.w, vertical: 10.0.h),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) => userModel.phoneNumber = value,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter account number";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Input Receivers account number",
                            focusColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.amber, width: 1.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0.h,
                    ),
                    const Text(
                      "AMOUNT TO TRANSFER",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.01),
                    ),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    Text(
                      "\$ ${currentValue.toInt()}".toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 45.0.sp,
                      ),
                    ),
                    SizedBox(
                      height: 15.0.h,
                    ),
                    Slider(
                      value: currentValue,
                      min: 0.0,
                      max: context.watch<WalletProvider>().mainUserBalance,
                      onChanged: (value) {
                        setState(() {
                          currentValue = value;
                          userModel.amount = value.toInt();
                        });
                      },
                      activeColor: Colors.amber[600],
                      inactiveColor: Colors.grey[200],
                      thumbColor: AppColors.primaryColor,
                    ),
                    SizedBox(
                      height: 20.0.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50.0.h,
                        child: CustomTextButton(
                          onSubmit: () async {
                            if (_formKey.currentState!.validate()) {
                              context.read<TransactionBloc>().add(TransferEvent(
                                  amount: userModel.amount,
                                  accountNumber: userModel.phoneNumber));
                            }
                          },
                          label: "TRANSFER   \$ ${currentValue.toInt()}",
                          textColor: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      );
    });
  }
}

class WithdrawBottomSheet extends StatefulWidget {
  const WithdrawBottomSheet({Key? key}) : super(key: key);

  @override
  State<WithdrawBottomSheet> createState() => _WithdrawBottomSheetState();
}

class _WithdrawBottomSheetState extends State<WithdrawBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  User userModel = User();
  AccountTransactionServices tdd = AccountTransactionServices();
  double currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0.r),
            topLeft: Radius.circular(20.0.r),
          )),
      child: BlocConsumer<TransactionBloc, TransactionState>(
          listener: (context, state) {
        if (state is TransactionErrorState) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.primaryColor,
              content: Text(
                state.errorMessage,
                style: TextStyle(color: Colors.white),
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
        if (state is TransactionLoadingState) {
          return Center(
            child: Container(
                color: Colors.white,
                height: 50.0.h,
                width: 70.0.w,
                child: Center(child: CustomLoader(label: "Creating Account"))),
          );
        }
        if (state is WithdrawTransactionSuccesful) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: AppColors.primaryColor,
            content: Text(
              state.message,
              style: TextStyle(color: Colors.white),
            ),
            action: SnackBarAction(
              label: "Dismiss",
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          ));
        }
        return Column(
          children: [
            SizedBox(
              height: 20.0.h,
            ),
            Container(
              height: 5.0.h,
              width: 60.0.w,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25.0.h,
                  ),
                  Text(
                    "INPUT ACCOUNT NUMBER ",
                    style: TextStyle(color: Colors.black, letterSpacing: 0.1.w),
                  ),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0.w, vertical: 10.0.h),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) => userModel.phoneNumber = value,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter account number";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Input account number",
                          focusColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.amber, width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0.h,
                  ),
                  const Text(
                    "AMOUNT TO WITHDRAW",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.01),
                  ),
                  SizedBox(
                    height: 10.0.h,
                  ),
                  Text(
                    "\$ ${currentValue.toInt()}".toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 45.0.sp,
                    ),
                  ),
                  SizedBox(
                    height: 15.0.h,
                  ),
                  Slider(
                    value: currentValue,
                    min: 0.0,
                    max: context.watch<WalletProvider>().mainUserBalance,
                    onChanged: (value) {
                      setState(() {
                        currentValue = value;
                        userModel.amount = value.toInt();
                      });
                    },
                    activeColor: Colors.amber[600],
                    inactiveColor: Colors.grey[200],
                    thumbColor: AppColors.primaryColor,
                  ),
                  SizedBox(
                    height: 20.0.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50.0.h,
                      child: CustomTextButton(
                        onSubmit: () async {
                          if (_formKey.currentState!.validate()) {
                            context.read<TransactionBloc>().add(WithdrawEvent(
                                amount: userModel.amount,
                                accountNumber: userModel.phoneNumber));
                          }
                        },
                        label: "WITHDRAW   \$ ${currentValue.toInt()}",
                        textColor: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
