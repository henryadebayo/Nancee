
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextForm extends StatelessWidget {
  String  label;
  var keyboardType;
  var autofill;
  FormFieldValidator validator;
  IconButton? suffixIcon;
  double? height;
  bool? hideText;
  final ValueChanged<String> onChanged;
  CustomTextForm({Key? key,
    required this.onChanged,
    required this.label,
    this.autofill,
     this.height,
    this.suffixIcon,
    this.hideText,
    this.keyboardType,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      keyboardType: keyboardType,
      autofillHints: [autofill],
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        counterStyle: TextStyle(color: Colors.white),
        suffix: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0.r),
          borderSide:  BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0.r),
          borderSide: BorderSide(color: Colors.amber),
        ),
        labelStyle: TextStyle(color: Colors.white),
        contentPadding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 14.h,),
       // hintText: label,
       // label: Text(label),
        labelText: label,
       // fillColor: Colors.white,
       // filled: true,
        focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0.r),
        borderSide: BorderSide(color: Colors.amber),),
    errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(4.0.r),
    borderSide: BorderSide(color: Colors.red),),
      ),
    );
  }
}
