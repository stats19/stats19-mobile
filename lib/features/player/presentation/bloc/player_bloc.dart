import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stat19_app_mobile/core/error/failures.dart';
import 'package:stat19_app_mobile/features/authentication/presentation/bloc/user_bloc.dart';
import 'package:stat19_app_mobile/features/player/domain/entities/player.dart';
import 'package:stat19_app_mobile/features/player/domain/usecases/get_player.dart';

part 'player_event.dart';

part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  final GetPlayer getPlayer;

  PlayerBloc({this.getPlayer});

  @override
  PlayerState get initialState => Empty();

  @override
  Stream<PlayerState> mapEventToState(
    PlayerEvent event,
  ) async* {
    if (event is GetPlayerEvent) {
      yield Loading();
      final player = await getPlayer(Params(playerId: event.playerId));
      yield player.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (player) => Loaded(player: player));
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
