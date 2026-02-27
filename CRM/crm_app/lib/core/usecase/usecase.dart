import 'package:crm_app/core/errors/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract class Usecase<Type , Params> {
  Future<Either<Failure , Type>> call (Params params);
}

class NoParams{}