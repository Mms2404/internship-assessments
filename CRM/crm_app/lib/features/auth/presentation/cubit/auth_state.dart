part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState{}

class AuthSuccess extends AuthState {
  final UserEntity user;

  AuthSuccess(this.user);

}

class AuthError extends AuthState {
  final String message ;

  AuthError(this.message);
}

// signUp process
 class AuthSignUpSuccess extends AuthState {
  final UserEntity user ;
  AuthSignUpSuccess(this.user);
 }