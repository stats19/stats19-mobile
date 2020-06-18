import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:stat19_app_mobile/features/league/domain/usecases/get_ranking.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../authentication/presentation/bloc/user_bloc.dart';
import '../../domain/entities/league.dart';
import '../../domain/usecases/get_leagues.dart';
import '../../domain/usecases/get_matches_by_league.dart';

part 'leagues_event.dart';

part 'leagues_state.dart';

class LeaguesBloc extends Bloc<LeaguesEvent, LeaguesState> {
  final GetLeagues getLeagues;
  final GetMatchesByLeagues getMatchesByLeagues;
  final GetRanking getRanking;

  LeaguesBloc({@required this.getLeagues, @required this.getMatchesByLeagues, @required this.getRanking});

  @override
  LeaguesState get initialState => Empty();

  @override
  Stream<LeaguesState> mapEventToState(
    LeaguesEvent event,
  ) async* {
    if (event is GetLeaguesEvent) {
      yield Loading();
      final failureOrLeagues = await getLeagues(NoParams());
      yield failureOrLeagues.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (leagues) => Loaded(leagues: leagues));
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case BadCredentialsFailure:
        return BAD_CREDENTIALS_FAILURE_MESSAGE;
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
