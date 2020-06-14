import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/config/constant.dart';
import '../../../../core/error/exeptions.dart';
import '../models/soccer_match_model.dart';


abstract class SoccerMatchRemoteDataSource {
  /// calls the /api/match/{matchId}/formatted
  ///
  /// Throws a [BadCredentialsException] for 403 error code.
  /// Throws a [NotFoundException] for 404 error code.
  /// Throws a [ServerException] for all other error codes.
  Future<SoccerMatchModel> getSoccerMatch(int matchId);
}

class SoccerMatchRemoteDataSourceImpl implements SoccerMatchRemoteDataSource {
  final http.Client client;
  final SharedPreferences sharedPreferences;

  SoccerMatchRemoteDataSourceImpl({@required this.client, @required this.sharedPreferences});
  @override
  Future<SoccerMatchModel> getSoccerMatch(int matchId) async {
    final String token = this.sharedPreferences.getString(CACHED_AUTH_TOKEN);
    final response = await client.get(HOST + '/api/matches/$matchId/formatted',
        headers: {'Content-Type': 'application/json', 'authorization': token});

    if (response.statusCode == 200) {
      return SoccerMatchModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 403) {
      throw BadCredentialsException();
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else {
      throw ServerException();
    }
  }

}