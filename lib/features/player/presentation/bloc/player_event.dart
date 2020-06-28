part of 'player_bloc.dart';

abstract class PlayerEvent extends Equatable {
   @override
  List<Object> get props => [];
}

class GetPlayerEvent extends PlayerEvent {
  final int playerId;
  final String season;

  GetPlayerEvent({@required this.playerId, this.season = '2015/2016'});

  @override
  List<Object> get props => [playerId];

}