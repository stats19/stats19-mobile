import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/league.dart';
import '../repositories/league_repository.dart';

class GetMatchesByLeagues extends UseCase<List<League>, Params> {
  final LeagueRepository repository;

  GetMatchesByLeagues(this.repository);

  @override
  Future<Either<Failure, List<League>>> call(Params params) async {
    return await repository.getLeagues();
  }
}

class Params extends Equatable {
  final int leagueId;

  Params({@required this.leagueId});

  @override
  List<Object> get props => [leagueId];
}
