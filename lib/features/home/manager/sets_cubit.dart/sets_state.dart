import 'package:flashcards/features/home/data/model/set_model.dart';

abstract class SetsState {}

class SetsInitial extends SetsState {}

class SetsLoading extends SetsState {}

class SetsSuccess extends SetsState {
  final List<SetModel> setsList;
  SetsSuccess({required this.setsList});
}

class SetsFailure extends SetsState {}
