import 'package:dartz/dartz.dart';
import 'package:stat19_app_mobile/features/navigation/domain/entities/checked_process.dart';
import 'package:stat19_app_mobile/features/navigation/domain/entities/forecast.dart';

import '../../../../core/error/failures.dart';

abstract class ForecastRepository {
  Future<Either<Failure, Forecast>> refreshForecast();
  Future<Either<Failure, CheckedProcess>> checkProcess();
}