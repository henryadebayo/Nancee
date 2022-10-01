import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nannce/UI/history_page/widgets/history_item_widget.dart';

import '../../Repo/models/transaction_history_model.dart';
import '../../Repo/services/transaction_history_service.dart';
import '../../Utils/App_colors/app_color_file.dart';
import '../../Utils/App_textStyles/app_textstyle_file.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  TrasactionHistoryService tdd = TrasactionHistoryService();

  List<TransactionHistoryData> acd = [];

  @override
  void initState() {
    super.initState();
    var ancd = tdd.getTransactioHistory();
    //getIt<TrasactionHistoryService>().getTransactioHistory();
    print("THIS WAS CALLED");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transaction history"),
        backgroundColor: AppColors.primaryColor,
      ),
      body: SingleChildScrollView(
        child: RefreshIndicator(
          onRefresh: () => tdd.getTransactioHistory(),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 30.0.h,
                color: Colors.grey,
                child: Row(
                  children: [
                    SizedBox(
                      width: 20.0.w,
                    ),
                    Text(
                      "27 sep 2022",
                      style: AppTextStyle.BlackBold.copyWith(
                          color: Colors.grey[200]),
                    )
                  ],
                ),
              ),
              HistoryItemWidget(
                accountNumber: acd[2].phoneNumber!,
                amount: ancd[2].amount,
                type: acd[2].type!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
