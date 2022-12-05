import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recog_plantify/domain/repositories/api_key_repository.dart';

part 'api_key_state.dart';

class ApiKeyCubit extends Cubit<ApiKeyState> {
  ApiKeyCubit({required this.repository}) : super(ApiKeyInitial());

  final ApiKeyRepository repository;
}
