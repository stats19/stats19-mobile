import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../authentication/presentation/bloc/user_bloc.dart';
import '../../domain/entities/fantasy.dart';
import '../../domain/usecases/get_fantasy_players.dart';

part 'fantasy_event.dart';

part 'fantasy_state.dart';

class FantasyBloc extends Bloc<FantasyEvent, FantasyState> {
  final GetFantasy getFantasy;

  FantasyBloc({@required this.getFantasy});

  @override
  FantasyState get initialState => FantasyInitial();

  @override
  Stream<FantasyState> mapEventToState(
    FantasyEvent event,
  ) async* {
    final currentState = state;
    if (event is GetFantasyEvent && !_hasReachedMax(currentState)) {
      if (currentState is FantasyInitial) {
        final failureOrFantasy = await getFantasy(Params(page: 0));
        yield failureOrFantasy.fold(
            (failure) => Error(message: _mapFailureToMessage(failure)),
            (fantasy) =>
                Loaded(fantasy: fantasy, hasReachedMax: false, page: 0));
        return;
      } else if (currentState is Loaded) {
        final failureOrFantasy =
            await getFantasy(Params(page: currentState.page + 1));
        yield failureOrFantasy.fold(
            (failure) => Error(message: _mapFailureToMessage(failure)),
            (fantasy) => ended(fantasy)
                ? currentState.copyWith(hasReachedMax: true)
                : Loaded(
                    fantasy: concatFantasy(currentState.fantasy, fantasy),
                    hasReachedMax: false,
                    page: currentState.page + 1));
      }
    }
  }

  bool _hasReachedMax(FantasyState state) =>
      state is Loaded && state.hasReachedMax;

  bool ended(Fantasy fantasy) {
    return fantasy.forwards.isEmpty ||
        fantasy.defenders.isEmpty ||
        fantasy.middleFielders.isEmpty ||
        fantasy.goalKeepers.isEmpty;
  }

  Fantasy concatFantasy(Fantasy initial, Fantasy added) {
    return Fantasy(
      goalKeepers: initial.goalKeepers + added.goalKeepers,
      defenders: initial.defenders + added.defenders,
      middleFielders: initial.middleFielders + added.middleFielders,
      forwards: initial.forwards + added.forwards,
      date: initial.date,
    );
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
