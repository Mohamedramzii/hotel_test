import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../view_model/Cubits/cubit/app_cubit.dart';

class FiltersSliderWidget extends StatelessWidget {
  const FiltersSliderWidget({super.key, required this.cubit});
  final AppCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'PRICE PER NIGHT',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
            Container(
              width: 75.w,
              height: 50.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.r)),
              child: Text(
                '${cubit.sliderValue.toInt()}+ \$',
                style: TextStyle(fontSize: 20.sp),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        Slider(
          activeColor: Colors.blue,
          inactiveColor: Colors.grey,
          min: 20,
          max: 540,
          divisions: 10,
          thumbColor: Colors.white,
          secondaryActiveColor: Colors.pink,
          // label: 'value',
          value: cubit.sliderValue,
          onChanged: (value) {
            cubit.sliderIsChanging(value);
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              '\$20',
              style: TextStyle(fontSize: 16.sp, color: Colors.grey),
            ),
            SizedBox(
              width: 200.w,
            ),
            // SizedBox(width:100.w ,),
            Text('\$540+',
                style: TextStyle(fontSize: 16.sp, color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}
