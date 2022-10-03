import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nannce/UI/users_page/widgets/user_account_widget.dart';

import '../../Blocs/users_and_account_bloc/users_and_account_bloc.dart';
import '../../Utils/App_colors/app_color_file.dart';
import '../../Utils/widgets/custom_loader.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AccountHistoryBloc>().add(LoadAccountUsersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List of Users Screen"),
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
        if (state is AccountUsersLoaded) {
          return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (BuildContext context, int index) {
                return UserAccountWidget(
                  accountNumber: state.data[index].phoneNumber!,
                  name: "User $index",
                  balance: state.data[index].balance ?? 0,
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
