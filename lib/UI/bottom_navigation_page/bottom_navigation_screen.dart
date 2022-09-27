import 'package:flutter/material.dart';

import '../../Utils/App_colors/app_color_file.dart';
import '../actions_page/action_screen.dart';
import '../history_page/history_page.dart';
import '../home_page/home_screen.dart';
import '../profile_page/profilr_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const ActionScreen(),
    const HistoryScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          unselectedIconTheme: const IconThemeData(color: Colors.white),
          selectedIconTheme: IconThemeData(color: AppColors.primaryColor),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedItemColor: AppColors.primaryColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.format_list_numbered_sharp),
              label: "History",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: "Actions",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ));
  }
}
