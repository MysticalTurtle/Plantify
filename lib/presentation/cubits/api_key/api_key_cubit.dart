import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recog_plantify/domain/repositories/api_key_repository.dart';

part 'api_key_state.dart';

class ApiKeyCubit extends Cubit<ApiKeyState> {
  ApiKeyCubit({required this.repository}) : super(ApiKeyNotAsked());

  final ApiKeyRepository repository;

  Future<void> checkApiKey() async {
    final result = await repository.checkApiKey();
    result.fold(
      (failure) {
        emit(ApiKeyNotConfirmed());
      },
      (token) => emit(ApiKeyConfirmed(token: token)),
    );
  }
}
