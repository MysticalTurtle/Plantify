part of 'api_key_cubit.dart';

@immutable
abstract class ApiKeyState {}

class ApiKeyNotAsked extends ApiKeyState {}

class ApiKeyNotConfirmed extends ApiKeyState {}

class ApiKeyConfirmed extends ApiKeyState {
  final String token;
  ApiKeyConfirmed({required this.token});
}
