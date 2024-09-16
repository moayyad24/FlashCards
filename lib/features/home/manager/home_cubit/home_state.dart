import 'package:flashcards/core/models/collection_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeFetchLoading extends HomeState {}

class HomeFetchSuccess extends HomeState {
  final List<CollectionModel> homeDataList;

  HomeFetchSuccess({required this.homeDataList});
}
