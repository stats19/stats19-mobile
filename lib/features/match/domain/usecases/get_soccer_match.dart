import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/soccer_match.dart';
import '../repositories/soccer_match_repository.dart';

class GetSoccerMatch extends UseCase<SoccerMatch, Params> {
  final SoccerMatchRepository repository;

  GetSoccerMatch(this.repository);

  @override
  Future<Either<Failure, SoccerMatch>> call(Params params) async {
    return await repository.getSoccerMatch(params.matchId);
  }
}

class Params extends Equatable {
  final int matchId;

  Params({@required this.matchId});

  @override
  List<Object> get props => [matchId];
}
