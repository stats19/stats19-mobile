import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/league.dart';
import '../repositories/league_repository.dart';

class GetLeagues extends UseCase<List<League>, NoParams> {
  final LeagueRepository repository;

  GetLeagues(this.repository);

  @override
  Future<Either<Failure, List<League>>> call(NoParams params) async {
    return await repository.getLeagues();
  }
}