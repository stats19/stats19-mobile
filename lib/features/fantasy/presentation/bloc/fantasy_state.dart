part of 'fantasy_bloc.dart';

abstract class FantasyState extends Equatable {
  const FantasyState();
}


class FantasyInitial extends FantasyState {
  @override
  List<Object> get props => [];
}

class Loading extends FantasyState {
  @override
  List<Object> get props => [];
}

class Loaded extends FantasyState {
  final Fantasy fantasy;

  Loaded({@required this.fantasy});
  @override
  List<Object> get props => [fantasy];
}

class Error extends FantasyState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}
