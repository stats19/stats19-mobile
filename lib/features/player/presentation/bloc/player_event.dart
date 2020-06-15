part of 'player_bloc.dart';

abstract class PlayerEvent extends Equatable {
   @override
  List<Object> get props => [];
}

class GetPlayerEvent extends PlayerEvent {
  final int playerId;

  GetPlayerEvent(this.playerId);

  @override
  List<Object> get props => [playerId];

}