import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_test/presentation/views/widgets/filters_hotelclass_widget.dart';
import '../../view_model/Cubits/cubit/app_cubit.dart';
import 'filters_rating_widget.dart';
import 'filters_slider_widget.dart';

import 'filters_header_widget.dart';

class FilterBtmSheet extends StatefulWidget {
  FilterBtmSheet({
    super.key,
    required this.cubit,
  });

  final AppCubit cubit;
  List<int> hotelclass = [1, 2, 3, 4, 5];
  @override
  State<FilterBtmSheet> createState() => _FilterBtmSheetState();
}

class _FilterBtmSheetState extends State<FilterBtmSheet> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return SizedBox(
          height: 670.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 8.h,
              ),
              //! Header
              FiltersHeaderWidget(widget: widget),

              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //! Slider Widget
                    FiltersSliderWidget(cubit: widget.cubit),
                    SizedBox(
                      height: 50.h,
                    ),
                    //! Rating
                    FiltersRatingWidget(
                      cubit: widget.cubit,
                    ),
                    SizedBox(
                      height: 50.h,
                    ),

                    //! Hotel Class widget
                    Text(
                      'HOTEL CLASS',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      height: 50.h,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: (){
                                widget.cubit.filtersHotelClassIndexChange(index);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color:
                                            widget.cubit.currentHotelClassIndex ==
                                                    index
                                                ? Colors.black
                                                : Colors.orange),
                                    borderRadius: BorderRadius.circular(10.r)),
                                child: FiltersHotelClassWidget(
                                    rate: widget.hotelclass[index]),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => SizedBox(
                                width: 15.w,
                              ),
                          itemCount: widget.hotelclass.length),
                    ),

                    SizedBox(
                      height: 20.h,
                    ),
                    //! Distance From Widget
                    Text(
                      'DISTANCE FROM',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 8.w,
                    ),
                    const Divider(),
                    SizedBox(
                      height: 8.w,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Location',
                          style: TextStyle(fontSize: 17.sp),
                        ),
                        Row(
                          children: [
                            Text(
                              'City Center',
                              style: TextStyle(fontSize: 17.sp),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 15.r,
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    //! Show result Button

                    Center(
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        minWidth: 320.w,
                        height: 45.h,
                        color: Colors.blue,
                        child: Text(
                          'Show results',
                          style:
                              TextStyle(fontSize: 16.sp, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
