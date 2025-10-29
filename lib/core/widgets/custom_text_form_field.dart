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
    this.obscureText = false, this.onChanged,
    this.isEnabled = true,
  });

  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
 final void Function(String)? onChanged;
 final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnabled,
      onChanged: onChanged,
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
