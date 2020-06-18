import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/team.dart';
import '../repositories/team_repository.dart';

class GetTeam extends UseCase<Team, Params> {
  final TeamRepository repository;

  GetTeam(this.repository);

  @override
  Future<Either<Failure, Team>> call(Params params) async {
    return await repository.getTeam(params.teamId);
  }
}


class Params extends Equatable {
  final int teamId;

  Params({@required this.teamId});

  @override
  List<Object> get props => [teamId];
}