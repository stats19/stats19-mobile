import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stat19_app_mobile/core/error/failures.dart';
import 'package:stat19_app_mobile/core/usecases/usecase.dart';
import 'package:stat19_app_mobile/features/authentication/presentation/bloc/user_bloc.dart';
import 'package:stat19_app_mobile/features/navigation/domain/usecases/RefreshForecast.dart';

part 'navigation_event.dart';

part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  final RefreshForecast refreshForecast;

  NavigationBloc({this.refreshForecast});

  @override
  NavigationState get initialState => NavigationInitial();

  @override
  Stream<NavigationState> mapEventToState(
    NavigationEvent event,
  ) async* {
    if (event is RefreshForecastEvent) {
      yield Loading();
      final failureOrForecast = await refreshForecast(NoParams());
      yield failureOrForecast.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (forecast) => Loaded());
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
