import 'package:bloc/bloc.dart';
import 'package:crm_app/features/auth/domain/auth_usecase.dart';
import 'package:crm_app/features/auth/domain/user_entity.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignInUsecase signInUsecase;
  final SignUpUsecase signUpUsecase;

  AuthCubit(this.signInUsecase , this.signUpUsecase) : super(AuthInitial());

  Future<void> signIn( String email , String password) async {
    emit(AuthLoading());
    final result = await signInUsecase(SigningParams(email, password));
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(AuthSuccess(user))
    );
  }

  Future<void> signUp( String email , String password) async {
    emit(AuthLoading());
    final result = await signUpUsecase(SigningParams(email, password));
    result.fold(
      (failure) => emit (AuthError(failure.message)), 
      (user) => emit(AuthSignUpSuccess(user)));
  }
}
