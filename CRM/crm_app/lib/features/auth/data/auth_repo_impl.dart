import 'package:crm_app/core/errors/failures.dart';
import 'package:crm_app/features/auth/data/firebase_auth_datasource.dart';
import 'package:crm_app/features/auth/domain/auth_repositary.dart';
import 'package:crm_app/features/auth/domain/user_entity.dart';
import 'package:fpdart/src/either.dart';

class AuthRepoImpl implements AuthRepositary {
  final FirebaseAuthDatasource datasource;

  AuthRepoImpl(this.datasource);

  @override
  Future<Either<Failure, UserEntity>> signIn(String email, String password) async {
    try{
      final user = await datasource.signIn(email, password);
      return Right(user);
    }
    catch(e){
      return Left(AuthFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, UserEntity>> signUp(String email, String password) async {
    try{
      final user = await datasource.signUp(email, password);
      return Right(user);
    }
    catch(e){
      return Left(AuthFailure(e.toString()));
    }
  }}