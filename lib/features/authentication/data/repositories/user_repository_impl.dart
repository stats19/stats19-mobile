import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_remote_data_source.dart';

class UserRepositoryImpl extends UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({
    @required this.remoteDataSource
  });
  @override
  Future<Either<Failure, User>> loginUser(String username, String email) async {
    try {
      final user = await remoteDataSource.loginUser(username, email);
      return right(user);
    } on ServerException {
      return Left(ServerFailure());
    } on BadCredentialsException {
      return Left(BadCredentialsFailure());
    }
  }

  @override
  Future<Either<Failure, User>> registerUser(String username, String email, String password) {
    // TODO: implement registerUser
    return null;
  }

}