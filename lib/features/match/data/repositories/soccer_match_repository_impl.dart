import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/soccer_match.dart';
import '../../domain/repositories/soccer_match_repository.dart';
import '../datasources/soccer_match_remote_data_source.dart';

class SoccerMatchRepositoryImpl extends SoccerMatchRepository {
  final SoccerMatchRemoteDataSource remoteDataSource;

  SoccerMatchRepositoryImpl({
    @required this.remoteDataSource
  });
  @override
  Future<Either<Failure, SoccerMatch>> getSoccerMatch(int matchId) async {
    try {
      final soccerMatch = await remoteDataSource.getSoccerMatch(matchId);
      return right(soccerMatch);
    } on ServerException {
      return Left(ServerFailure());
    } on BadCredentialsException {
      return Left(BadCredentialsFailure());
    } on NotFoundException {
      return Left(NotFoundFailure());
    }
  }

}