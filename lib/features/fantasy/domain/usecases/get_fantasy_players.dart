import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/fantasy.dart';
import '../repositories/fantasy_repository.dart';

class GetFantasy extends UseCase<Fantasy, NoParams> {
  final FantasyRepository repository;

  GetFantasy(this.repository);

  @override
  Future<Either<Failure, Fantasy>> call(NoParams params) async {
    return await repository.getFantasyPlayers();
  }
}