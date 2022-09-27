import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../Providers/wallet_providers.dart';
import '../../../Utils/App_colors/app_color_file.dart';
import '../../auth_page/widgets/customTextButton.dart';

class TransferBottomSheet extends StatefulWidget {
  const TransferBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<TransferBottomSheet> createState() => _TransferBottomSheetState();
}

class _TransferBottomSheetState extends State<TransferBottomSheet> {
  double currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return Expanded(
        child: Container(
          // height: 500.0.h,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0.r),
                topLeft: Radius.circular(20.0.r),
              )),
          child: Column(
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
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0.w, vertical: 10.0.h),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Input Receivers account number",
                          focusColor: Colors.white,
                          //add prefix icon
                          // prefixIcon: Icon(
                          //   Icons.person_outline_rounded,
                          //   color: Colors.grey,
                          // ),
                          //errorText: "Error",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.amber, width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
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
                        });
                        // print(
                        //     _currentValue.toInt());
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
                          onSubmit: () {},
                          label: "TRANSFER   \$ ${currentValue.toInt()}",
                          textColor: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
