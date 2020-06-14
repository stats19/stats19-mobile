part of 'leagues_bloc.dart';

abstract class LeaguesState extends Equatable {
  List<Object> get props => [];
}

class Empty extends LeaguesState {}
class Loading extends LeaguesState {}
class Loaded extends LeaguesState {
  final List<League> leagues;

  Loaded({@required this.leagues});

  List<Object> get props => [leagues];
}

class Error extends LeaguesState {
  final String message;

  Error({@required this.message});

  List<Object> get props => [message];
}
