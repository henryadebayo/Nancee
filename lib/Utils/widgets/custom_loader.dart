import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nannce/Utils/App_colors/app_color_file.dart';

class CustomLoader extends StatelessWidget {
  String label;

  CustomLoader({required this.label});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: AppColors.primaryColor,
      backgroundColor: Colors.white,
      semanticsLabel: label,
    );
  }
}
