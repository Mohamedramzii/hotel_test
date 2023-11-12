import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/hotelModel.dart';

class CustomImageWidget extends StatelessWidget {
  const CustomImageWidget({
    super.key,
    required this.model,
  });

  final HotelModel model;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      // clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.vertical(top: Radius.circular(10.r)),
      child: CachedNetworkImage(
        width: double.infinity,
        height: 120.h,
        imageUrl: model.image!,
        fit: BoxFit.cover,
      ),
    );
  }
}
