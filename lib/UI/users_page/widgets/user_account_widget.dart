import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserAccountWidget extends StatelessWidget {
  String? accountNumber;
  String? name;
  var balance;
  UserAccountWidget({this.accountNumber, this.name, this.balance, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.person_pin,
        color: Colors.black,
      ),
      title: Text(
        "$name",
        style: TextStyle(color: Colors.black, fontSize: 15.0.sp),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "\$ $balance",
            style: TextStyle(color: Colors.black, fontSize: 15.0.sp),
          ),
          const Text(
            "current account",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
      subtitle: Text(
        "$accountNumber",
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}
