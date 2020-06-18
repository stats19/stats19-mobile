part of 'team_bloc.dart';

abstract class TeamState extends Equatable {
  List<Object> get props => [];
}

class Empty extends TeamState {
  @override
  List<Object> get props => [];
}

class Loading extends TeamState {}
class Loaded extends TeamState {
  final Team team;

  Loaded({@required this.team});

  List<Object> get props => [team];
}

class Error extends TeamState {
  final String message;

  Error({@required this.message});

  List<Object> get props => [message];
}