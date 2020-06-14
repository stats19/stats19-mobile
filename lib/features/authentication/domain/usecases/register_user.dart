import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';
class RegisterUser extends UseCase<User, Params> {
  final UserRepository repository;

  RegisterUser(this.repository);

  @override
  Future<Either<Failure, User>> call(Params params) async {
    return await repository.registerUser(params.username, params.email, params.password);
  }

}

class Params extends Equatable {
  final String username;
  final String email;
  final String password;

  Params({@required this.username, @required this.email, @required this.password});

  @override
  // TODO: implement props
  List<Object> get props => [username, email, password];
}