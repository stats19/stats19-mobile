part of 'leagues_bloc.dart';

abstract class LeaguesEvent extends Equatable {
  List<Object> get props => [];
}

class GetLeaguesEvent extends LeaguesEvent {}

class GetMatchByLeagueEvent extends LeaguesEvent {
  final int leagueId;
  final bool played;

  GetMatchByLeagueEvent({this.leagueId, this.played = false});
}

class GetRankingEvent extends LeaguesEvent {
  final int leagueId;

  GetRankingEvent(this.leagueId);
}
