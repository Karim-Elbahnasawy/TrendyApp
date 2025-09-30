import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.text, required this.image});

  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(64.r),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: 80.w,
              height: 80.h,
            ),
          ),
        ),
        SizedBox(height: 7.h),
        Text(text, style: textTheme.headlineSmall),
      ],
    );
  }
}
