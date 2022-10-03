import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nannce/UI/home_page/widgets/home_action_widget.dart';
import 'package:nannce/UI/home_page/widgets/home_creditCard_widget.dart';

import '../../Blocs/users_and_account_bloc/users_and_account_bloc.dart';
import '../../Providers/wallet_providers.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  bool showBack = false;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<AccountHistoryBloc>().add(LoadAccountHistoryEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    WalletProvider _userBalance = context.read<WalletProvider>();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
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
                      "\$ ${_userBalance.mainUserBalance.toString()}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0.sp,
                      ),
                    ),
                  ),
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
                      child: HomeCreditCardWidget(widget: widget),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0.h,
            ),
            const HomeActionWidget(),
          ],
        ),
      ),
    );
  }
}
