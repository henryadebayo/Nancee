import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryItemWidget extends StatelessWidget {
  String accountNumber;
  String type;
  String amount;

  HistoryItemWidget({
    required this.accountNumber,
    required this.type,
    required this.amount,
    Key? key,
  }) : super(key: key);

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
            "\$ $amount",
            style: TextStyle(color: Colors.black, fontSize: 15.0.sp),
          ),
          Text(
            "$type",
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
