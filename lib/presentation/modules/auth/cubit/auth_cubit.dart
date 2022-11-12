import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:recog_plantify/core/config/preferences.dart';
import 'package:recog_plantify/data/datasources/auth_datasource.dart';
import 'package:recog_plantify/domain/entities/user.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authDataSource}) : super(AuthInitial());

  final AuthDataSource authDataSource;
  final SharedPreferencesPlantify _prefs = SharedPreferencesPlantify();
  final SecureStoragePlantify _secureStorage = SecureStoragePlantify();

  void checkAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    final token = await _secureStorage.getToken();
    if (token != null) {
      debugPrint(token);
      User user = await _prefs.getUser() as User;
      emit(Authenticated(user: user));
      return;
    }

    if (await _prefs.getOnboardingViewed()) {
      emit(Unauthenticated());
      return;
    }

    emit(OnboardingNotViewed());
  }

  Future<bool> register(username, email, password, firstname, lastname) async {
    try {
      bool created = await authDataSource.register(
          username, email, password, firstname, lastname);
      return created;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login(username, password) async {
    try {
      final loginResponse = await authDataSource.login(username, password);
      User user = User.fromLoginResponse(loginResponse);
      emit(Authenticated(user: user));
      print(user);
      _prefs.setUser(user);
      _secureStorage.setToken(user.token);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  void logout() {
    _prefs.clear();
    _secureStorage.clear();
    emit(Unauthenticated());
  }
}
