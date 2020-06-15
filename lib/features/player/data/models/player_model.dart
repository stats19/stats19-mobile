import 'package:flutter/cupertino.dart';
import 'package:stat19_app_mobile/features/player/domain/entities/player.dart';

class PlayerModel extends Player {
  PlayerModel(
      {@required playerId, @required name, @required weight, @required height})
      : super(playerId: playerId, name: name, weight: weight, height: height);

  factory PlayerModel.fromJson(Map<String, dynamic> json) {
    return PlayerModel(
        playerId: json['playerId'],
        name: json['name'],
        weight: json['weight'],
        height: json['height']);
  }
}
