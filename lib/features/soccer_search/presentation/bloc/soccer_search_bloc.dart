import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../authentication/presentation/bloc/user_bloc.dart';
import '../../domain/entities/soccer_search.dart';
import '../../domain/usecases/get_soccer_search.dart';

part 'soccer_search_event.dart';
part 'soccer_search_state.dart';

class SoccerSearchBloc extends Bloc<SoccerSearchEvent, SoccerSearchState> {
  final GetSoccerSearch getSoccerSearch;

  SoccerSearchBloc({@required this.getSoccerSearch});
  @override
  SoccerSearchState get initialState => Empty();
  @override
  Stream<SoccerSearchState> mapEventToState(
    SoccerSearchEvent event,
  ) async* {;
    if (event is GetSoccerSearchEvent) {
      yield Loading();
      final failureOrLeagues = await getSoccerSearch(Params(searchStr: event.searchStr));
      yield failureOrLeagues.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (soccerSearch) => Loaded(results: soccerSearch));
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
