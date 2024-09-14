import 'package:flashcards/features/home/data/model/home_data_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeFetchLoading extends HomeState {}

class HomeFetchSuccess extends HomeState {
  final List<HomeDataModel> homeDataList;

  HomeFetchSuccess({required this.homeDataList});
}
