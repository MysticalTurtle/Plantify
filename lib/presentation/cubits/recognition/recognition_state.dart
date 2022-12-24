part of 'recognition_cubit.dart';

@immutable
abstract class RecognitionState {}

class RecognitionInitial extends RecognitionState {}

class RecognitionLoading extends RecognitionState {}

class RecognitionLoaded extends RecognitionState {
  final Query recognitionModel;

  RecognitionLoaded(this.recognitionModel);
}
