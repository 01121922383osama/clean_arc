import 'package:clean_arc/core/errors/errors.dart';
import 'package:fpdart/fpdart.dart';

abstract class UseCases<Type> {
  Future<Either<Failure, Type>> call();
}
