part of 'leagues_bloc.dart';

abstract class LeaguesEvent extends Equatable {
  List<Object> get props => [];
}

class GetLeaguesEvent extends LeaguesEvent {}
