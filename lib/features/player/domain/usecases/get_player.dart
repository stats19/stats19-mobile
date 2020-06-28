import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/player.dart';
import '../repositories/player_repository.dart';

class GetPlayer extends UseCase<Player, Params> {
  final PlayerRepository repository;

  GetPlayer(this.repository);

  @override
  Future<Either<Failure, Player>> call(Params params) async {
    return await repository.getPlayer(params.playerId, params.season);
  }
}

class Params extends Equatable {
  final int playerId;
  final String season;

  Params({@required this.playerId, @required this.season});

  @override
  List<Object> get props => [playerId];
}