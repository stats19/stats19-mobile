import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Player extends Equatable {
  final int playerId;
  final String name;
  final int weight;
  final int height;

  Player(
      {@required this.playerId,
      @required this.name,
      @required this.weight,
      @required this.height});

  @override
  List<Object> get props => [playerId, name, weight, height];

  @override
  bool get stringify => true;
}