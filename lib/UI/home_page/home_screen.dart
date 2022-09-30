import 'package:awesome_card/credit_card.dart';
import 'package:awesome_card/extra/card_type.dart';
import 'package:awesome_card/extra/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nannce/UI/home_page/widgets/bottomSheet.dart';

import '../../Repo/services/transaction_history_service.dart';
import '../../Utils/App_colors/app_color_file.dart';
import '../history_page/widgets/history_item_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  bool showBack = false;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TrasactionHistoryService th = TrasactionHistoryService();
  @override
  void initState() {
    th.getTransactioHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // WalletProvider _userBalance = context.read<WalletProvider>();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => th.getTransactioHistory(),
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 10.0.h, vertical: 10.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5.0.h,
                    ),
                    const Text(
                      "BALANCE",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.5),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0.h, vertical: 20.0.w),
                      child: Text(
                        "9500",
                        // _userBalance.mainUserBalance.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          // fontWeight: FontWeight.w500,
                          //   letterSpacing: 0.5,
                          fontSize: 30.0.sp,
                        ),
                      ),
                    ),
                    // CARD WIDGET
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (widget.showBack == false) {
                              widget.showBack = true;
                            } else {
                              widget.showBack = false;
                            }
                          });
                        },
                        child: CreditCard(
                          cardNumber: "5122 7568 2354 1247",
                          cardExpiry: "5/24",
                          cardHolderName: "Marvel Adebayo",
                          cvv: "157",
                          bankName: 'Axis Bank',
                          showBackSide: widget.showBack,
                          frontBackground: Container(
                            width: double.maxFinite,
                            height: double.maxFinite,
                            color: AppColors.primaryColor,
                          ),
                          backBackground: Container(
                            width: double.maxFinite,
                            height: double.maxFinite,
                            color: AppColors.primaryColor,
                          ),
                          showShadow: true,
                          mask: getCardTypeMask(
                              cardType: CardType.americanExpress),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0.h,
              ),
              Expanded(
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
                                border: Border.all(
                                    color: Colors.white54, width: 1.0.w),
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
                                    Text(
                                      "Transfer",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12.0.sp),
                                    )
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
                                      onPressed: () {},
                                    ),
                                    Text(
                                      "Deposit",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12.0.sp),
                                    )
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
                                    Text(
                                      "Details",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12.0.sp),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 25.0.h, left: 20.0.w, right: 20.0.w),
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
                      Expanded(
                        child: ListView.builder(
                            itemBuilder: (BuildContext ctx, int index) {
                          return const HistoryItemWidget();
                        }),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
