import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/team.dart';

abstract class TeamRepository {
  Future<Either<Failure, Team>> getTeam(int teamId, String season);
}