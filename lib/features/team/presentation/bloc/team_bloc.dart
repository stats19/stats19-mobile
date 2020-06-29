import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../authentication/presentation/bloc/user_bloc.dart';
import '../../domain/entities/team.dart';
import '../../domain/usecases/GetTeam.dart';

part 'team_event.dart';
part 'team_state.dart';

class TeamBloc extends Bloc<TeamEvent, TeamState> {
  final GetTeam getTeam;

  TeamBloc({@required this.getTeam});

  @override
  TeamState get initialState => Empty();
  @override
  Stream<TeamState> mapEventToState(
    TeamEvent event,
  ) async* {
    if (event is GetTeamEvent) {
        yield Loading();
      final failureOrLeagues = await getTeam(Params(teamId: event.teamId, season: event.season));
      yield failureOrLeagues.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (team) => Loaded(team: team, season: event.season));
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
