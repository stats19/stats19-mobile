import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/matches_by_league.dart';
import '../repositories/league_repository.dart';

class GetMatchesByLeagues extends UseCase<MatchesByLeague, MatchesLeagueParams> {
  final LeagueRepository repository;

  GetMatchesByLeagues(this.repository);

  @override
  Future<Either<Failure, MatchesByLeague>> call(MatchesLeagueParams params) async {
    return await repository.getMatchesByLeague(params.leagueId);
  }
}

class MatchesLeagueParams extends Equatable {
  final int leagueId;

  MatchesLeagueParams({@required this.leagueId});

  @override
  List<Object> get props => [leagueId];
}
