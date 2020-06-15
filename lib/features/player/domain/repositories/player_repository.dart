import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/player.dart';

abstract class PlayerRepository {
  Future<Either<Failure, Player>> getPlayer(int playerId);
}