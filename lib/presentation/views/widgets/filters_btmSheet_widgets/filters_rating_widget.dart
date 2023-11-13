import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../view_model/Cubits/cubit/app_cubit.dart';


class FiltersRatingWidget extends StatelessWidget {
  const FiltersRatingWidget({super.key, required this.cubit});
  final AppCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'RATING',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 15.h,
        ),
        SizedBox(
          height: 45.h,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    cubit.filtersRateIndexChange(index);
                  },
                  child: Container(
                    width: 45.w,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: cubit.currentRateIndex == index
                              ? Colors.black
                              : Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Container(
                      width: 45.w,
                      // height: 30.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: cubit.ratesColors[index],
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Text(
                        cubit.rates[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17.sp, color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => index != 4
                  ? SizedBox(
                      width: 25.w,
                    )
                  : const SizedBox(),
              itemCount: cubit.ratesColors.length),
        ),
      ],
    );
  }
}
