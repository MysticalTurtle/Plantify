import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:recog_plantify/core/config/preferences.dart';
import 'package:recog_plantify/domain/repositories/verify_email_repository.dart';

part 'verify_email_state.dart';

class SendEmailCubit extends Cubit<SendEmailState> {
  SendEmailCubit({required this.repository}) : super(SendEmailInitial());

  final SendEmailRepository repository;

  void verifyEmail() async {
    emit(SendEmailLoading());
    SecureStoragePlantify prefs = SecureStoragePlantify();
    String? token = await prefs.getToken();
    var response = await repository.sendEmail(token!);

    response.fold(
      (failure) => {
        SendEmailFailure(message: failure.message),
    },
    (apiKey) {
      emit(SendEmailSuccess());
    });
  }
}
