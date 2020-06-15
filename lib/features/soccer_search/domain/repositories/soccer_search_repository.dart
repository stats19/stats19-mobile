import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/soccer_search.dart';

abstract class SoccerSearchRepository {
  Future<Either<Failure, SoccerSearch>> getSoccerSearch(String searchStr);
}