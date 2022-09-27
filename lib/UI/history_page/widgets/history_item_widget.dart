import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryItemWidget extends StatelessWidget {
  const HistoryItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.person_pin,
        color: Colors.black,
      ),
      title: Text(
        "Enike",
        style: TextStyle(color: Colors.black, fontSize: 15.0.sp),
      ),
      trailing: Text(
        "\$ 200.05",
        style: TextStyle(color: Colors.black, fontSize: 15.0.sp),
      ),
      subtitle: const Text(
        "Escrow Service",
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}
