import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserAccountWidget extends StatelessWidget {
  String? accountNumber;
  var balance;
  UserAccountWidget({this.accountNumber, this.balance, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.person_pin,
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
          const Text(
            "Date created",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
      subtitle: const Text(
        "williams Service",
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}
