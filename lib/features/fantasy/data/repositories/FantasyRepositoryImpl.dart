import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/fantasy.dart';
import '../../domain/repositories/fantasy_repository.dart';
import '../datasources/fantasy_remote_data_source.dart';

class FantasyRepositoryImpl extends FantasyRepository {
  final FantasyRemoteDataSource remoteDataSource;

  FantasyRepositoryImpl({@required this.remoteDataSource});

  @override
  Future<Either<Failure, Fantasy>> getFantasyPlayers() async {
    try {
      final players = await remoteDataSource.getFantasyPlayers();
      return right(players);
    } on ServerException {
      return Left(ServerFailure());
    } on BadCredentialsException {
      return Left(BadCredentialsFailure());
    } on NotFoundException {
      return Left(NotFoundFailure());
    }
  }
}
