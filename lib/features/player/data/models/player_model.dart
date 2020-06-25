import 'package:flutter/cupertino.dart';
import 'package:stat19_app_mobile/features/player/domain/entities/player.dart';

class PlayerModel extends Player {
  PlayerModel(
      {@required playerId,
      @required name,
      @required weight,
      @required height,
      @required age,
      @required playedMatches,
      @required fouls,
      @required redCards,
      @required yellowCards,
      @required shotOnTarget,
      @required score,
      @required goals})
      : super(
            playerId: playerId,
            name: name,
            weight: weight,
            height: height,
            age: age,
            playedMatches: playedMatches,
            fouls: fouls,
            redCards: redCards,
            yellowCards: yellowCards,
            shotOnTarget: shotOnTarget,
            score: score,
            goals: goals);

  factory PlayerModel.fromJson(Map<String, dynamic> json) {
    return PlayerModel(
      playerId: json['playerId'],
      name: json['name'],
      age: json['age'],
      weight: json['weight'],
      height: json['height'],
      playedMatches: json['playedMatches'],
      fouls: json['fouls'],
      redCards: json['redCards'],
      yellowCards: json['yellowCards'],
      shotOnTarget: json['shotOnTarget'],
      score: json['score'],
      goals: json['goals'],
    );
  }
}
