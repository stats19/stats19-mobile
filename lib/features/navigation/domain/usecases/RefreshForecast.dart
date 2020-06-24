import 'package:dartz/dartz.dart';
import 'package:stat19_app_mobile/features/navigation/domain/entities/forecast.dart';
import 'package:stat19_app_mobile/features/navigation/domain/repositories/forecast_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class RefreshForecast extends UseCase<Forecast, NoParams> {
  final ForecastRepository repository;

  RefreshForecast(this.repository);

  @override
  Future<Either<Failure, Forecast>> call(NoParams params) async {
    return await repository.refreshForecast();
  }
}