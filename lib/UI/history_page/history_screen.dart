import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nannce/Blocs/Account_history_boc/account_history_bloc.dart';
import 'package:nannce/UI/history_page/widgets/history_item_widget.dart';

import '../../Utils/App_colors/app_color_file.dart';
import '../../Utils/widgets/custom_loader.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AccountHistoryBloc>().add(LoadAccountHistoryEvent());
    //getIt<TrasactionHistoryService>().getTransactioHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transaction history"),
        backgroundColor: AppColors.primaryColor,
      ),
      body: BlocConsumer<AccountHistoryBloc, AccountHistoryState>(
          listener: (context, state) {
        if (state is AccoundErrorState) {
          Center(
            child: Text(
              state.errorMessage,
              textAlign: TextAlign.center,
            ),
          );
        }
      }, builder: (context, state) {
        if (state is AccountLoadingState) {
          return Center(
            child: Container(
                color: Colors.white,
                height: 50.0.h,
                width: 70.0.w,
                child: Center(child: CustomLoader(label: "Loading Data..."))),
          );
        }
        if (state is AccountHistoryLoaded) {
          return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (BuildContext context, int index) {
                return HistoryItemWidget(
                  accountNumber: state.data[index].phoneNumber!,
                  amount: state.data[index].amount ?? 0,
                  type: state.data[index].type!,
                );
              });
        } else {
          return const Center(
            child: Text(
              "You're Offline\n check internet connection or restart app",
              textAlign: TextAlign.center,
            ),
          );
        }
      }),
    );
  }
}
