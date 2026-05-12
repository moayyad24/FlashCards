import 'package:cardy/features/home/data/model/home_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeFetchLoading extends HomeState {}

class HomeFetchSuccess extends HomeState {
  final HomeModel homeData;

  HomeFetchSuccess({required this.homeData});
}
