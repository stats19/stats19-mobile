part of 'soccer_match_bloc.dart';

abstract class SoccermatchEvent extends Equatable {
  List<Object> get props => [];
}


class GetSoccerMatchEvent extends SoccermatchEvent {
  final int matchId;

  GetSoccerMatchEvent(this.matchId);

  @override
  List<Object> get props => [matchId];

}