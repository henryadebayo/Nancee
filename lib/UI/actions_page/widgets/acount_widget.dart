import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountWidget extends StatelessWidget {
  String? accountNumber;
  DateTime? date;
  var balance;
  AccountWidget({this.accountNumber, this.date, this.balance, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.account_balance_wallet,
        color: Colors.black,
      ),
      title: Text(
        "$accountNumber",
        style: TextStyle(color: Colors.black, fontSize: 15.0.sp),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "\$ $balance",
            style: TextStyle(color: Colors.black, fontSize: 15.0.sp),
          ),
        ],
      ),
      subtitle: const Text(
        "Savings Account",
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}
