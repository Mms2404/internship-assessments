import 'package:crm_app/core/errors/failures.dart';
import 'package:crm_app/features/auth/domain/user_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepositary {
  Future<Either<Failure , UserEntity>> signIn( String email , String password) ;
  Future<Either<Failure , UserEntity>> signUp (String email , String password);
}