import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'filter_btmsheet_widget.dart';

class FiltersHeaderWidget extends StatelessWidget {
  const FiltersHeaderWidget({
    super.key,
    required this.widget,
  });

  final FilterBtmSheet widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              onPressed: () {
                widget.cubit.resetAllFilters();
              },
              child: Text(
                'Reset',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.grey, decoration: TextDecoration.underline),
              )),
          Text(
            'Filters',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.close),
          )
        ],
      ),
    );
  }
}
