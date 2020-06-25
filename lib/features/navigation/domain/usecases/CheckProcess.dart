import 'package:dartz/dartz.dart';
import 'package:stat19_app_mobile/features/navigation/domain/entities/checked_process.dart';
import 'package:stat19_app_mobile/features/navigation/domain/repositories/forecast_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class CheckProcess extends UseCase<CheckedProcess, NoParams> {
  final ForecastRepository repository;

  CheckProcess(this.repository);

  @override
  Future<Either<Failure, CheckedProcess>> call(NoParams params) async {
    return await repository.checkProcess();
  }
}