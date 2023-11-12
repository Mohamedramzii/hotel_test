import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../view_model/Cubits/cubit/app_cubit.dart';
import 'filter_btmsheet_widget.dart';
import 'sort_btmsheet_widget.dart';

class UpperFilterAndSortButtons extends StatelessWidget {
  const UpperFilterAndSortButtons({
    super.key,
    required this.cubit,
  });
  final AppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      elevation: 6,
      child: Container(
        height: 60.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    enableDrag: true,
                    isScrollControlled: true,
                    backgroundColor: Colors.white,
                    builder: (context) => FilterBtmSheet(cubit: cubit));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.settings, color: Colors.blue),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    'Filters',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.blue),
                  )
                ],
              ),
            )),
            Expanded(
                child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  // showDragHandle: true,
                  enableDrag: true,
                  isScrollControlled: true,
                  backgroundColor: Colors.white,
                  context: context,
                  builder: (context) {
                    return SortBtmSheet(cubit: cubit);
                  },
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.sort_rounded, color: Colors.blue),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    'Sort',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.blue),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

