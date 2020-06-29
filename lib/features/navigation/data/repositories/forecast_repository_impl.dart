import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/checked_process.dart';
import '../../domain/entities/forecast.dart';
import '../../domain/repositories/forecast_repository.dart';
import '../datasources/forecast_remote_data_source.dart';

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

  @override
  Future<Either<Failure, CheckedProcess>> checkProcess() async {
    try {
      final checked = await remoteDataSource.checkProcess();
      return right(checked);
    } on ServerException {
      return Left(ServerFailure());
    } on BadCredentialsException {
      return Left(BadCredentialsFailure());
    } on NotFoundException {
      return Left(NotFoundFailure());
    }
  }

}