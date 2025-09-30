import 'package:flutter/material.dart';
import 'package:trendy_app/core/utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.validator,
    this.controller,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
    this.obscureText = false,
  });

  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.pink,
      cursorWidth: 3,
      cursorHeight: 25,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon != null
            ? Padding(padding: EdgeInsets.zero, child: suffixIcon)
            : null,
        prefixIcon: prefixIcon != null
            ? Padding(padding: EdgeInsets.zero, child: prefixIcon)
            : null,
      ),
    );
  }
}
