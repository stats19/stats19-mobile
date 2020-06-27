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
    return await repository.getLeagueRanking(params.leagueId, params.season);
  }
}


class RankingParams extends Equatable {
  final int leagueId;
  final String season;

  RankingParams({@required this.leagueId, @required this.season});

  @override
  List<Object> get props => [leagueId];
}