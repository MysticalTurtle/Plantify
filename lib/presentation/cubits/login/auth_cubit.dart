import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:recog_plantify/core/config/preferences.dart';
import 'package:recog_plantify/domain/entities/user.dart';
import 'package:recog_plantify/domain/repositories/api_key_repository.dart';
import 'package:recog_plantify/domain/repositories/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepository, required this.apiKeyRepository})
      : super(AuthInitial());

  final AuthRepository authRepository;
  final ApiKeyRepository apiKeyRepository;
  final prefs = SharedPreferencesPlantify();
  final securePrefs = SecureStoragePlantify();

  void checkAuth() async {
    final token = await authRepository.getToken();
    if (token != null) {
      debugPrint(token);
      User user = await authRepository.getUser() as User;
      emit(Authenticated(user: user));
      return;
    }

    if (await prefs.getOnboardingViewed()) {
      emit(OnboardingNotViewed());
    }

    emit(Unauthenticated());
  }

  Future<void> register(username, email, password, firstname, lastname) async {
    emit(AuthLoading());
    var token = await authRepository.register(
        username, email, password, firstname, lastname);

    token.fold((failure) {
      emit(AuthFailure(message: failure.message));
      return;
    }, (token) async {
      emit(AuthInitial());
      /// Automatizar el proceso de la creación de api Keys?
      // var response = await apiKeyRepository.sendEmail(token);
      // response.fold((failure) => emit(AuthFailure(message: "failure.message")),
      //     (r) => emit(Unauthenticated()));
    });
  }

  Future<void> login(username, password) async {
    emit(AuthLoading());
    var response = await authRepository.login(username, password);

    response.fold((failure) {
      emit(AuthFailure(message: failure.message));
      debugPrint(failure.toString());
    }, (user) {
      debugPrint(user.toString());
      authRepository.saveUser(user);
      emit(Authenticated(user: user));
      return true;
    });
  }

  void logout() {
    prefs.clear();
    securePrefs.clear();
    emit(Unauthenticated());
  }
}
