import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../authentication/presentation/bloc/user_bloc.dart';
import '../../domain/usecases/CheckProcess.dart';
import '../../domain/usecases/RefreshForecast.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  final RefreshForecast refreshForecast;
  final CheckProcess checkProcess;

  NavigationBloc({this.refreshForecast, this.checkProcess});

  @override
  NavigationState get initialState => NavigationInitial();

  @override
  Stream<NavigationState> mapEventToState(
    NavigationEvent event,
  ) async* {
    if (event is RefreshForecastEvent) {
      yield Loading();
      final failureOrForecast = await refreshForecast(NoParams());
      yield await failureOrForecast.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (forecast) async => await waitProcess());
    }
  }

  Future<NavigationState> waitProcess() async {
    final process = await checkProcess(NoParams());
    return await process.fold(
        (failure) => Error(message: _mapFailureToMessage(failure)), (p) async {
          print(p.retry);
      if (!p.retry) {
        return Loaded();
      }
      await Future.delayed(const Duration(seconds: 2));
      return waitProcess();
    });
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
