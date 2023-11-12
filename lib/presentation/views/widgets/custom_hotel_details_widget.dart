import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/hotelModel.dart';

class CustomHotelDetailsWidget extends StatelessWidget {
  const CustomHotelDetailsWidget({super.key, required this.model});
  final HotelModel model;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40.w,
          height: 25.h,
          padding: EdgeInsets.all(3.r),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r), color: Colors.green),
          child: Text(
            model.reviewScore.toString(),
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: 6.w,
        ),
        Text(model.review!),
        SizedBox(
          width: 6.w,
        ),
        const Icon(
          Icons.location_on,
          size: 15,
          color: Colors.grey,
        ),
        Text(model.address!)
      ],
    );
  }
}
