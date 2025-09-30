import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.textTheme,
    required this.text,
    required this.onPressed,
  });

  final TextTheme textTheme;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text, style: textTheme.labelSmall),
    );
  }
}