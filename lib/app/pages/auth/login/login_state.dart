// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

part 'login_state.g.dart';

@match
enum LoginStatus {
  initial,
  loading,
  success,
  loginErro,
  error,
}

class LoginState extends Equatable {
  final LoginStatus status;
  final String? errorMessage;

  const LoginState(
    this.status,
    this.errorMessage,
  );

  const LoginState.initial()
      : status = LoginStatus.initial,
        errorMessage = null;

  LoginState copyWith({
    LoginStatus? status,
    String? errorMessage,
  }) {
    return LoginState(
      status ?? this.status,
      errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage];
}
