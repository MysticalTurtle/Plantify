part of 'verify_email_cubit.dart';

@immutable
abstract class SendEmailState {}

class SendEmailInitial extends SendEmailState {}

class SendEmailLoading extends SendEmailState {}

class SendEmailFailure extends SendEmailState {
  SendEmailFailure({required this.message});
  final String message;
}

class SendEmailSuccess extends SendEmailState {}

