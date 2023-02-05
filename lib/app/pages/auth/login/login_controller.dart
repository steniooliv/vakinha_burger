// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vakinha_burger/app/core/exceptions/unauthorized_exceptions.dart';
import 'package:vakinha_burger/app/pages/auth/login/login_state.dart';
import 'package:vakinha_burger/app/repositories/auth/auth_repository.dart';

class LoginController extends Cubit<LoginState> {
  final AuthRepository _authRepository;
  LoginController(
    this._authRepository,
  ) : super(const LoginState.initial());

  Future<void> login(String email, String password) async {
    try {
      emit(state.copyWith(status: LoginStatus.loading));
      final authModel = await _authRepository.login(email, password);
      final sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString("accessToken", authModel.accessToken);
      sharedPreferences.setString("refreshToken", authModel.refreshToken);
      emit(state.copyWith(status: LoginStatus.success));
    } on UnauthorizedException catch (e, s) {
      log("Login ou senha inválidos", error: e, stackTrace: s);
      emit(state.copyWith(
          status: LoginStatus.loginErro,
          errorMessage: "Login ou senha inválidos"));
    } catch (e, s) {
      log("Erro ao realizar login", error: e, stackTrace: s);
      emit(state.copyWith(
          status: LoginStatus.error, errorMessage: "Erro ao realizar login"));
    }
  }
}
