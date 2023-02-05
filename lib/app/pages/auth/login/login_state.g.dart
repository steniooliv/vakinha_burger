// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension LoginStatusMatch on LoginStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() success,
      required T Function() loginErro,
      required T Function() error}) {
    final v = this;
    if (v == LoginStatus.initial) {
      return initial();
    }

    if (v == LoginStatus.loading) {
      return loading();
    }

    if (v == LoginStatus.success) {
      return success();
    }

    if (v == LoginStatus.loginErro) {
      return loginErro();
    }

    if (v == LoginStatus.error) {
      return error();
    }

    throw Exception('LoginStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? success,
      T Function()? loginErro,
      T Function()? error}) {
    final v = this;
    if (v == LoginStatus.initial && initial != null) {
      return initial();
    }

    if (v == LoginStatus.loading && loading != null) {
      return loading();
    }

    if (v == LoginStatus.success && success != null) {
      return success();
    }

    if (v == LoginStatus.loginErro && loginErro != null) {
      return loginErro();
    }

    if (v == LoginStatus.error && error != null) {
      return error();
    }

    return any();
  }
}
