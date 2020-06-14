import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> loginUser(String username, String email);
  Future<Either<Failure, User>> registerUser(String username, String email, String password);
}