import 'package:crm_app/features/auth/data/auth_repo_impl.dart';
import 'package:crm_app/features/auth/data/firebase_auth_datasource.dart';
import 'package:crm_app/features/auth/domain/auth_usecase.dart';
import 'package:crm_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthInjection {
  static AuthCubit provide(){
    final firebaseAuth = FirebaseAuth.instance;
    final datasource = FirebaseAuthDatasourceImpl(firebaseAuth);
    final repository = AuthRepoImpl(datasource);

    final signInUsecase = SignInUsecase(repository);
    final signUpUsecase = SignUpUsecase(repository);

    return AuthCubit(
      signInUsecase,
      signUpUsecase
    );
  }
}