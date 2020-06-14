part of 'soccer_match_bloc.dart';

abstract class SoccerMatchState extends Equatable {
   List<Object> get props => [];
}

class Empty extends SoccerMatchState {}

class Loading extends SoccerMatchState {}
class Loaded extends SoccerMatchState {
  final SoccerMatch soccerMatch;

  Loaded({@required this.soccerMatch});

  List<Object> get props => [soccerMatch];
}

class Error extends SoccerMatchState {
  final String message;

  Error({@required this.message});

  List<Object> get props => [message];
}