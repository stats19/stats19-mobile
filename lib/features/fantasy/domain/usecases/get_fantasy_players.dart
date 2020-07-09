import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/fantasy.dart';
import '../repositories/fantasy_repository.dart';

class GetFantasy extends UseCase<Fantasy, Params> {
  final FantasyRepository repository;

  GetFantasy(this.repository);

  @override
  Future<Either<Failure, Fantasy>> call(Params params) async {
    return await repository.getFantasyPlayers(params.page);
  }
}

class Params extends Equatable {
  final int page;

  Params({@required this.page});

  @override
  List<Object> get props => [page];
}