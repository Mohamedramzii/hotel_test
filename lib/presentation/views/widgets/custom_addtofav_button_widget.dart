import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAddToFavButtonWidget extends StatelessWidget {
  const CustomAddToFavButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 14.w,
      top: 11.h,
      child: Container(
        width: 45.w,
        height: 45.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black.withOpacity(0.5),
        ),
        child: Icon(
          Icons.favorite_border,
          color: Colors.white,
          size: 28.r,
        ),
      ),
    );
  }
}
