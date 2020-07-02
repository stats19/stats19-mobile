import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Player extends Equatable {
  final int playerId;
  final String name;
  final int weight;
  final int height;
  final int age;
  final int playedMatches;
  final int fouls;
  final int redCards;
  final int yellowCards;
  final int shotOnTarget;
  final double score;
  final int goals;
  final String picture;
  final String countryName;
  final String countryPicture;
  final String teamPicture;
  final int teamId;

  Player(
      {@required this.playerId,
      @required this.name,
      @required this.weight,
      @required this.age,
      @required this.height,
      @required this.playedMatches,
      @required this.fouls,
      @required this.redCards,
      @required this.yellowCards,
      @required this.shotOnTarget,
      @required this.score,
      @required this.goals,
      @required this.picture,
      @required this.countryName,
      @required this.countryPicture,
      @required this.teamPicture,
      @required this.teamId});

  @override
  List<Object> get props => [
        playerId,
        name,
        weight,
        height,
        age,
        playedMatches,
        fouls,
        redCards,
        yellowCards,
        shotOnTarget,
        goals,
        score
      ];

  @override
  bool get stringify => true;
}
