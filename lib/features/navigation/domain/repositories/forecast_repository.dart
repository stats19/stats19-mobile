import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/checked_process.dart';
import '../entities/forecast.dart';

abstract class ForecastRepository {
  Future<Either<Failure, Forecast>> refreshForecast();
  Future<Either<Failure, CheckedProcess>> checkProcess();
}