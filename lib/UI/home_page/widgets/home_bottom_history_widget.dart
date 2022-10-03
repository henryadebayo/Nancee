import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Blocs/users_and_account_bloc/users_and_account_bloc.dart';
import '../../../Utils/widgets/custom_loader.dart';
import '../../history_page/widgets/history_item_widget.dart';

class HomeBottomHistoryWidget extends StatelessWidget {
  const HomeBottomHistoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocConsumer<AccountHistoryBloc, AccountHistoryState>(
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
                child: Center(child: CustomLoader(label: "Loading data"))),
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
                "You're Offline\n check internet connection or restart app"),
          );
        }
      }),
    );
  }
}
