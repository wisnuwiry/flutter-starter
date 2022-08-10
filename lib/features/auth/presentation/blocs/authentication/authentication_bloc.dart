import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_starter/core/core.dart';

import 'package:flutter_starter/features/auth/auth.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required this.login,
    required this.logout,
  }) : super(const AuthenticationState.unknown()) {
    on<AuthenticationLoginRequested>(_onAuthenticationLoginRequested);
    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);
  }

  final LoginUseCase login;
  final LogoutUseCase logout;

  /// Handler when add event to Login
  Future _onAuthenticationLoginRequested(
    AuthenticationLoginRequested event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      final result = await login.call(
        const LoginParams(email: 'testemail@gmail.com', password: '12345'),
      );

      emit(
        result.fold(
          (failure) => const AuthenticationState.unauthenticated(),
          AuthenticationState.authenticated,
        ),
      );
      if (result.isRight()) {
        emit(const AuthenticationState.unauthenticated());
      }
    } catch (error, stackTrace) {
      error.recordError(stackTrace: stackTrace);
    }
  }

  /// Handler when add event to Logout
  Future _onAuthenticationLogoutRequested(
    AuthenticationLogoutRequested event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      final result = await logout.call(const NoParams());
      if (result.isRight()) {
        emit(const AuthenticationState.unauthenticated());
      }
    } catch (error, stackTrace) {
      error.recordError(stackTrace: stackTrace);
    }
  }
}
