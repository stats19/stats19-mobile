import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:stat19_app_mobile/features/soccer_search/data/datasources/soccer_search_remote_data_source.dart';
import 'package:stat19_app_mobile/features/soccer_search/domain/entities/soccer_search.dart';
import 'package:stat19_app_mobile/features/soccer_search/domain/repositories/soccer_search_repository.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';

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