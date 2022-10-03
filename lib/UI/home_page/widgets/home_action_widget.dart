import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Utils/App_textStyles/app_textstyle_file.dart';
import 'bottomSheet.dart';
import 'home_bottom_history_widget.dart';

class HomeActionWidget extends StatelessWidget {
  const HomeActionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0.r),
                topLeft: Radius.circular(20.0.r))),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15.0.h),
              child: Center(
                child: Container(
                  height: 90.0.h,
                  width: 300.0.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      // color: Colors.black,
                      border: Border.all(color: Colors.white54, width: 1.0.w),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFFF5F5F5),
                          offset: Offset(4, 4),
                          blurRadius: 10.0,
                          spreadRadius: 1,
                        ),
                        BoxShadow(
                          color: Color(0xFFFAFaFA),
                          offset: Offset(-4, -4),
                          blurRadius: 10.0,
                          spreadRadius: 1,
                        ),
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.call_made_sharp,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return const TransferBottomSheet();
                                  });
                            },
                          ),
                          const Text("Transfer",
                              style: AppTextStyle.BlackMedium)
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.add_circle_outline_outlined,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return const WithdrawBottomSheet();
                                  });
                            },
                          ),
                          const Text("Withdraw",
                              style: AppTextStyle.BlackMedium)
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.account_balance,
                              color: Colors.black,
                            ),
                            onPressed: () {},
                          ),
                          const Text("Details", style: AppTextStyle.BlackMedium)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 25.0.h, left: 20.0.w, right: 20.0.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Today",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.0),
                      ),
                      Text(
                        "-\$ 1,200.30",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 0.5.h,
                  ),
                ],
              ),
            ),
            const HomeBottomHistoryWidget()
          ],
        ),
      ),
    );
  }
}
