import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/team.dart';
import '../../domain/repositories/team_repository.dart';
import '../datasources/team_remote_data_source.dart';

class TeamRepositoryImpl extends TeamRepository {
  final TeamRemoteDataSource remoteDataSource;

  TeamRepositoryImpl({
    @required this.remoteDataSource
  });

  @override
  Future<Either<Failure, Team>> getTeam(int teamId, String season) async {
    try {
      final team = await remoteDataSource.getTeam(teamId, season);
      return right(team);
    } on ServerException {
      return Left(ServerFailure());
    } on BadCredentialsException {
      return Left(BadCredentialsFailure());
    } on NotFoundException {
      return Left(NotFoundFailure());
    }
  }

}