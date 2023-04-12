import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController textController;
  final String? Function(String?)? validator;
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.textController,
      this.validator});

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(30),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 3.h, vertical: 2.h),
        filled: true,
        fillColor: Colors.white,
        hintStyle: TextStyle(color: Colors.grey[500]),
        hintText: hintText,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }
}
