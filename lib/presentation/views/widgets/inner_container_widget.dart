import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/hotelModel.dart';

class InnerContainerWidget extends StatelessWidget {
  const InnerContainerWidget({
    super.key,
    required this.model,
  });

  final HotelModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.r),
          border: Border.all(color: Colors.black)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //! inner blue container
                Container(
                  alignment: Alignment.center,
                  height: 25.h,
                  padding: EdgeInsets.symmetric(horizontal: 5.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: Colors.cyan.withOpacity(0.2)),
                  child: const Text(
                    'Our lowest price',
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                            text: model.price!.toString(),
                            style: TextStyle(
                                fontSize: 25.sp, fontWeight: FontWeight.bold))
                      ],
                      text: '\$',
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.green,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 5.h,
                ),
                const Text('Renaissance')
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'View Deal',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        )),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 20.r,
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
