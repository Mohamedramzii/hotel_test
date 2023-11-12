part of 'app_cubit.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}

final class GetAllHotelsDataSuccessState extends AppState {}

final class GetAllHotelsDataLoadingState extends AppState {}

final class GetAllHotelsDataFailureState extends AppState {
  final String errMessage;

  GetAllHotelsDataFailureState({required this.errMessage});
}


final class WaitingState extends AppState{}
final class IndexIsChangedInSortSuccessState extends AppState{}
final class SliderValueChangedSuccessState extends AppState{}
final class ResetFiltersSuccessState extends AppState{}
final class FiltersRateIndexChangedSuccessState extends AppState{}
