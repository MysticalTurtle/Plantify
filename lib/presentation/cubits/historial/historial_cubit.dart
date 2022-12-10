import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recog_plantify/domain/entities/query.dart';

part 'historial_state.dart';

class HistorialCubit extends Cubit<HistorialState> {
  HistorialCubit() : super(HistorialInitial());
}
