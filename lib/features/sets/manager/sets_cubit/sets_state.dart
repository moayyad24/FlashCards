import 'package:flashcards/core/models/collection_model.dart';

abstract class SetsState {}

class SetsInitial extends SetsState {}

class SetsLoading extends SetsState {}

class SetsSuccess extends SetsState {
  final List<CollectionModel> setsList;
  SetsSuccess({required this.setsList});
}
