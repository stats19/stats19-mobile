import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/exeptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/league.dart';
import '../../domain/entities/matches_by_league.dart';
import '../../domain/repositories/league_repository.dart';
import '../datasources/league_remote_data_source.dart';

class LeagueRepositoryImpl extends LeagueRepository {
  final LeagueRemoteDataSource remoteDataSource;
//  final NetworkInfo networkInfo;

  LeagueRepositoryImpl({
    @required this.remoteDataSource
//    @required this.networkInfo
  });
  @override
  Future<Either<Failure, List<League>>> getLeagues() async {
    try {
      final leagueList = await remoteDataSource.getLeagues();
      return right(leagueList.leagues);
    } on ServerException {
      return Left(ServerFailure());
    } on BadCredentialsException {
      return Left(BadCredentialsFailure());
    } on NotFoundException {
      return Left(NotFoundFailure());
    }
  }

  @override
  Future<Either<Failure, List<MatchesByLeague>>> getMatchesByLeague(int leagueId) async {
    try {
      final matchesByLeagueList = await remoteDataSource.getMatchesByLeagues(leagueId);
      return right(matchesByLeagueList.matchesByLeague);
    } on ServerException {
      return Left(ServerFailure());
    } on BadCredentialsException {
      return Left(BadCredentialsFailure());
    } on NotFoundException {
      return Left(NotFoundFailure());
    }
  }

}