part of 'player_bloc.dart';

abstract class PlayerState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends PlayerState {}

class Loading extends PlayerState {}
class Loaded extends PlayerState {
  final Player player;
  final String season;

  Loaded({@required this.player, @required this.season});

  List<Object> get props => [player];
}

class Error extends PlayerState {
  final String message;

  Error({@required this.message});

  List<Object> get props => [message];
}
