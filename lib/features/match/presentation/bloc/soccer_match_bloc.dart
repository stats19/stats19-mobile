import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../authentication/presentation/bloc/user_bloc.dart';
import '../../domain/entities/soccer_match.dart';
import '../../domain/usecases/get_soccer_match.dart';

part 'soccer_match_event.dart';
part 'soccer_match_state.dart';

class SoccerMatchBloc extends Bloc<SoccermatchEvent, SoccerMatchState> {
  final GetSoccerMatch getSoccerMatch;

  SoccerMatchBloc({@required this.getSoccerMatch});

  @override
  SoccerMatchState get initialState => Empty();

  @override
  Stream<SoccerMatchState> mapEventToState(
    SoccermatchEvent event,
  ) async* {
    if (event is GetSoccerMatchEvent) {
      yield Loading();
      final failureOrLeagues = await getSoccerMatch(Params(matchId: event.matchId));
      yield failureOrLeagues.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (soccerMatch) => Loaded(soccerMatch: soccerMatch));
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
