import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/hotelModel.dart';
import '../view_model/Cubits/cubit/app_cubit.dart';
import 'widgets/custom_hotel_details_widget.dart';

import 'widgets/custom_addtofav_button_widget.dart';
import 'widgets/custom_image_widget.dart';
import 'widgets/custom_stars_widget.dart';
import 'widgets/inner_container_widget.dart';
import 'widgets/upper_filter_sort_buttons_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = BlocProvider.of<AppCubit>(context);
          return RefreshIndicator(
            onRefresh: () => cubit.getAllHotels(),
            child: Conditional.single(
                context: context,
                conditionBuilder: (context) =>
                    state is GetAllHotelsDataSuccessState,
                widgetBuilder: (context) => BuildHomeScreen(cubit: cubit),
                fallbackBuilder: (context) =>
                    state is GetAllHotelsDataLoadingState
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : const Center(
                            child: Text('No Internet Connection'),
                          )),
          );
          // if (state is GetAllHotelsDataSuccessState) {
          //   return BuildHomeScreen(cubit: cubit);
          // } else if (state is GetAllHotelsDataLoadingState) {
          //   return const Center(
          //     child: CircularProgressIndicator(),
          //   );
          // } else if (state is GetAllHotelsDataFailureState) {
          //   return const Center(
          //     child: Text('No Internet Connection'),
          //   );
          // } else {
          //   // to handle
          //   return BuildHomeScreen(cubit: cubit);
          // }
        },
      ),
    ));
  }
}

class BuildHomeScreen extends StatelessWidget {
  const BuildHomeScreen({
    super.key,
    required this.cubit,
  });

  final AppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 50.h, left: 15.w, right: 15.w),
          child: Column(
            children: [
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            BounceInRight(
                              child: CustomCard(
                                model: cubit.data[index],
                              ),
                            ),
                            const CustomAddToFavButtonWidget()
                          ],
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            height: 10.h,
                          ),
                      itemCount: cubit.data.length))
            ],
          ),
        ),
        BounceInUp(
          from: -150,
          child: UpperFilterAndSortButtons(
            cubit: cubit,
          ),
        )
      ],
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.model,
  });

  final HotelModel model;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      surfaceTintColor: Colors.white,
      child: Container(
        width: double.infinity,
        // height: 300.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageWidget(model: model),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomStarsWidget(model: model),
                  SizedBox(
                    height: 5.h,
                  ),
                  //! Title
                  Text(
                    model.name!,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomHotelDetailsWidget(model: model),
                  SizedBox(
                    height: 10.h,
                  ),
                  InnerContainerWidget(model: model),
                  SizedBox(
                    height: 20.h,
                  ),
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      'More prices',
                      textAlign: TextAlign.right,
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
