part of 'historial_cubit.dart';

@immutable
abstract class HistorialState {}

class HistorialInitial extends HistorialState {}

class HistorialLoading extends HistorialState {}

class HistorialLoaded extends HistorialState {
  final List<Query> records;

  HistorialLoaded({required this.records});
}

