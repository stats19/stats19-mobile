import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/config/constant.dart';
import '../../../../core/error/exceptions.dart';
import '../models/league_model.dart';
import '../models/league_ranking_model.dart';
import '../models/matches_by_league_model.dart';


abstract class LeagueRemoteDataSource {
  /// calls the /leagues
  ///
  /// Throws a [BadCredentialsException] for 403 error code.
  /// Throws a [NotFoundException] for 404 error code.
  /// Throws a [ServerException] for all other error codes.
  Future<LeagueListModel> getLeagues();
  /// calls the /leagues/$leagueId/matches
  ///
  /// Throws a [BadRequestException] for 400 error code.
  /// Throws a [ServerException] for all other error codes.
  Future<MatchesByLeagueModel> getMatchesByLeagues(int leagueId, bool played);
  /// calls the /leagues/$leagueId/ranking
  ///
  /// Throws a [BadRequestException] for 400 error code.
  /// Throws a [ServerException] for all other error codes.
  Future<LeagueRankingModel> getRanking(int leagueId, String season);
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
  Future<MatchesByLeagueModel> getMatchesByLeagues(int leagueId, bool played) async {
    final String token = this.sharedPreferences.getString(CACHED_AUTH_TOKEN);
    final response = await client.get(HOST + '/api/leagues/$leagueId/matches?played=$played',
        headers: {'Content-Type': 'application/json', 'authorization': token});

    if (response.statusCode == 200) {
      return MatchesByLeagueModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 403) {
      throw BadCredentialsException();
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<LeagueRankingModel> getRanking(int leagueId, String season) async {
    final String token = this.sharedPreferences.getString(CACHED_AUTH_TOKEN);
    final response = await client.get(HOST + '/api/leagues/$leagueId/ranking?season=$season',
        headers: {'Content-Type': 'application/json', 'authorization': token});

    if (response.statusCode == 200) {
      return LeagueRankingModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 403) {
      throw BadCredentialsException();
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else {
      throw ServerException();
    }
  }



}