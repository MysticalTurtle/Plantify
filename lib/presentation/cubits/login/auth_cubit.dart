import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:recog_plantify/core/config/preferences.dart';
import 'package:recog_plantify/domain/entities/user.dart';
import 'package:recog_plantify/domain/repositories/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepository}) : super(AuthInitial());

  final AuthRepository authRepository;
  final prefs = SharedPreferencesPlantify();
  final securePrefs = SecureStoragePlantify();

  void checkAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    final token = await authRepository.getToken();
    if (token != null) {
      debugPrint(token);
      User user = await authRepository.getUser() as User;
      emit(Authenticated(user: user));
      return;
    }

    if (await prefs.getOnboardingViewed()) {
      emit(Unauthenticated());
      return;
    }

    emit(OnboardingNotViewed());
  }

  Future<bool> register(username, email, password, firstname, lastname) async {
    var response = await authRepository.register(
        username, email, password, firstname, lastname);

    response.fold((failure) {
      return false;
    }, (unit) {
      return true;
    });
    return true;
  }

  Future<void> login(username, password) async {

    var response = await authRepository.login(username, password);

    response.fold((failure) {
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
