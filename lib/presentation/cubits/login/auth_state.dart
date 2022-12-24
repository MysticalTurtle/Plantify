part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class Authenticated extends AuthState {
  final User user;

  Authenticated({required this.user});
}

class AuthFailure extends AuthState{
  final String message;

  AuthFailure({required this.message});

  @override
  List<Object?> get props => [message];
}

class Unauthenticated extends AuthState {}

class AuthLoading extends AuthState {}

class OnboardingNotViewed extends AuthState {}



