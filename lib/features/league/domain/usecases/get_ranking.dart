import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/league_ranking.dart';
import '../repositories/league_repository.dart';

class GetRanking extends UseCase<LeagueRanking, RankingParams> {
  final LeagueRepository repository;

  GetRanking(this.repository);

  @override
  Future<Either<Failure, LeagueRanking>> call(RankingParams params) async {
    return await repository.getLeagueRanking(params.leagueId);
  }
}


class RankingParams extends Equatable {
  final int leagueId;

  RankingParams({@required this.leagueId});

  @override
  List<Object> get props => [leagueId];
}