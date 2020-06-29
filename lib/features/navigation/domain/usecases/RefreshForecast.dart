import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/forecast.dart';
import '../repositories/forecast_repository.dart';

class RefreshForecast extends UseCase<Forecast, NoParams> {
  final ForecastRepository repository;

  RefreshForecast(this.repository);

  @override
  Future<Either<Failure, Forecast>> call(NoParams params) async {
    return await repository.refreshForecast();
  }
}