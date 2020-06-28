part of 'team_bloc.dart';

abstract class TeamEvent extends Equatable {
  List<Object> get props => [];
}

class GetTeamEvent extends TeamEvent {
  final int teamId;
  final String season;

  GetTeamEvent({@required this.teamId, this.season = '2015/2016'});
}
