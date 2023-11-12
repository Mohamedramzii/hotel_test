import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/hotelModel.dart';

class CustomStarsWidget extends StatelessWidget {
  const CustomStarsWidget({
    super.key,
    required this.model,
  });

  final HotelModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Wrap(
          direction: Axis.horizontal,
          children: List.generate(
              model.starts!,
              (index) => const Icon(
                    Icons.star,
                    color: Colors.grey,
                    size: 16,
                  )),
        ),
        SizedBox(
          width: 5.w,
        ),
        Text(
          'Hotel',
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              
        )
      ],
    );
  }
}
