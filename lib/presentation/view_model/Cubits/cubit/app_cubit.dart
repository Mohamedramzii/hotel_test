import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../../data/data_sources/dio_helper.dart';
import '../../../../data/hotelModel.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  List<String> sortMethods = [
    'Our recommendations',
    'Rating & Recommended',
    'Price & Recommended',
    'Distance & Recommended',
    'Rating only',
    'Price only',
    'Distance only'
  ];

  int currentIndex = 0;

  changeIndex(index) {
    currentIndex = index;
    print(index);
    emit(IndexIsChangedInSortSuccessState());
  }

  double sliderValue = 20;
  sliderIsChanging(value) {
    sliderValue = value;
    emit(SliderValueChangedSuccessState());
  }

  resetAllFilters() {
    sliderValue = 20;
    currentRateIndex=0;
    emit(ResetFiltersSuccessState());
  }

  List<HotelModel> data = [];
  getAllHotels() async {
    emit(GetAllHotelsDataLoadingState());

    try {
      Response response = await DioHelper.getData(url: '/test/hotels');

      for (var hotel in response.data) {
        data.add(HotelModel.fromJson(hotel));
      }
      debugPrint('Hotels data Fetched SuccessFully : ${data[0].name}');
      emit(GetAllHotelsDataSuccessState());
    } catch (e) {
      emit(GetAllHotelsDataFailureState(errMessage: e.toString()));
    }
  }

  List<String> rates = ['0+', '7+', '7.5+', '8+', '8.5+'];

  List<Color> ratesColors = [
    Colors.red,
    Colors.orange,
    Colors.lightGreen,
    Colors.green.withOpacity(0.9),
    Colors.green
  ];

  int currentRateIndex = 0;
  filtersRateIndexChange(int index) {
    currentRateIndex = index;
    emit(FiltersRateIndexChangedSuccessState());
  }
}
