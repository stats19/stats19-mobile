import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/league.dart';
import '../entities/matches_by_league.dart';

abstract class LeagueRepository {
  Future<Either<Failure, List<League>>> getLeagues();
  Future<Either<Failure, List<MatchesByLeague>>> getMatchesByLeague(int leagueId);
}