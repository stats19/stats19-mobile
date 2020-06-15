import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/soccer_search.dart';
import '../repositories/soccer_search_repository.dart';

class GetSoccerSearch extends UseCase<SoccerSearch, Params> {
  final SoccerSearchRepository repository;

  GetSoccerSearch(this.repository);

  @override
  Future<Either<Failure, SoccerSearch>> call(Params params) async {
    return await repository.getSoccerSearch(params.searchStr);
  }
}

class Params extends Equatable {
  final String searchStr;

  Params({@required this.searchStr});

  @override
  List<Object> get props => [searchStr];
}
