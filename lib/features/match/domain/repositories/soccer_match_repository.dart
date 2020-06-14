import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/soccer_match.dart';

abstract class SoccerMatchRepository {
  Future<Either<Failure, SoccerMatch>> getSoccerMatch(int matchId);
}