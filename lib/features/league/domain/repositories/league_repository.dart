import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/league.dart';
import '../entities/league_ranking.dart';
import '../entities/matches_by_league.dart';

abstract class LeagueRepository {
  Future<Either<Failure, List<League>>> getLeagues();
  Future<Either<Failure, MatchesByLeague>> getMatchesByLeague(int leagueId, bool played);
  Future<Either<Failure, LeagueRanking>> getLeagueRanking(int leagueId);
}