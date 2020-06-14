import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class LoginUser extends UseCase<User, Params> {
  final UserRepository repository;

  LoginUser(this.repository);

  @override
  Future<Either<Failure, User>> call(Params params) async {
    return await repository.loginUser(params.username, params.password);
  }
}

class Params extends Equatable {
  final String username;
  final String password;

  Params({@required this.username, @required this.password});

  @override
  List<Object> get props => [username, password];
}
