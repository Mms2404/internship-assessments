import 'package:crm_app/core/errors/failures.dart';
import 'package:crm_app/core/usecase/usecase.dart';
import 'package:crm_app/features/auth/domain/auth_repositary.dart';
import 'package:crm_app/features/auth/domain/user_entity.dart';
import 'package:fpdart/src/either.dart';

class SignInUsecase implements Usecase<UserEntity , SigningParams>{
  final AuthRepositary repositary;

  SignInUsecase(this.repositary);

  @override
  Future<Either<Failure, UserEntity>> call(SigningParams params) {
    return repositary.signIn(params.email, params.password);
  }

}

class SignUpUsecase implements Usecase<UserEntity , SigningParams> {
  final AuthRepositary repository;
  
  SignUpUsecase(this.repository);
  @override
  Future<Either<Failure, UserEntity>> call(SigningParams params) {
    return repository.signUp(
      params.email,
      params.password);
  }  
}

class SigningParams{
  final String email;
  final String password;
  
  SigningParams(this.email  , this.password);
}