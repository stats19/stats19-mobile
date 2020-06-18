import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:stat19_app_mobile/features/team/data/datasources/team_remote_data_source.dart';
import 'package:stat19_app_mobile/features/team/domain/entities/team.dart';
import 'package:stat19_app_mobile/features/team/domain/repositories/team_repository.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';

class TeamRepositoryImpl extends TeamRepository {
  final TeamRemoteDataSource remoteDataSource;

  TeamRepositoryImpl({
    @required this.remoteDataSource
  });

  @override
  Future<Either<Failure, Team>> getTeam(int teamId) async {
    try {
      final team = await remoteDataSource.getTeam(teamId);
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