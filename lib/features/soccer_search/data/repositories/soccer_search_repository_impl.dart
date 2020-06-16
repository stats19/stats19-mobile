import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/soccer_search.dart';
import '../../domain/repositories/soccer_search_repository.dart';
import '../datasources/soccer_search_remote_data_source.dart';

class SoccerSearchRepositoryImpl extends SoccerSearchRepository {
  final SoccerSearchRemoteDataSource remoteDataSource;

  SoccerSearchRepositoryImpl({
    @required this.remoteDataSource
  });

  @override
  Future<Either<Failure, SoccerSearch>> getSoccerSearch(String searchStr) async {
    try {
      final soccerSearch = await remoteDataSource.getSoccerSearch(searchStr);
      return right(soccerSearch);
    } on ServerException {
      return Left(ServerFailure());
    } on BadCredentialsException {
      return Left(BadCredentialsFailure());
    } on NotFoundException {
      return Left(NotFoundFailure());
    }
  }

}