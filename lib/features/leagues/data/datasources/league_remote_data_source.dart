import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/config/constant.dart';
import '../../../../core/error/exeptions.dart';
import '../models/league_model.dart';
import '../models/matches_by_league._model.dart';


abstract class LeagueRemoteDataSource {
  /// calls the /login
  ///
  /// Throws a [BadCredentialsException] for 403 error code.
  /// Throws a [NotFoundException] for 404 error code.
  /// Throws a [ServerException] for all other error codes.
  Future<LeagueListModel> getLeagues();
  /// calls the /register
  ///
  /// Throws a [BadRequestException] for 400 error code.
  /// Throws a [ServerException] for all other error codes.
  Future<MatchesByLeagueListModel> getMatchesByLeagues(int leagueId);
}

class LeagueRemoteDataSourceImpl implements LeagueRemoteDataSource {
  final http.Client client;
  final SharedPreferences sharedPreferences;

  LeagueRemoteDataSourceImpl({@required this.client, @required this.sharedPreferences});
  @override
  Future<LeagueListModel> getLeagues() async {
    final String token = this.sharedPreferences.getString(CACHED_AUTH_TOKEN);
    final response = await client.get(HOST + '/api/leagues',
        headers: {'Content-Type': 'application/json', 'authorization': token});

    if (response.statusCode == 200) {
      return LeagueListModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 403) {
      throw BadCredentialsException();
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MatchesByLeagueListModel> getMatchesByLeagues(int leagueId) async {
    final response = await client.get(HOST + '/api/leagues/$leagueId/matches',
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      return MatchesByLeagueListModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 403) {
      throw BadCredentialsException();
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else {
      throw ServerException();
    }
  }



}