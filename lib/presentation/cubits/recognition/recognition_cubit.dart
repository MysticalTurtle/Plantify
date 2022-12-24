import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:recog_plantify/domain/entities/query.dart';
import 'package:recog_plantify/domain/repositories/recognition_repository.dart';

part 'recognition_state.dart';

class RecognitionCubit extends Cubit<RecognitionState> {
  RecognitionCubit({required this.repository}) : super(RecognitionInitial());

  RecognitionRepository repository;

  void submitPlant(XFile image) async {
    emit(RecognitionLoading());
    var response = await repository.recognizePlant(image.path);
    

  } 
}
