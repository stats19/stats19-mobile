import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:stat19_app_mobile/features/league/domain/entities/league_ranking.dart';
import 'package:stat19_app_mobile/features/navigation/data/datasources/forecast_remote_data_source.dart';
import 'package:stat19_app_mobile/features/navigation/domain/entities/forecast.dart';
import 'package:stat19_app_mobile/features/navigation/domain/repositories/forecast_repository.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';

class ForecastRepositoryImpl extends ForecastRepository {
  final ForecastRemoteDataSource remoteDataSource;

  ForecastRepositoryImpl({@required this.remoteDataSource});

  @override
  Future<Either<Failure, Forecast>> refreshForecast() async {
    try {
      final forecastResult = await remoteDataSource.refreshForecast();
      return right(forecastResult);
    } on ServerException {
      return Left(ServerFailure());
    } on BadCredentialsException {
      return Left(BadCredentialsFailure());
    } on NotFoundException {
      return Left(NotFoundFailure());
    }
  }

}