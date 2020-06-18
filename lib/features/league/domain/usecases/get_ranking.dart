import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/league_ranking.dart';
import '../repositories/league_repository.dart';

class GetRanking extends UseCase<LeagueRanking, Params> {
  final LeagueRepository repository;

  GetRanking(this.repository);

  @override
  Future<Either<Failure, LeagueRanking>> call(Params params) async {
    return await repository.getLeagueRanking(params.leagueId);
  }
}


class Params extends Equatable {
  final int leagueId;

  Params({@required this.leagueId});

  @override
  List<Object> get props => [leagueId];
}