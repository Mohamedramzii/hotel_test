import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../view_model/Cubits/cubit/app_cubit.dart';

class SortBtmSheet extends StatefulWidget {
  const SortBtmSheet({
    super.key,
    required this.cubit,
  });

  final AppCubit cubit;

  @override
  State<SortBtmSheet> createState() => _SortBtmSheetState();
}

class _SortBtmSheetState extends State<SortBtmSheet> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 8.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(),
              Text(
                'Sort by',
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
          Expanded(
              child: ListView.separated(
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    widget.cubit.changeIndex(index);
                    widget.cubit.getAllHotels();
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.cubit.sortMethods[index]),
                        widget.cubit.currentIndex == index
                            ? const Icon(Icons.done)
                            : Container()
                      ],
                    ),
                  ));
            },
            itemCount: widget.cubit.sortMethods.length,
            separatorBuilder: (context, index) => const Divider(),
          ))
        ],
      ),
    );
  }
}
