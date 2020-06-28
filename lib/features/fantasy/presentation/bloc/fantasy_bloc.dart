import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../authentication/presentation/bloc/user_bloc.dart';
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
    if (event is GetFantasyEvent) {
      final failureOrFantasy = await getFantasy(NoParams());
      yield failureOrFantasy.fold(
              (failure) => Error(message: _mapFailureToMessage(failure)),
              (fantasy) => Loaded(fantasy: fantasy));
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
