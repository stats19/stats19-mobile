import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stat19_app_mobile/features/fantasy/domain/usecases/get_fantasy_players.dart';

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
    // TODO: implement mapEventToState
  }
}
