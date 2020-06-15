part of 'soccer_search_bloc.dart';

abstract class SoccerSearchState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends SoccerSearchState {}

class Loading extends SoccerSearchState {}
class Loaded extends SoccerSearchState {
  final SoccerSearch results;

  Loaded({@required this.results});

  List<Object> get props => [results];
}

class Error extends SoccerSearchState {
  final String message;

  Error({@required this.message});

  List<Object> get props => [message];
}
