import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FiltersHotelClassWidget extends StatelessWidget {
  const FiltersHotelClassWidget({super.key, required this.rate});
  final int rate;
  static Icon halfstarIcon = const Icon(
    Icons.star_half_rounded,
    color: Colors.orange,
  );
  static Icon starIcon = const Icon(
    Icons.star_rounded,
    color: Colors.orange,
    // size: 15.r,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.r),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.orange,
        ),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: rate == 1
          ? Row(
              // crossAxisAlignment: CrossAxisAlignment.c,
              children: [halfstarIcon, starIcon],
            )
          : rate == 2
              ? Row(children: [starIcon, starIcon])
              : rate == 3
                  ? FittedBox(
                      child: Column(
                        children: [
                          starIcon,
                          Row(children: [starIcon, starIcon]),
                        ],
                      ),
                    )
                  : rate == 4
                      ? FittedBox(
                          child: Column(children: [
                            Row(children: [starIcon, starIcon]),
                            Row(children: [starIcon, starIcon]),
                          ]),
                        )
                      : SizedBox(
                          width: 40.w,
                          child: FittedBox(
                            child: Column(children: [
                              Row(children: [starIcon, starIcon]),
                              starIcon,
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [starIcon, starIcon]),
                            ]),
                          ),
                        ),
    );
  }
}
