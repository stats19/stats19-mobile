import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/checked_process.dart';
import '../repositories/forecast_repository.dart';

class CheckProcess extends UseCase<CheckedProcess, NoParams> {
  final ForecastRepository repository;

  CheckProcess(this.repository);

  @override
  Future<Either<Failure, CheckedProcess>> call(NoParams params) async {
    return await repository.checkProcess();
  }
}