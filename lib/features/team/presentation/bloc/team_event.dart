part of 'team_bloc.dart';

abstract class TeamEvent extends Equatable {
  List<Object> get props => [];
}

class GetTeamEvent extends TeamEvent {
  final int teamId;

  GetTeamEvent(this.teamId);
}
