import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';
class RegisterUser extends UseCase<User, RegisterParams> {
  final UserRepository repository;

  RegisterUser(this.repository);

  @override
  Future<Either<Failure, User>> call(RegisterParams params) async {
    return await repository.registerUser(params.username, params.email, params.password);
  }

}

class RegisterParams extends Equatable {
  final String username;
  final String email;
  final String password;

  RegisterParams({@required this.username, @required this.email, @required this.password});

  @override
  List<Object> get props => [username, email, password];
}