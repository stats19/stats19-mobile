import 'dart:async';
import 'dart:math';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stat19_app_mobile/core/error/failures.dart';
import 'package:stat19_app_mobile/features/authentication/presentation/bloc/user_bloc.dart';
import 'package:stat19_app_mobile/features/team/domain/entities/team.dart';
import 'package:stat19_app_mobile/features/team/domain/usecases/GetTeam.dart';

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
