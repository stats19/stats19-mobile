import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/fantasy.dart';

abstract class FantasyRepository {
  Future<Either<Failure, Fantasy>> getFantasyPlayers();
}