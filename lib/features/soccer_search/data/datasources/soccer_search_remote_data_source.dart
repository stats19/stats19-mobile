import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stat19_app_mobile/features/soccer_search/data/models/soccer_search_model.dart';

import '../../../../core/config/constant.dart';
import '../../../../core/error/exceptions.dart';


abstract class SoccerSearchRemoteDataSource {
  /// calls the /api/match/{matchId}/formatted
  ///
  /// Throws a [BadCredentialsException] for 403 error code.
  /// Throws a [NotFoundException] for 404 error code.
  /// Throws a [ServerException] for all other error codes.
  Future<SoccerSearchModel> getSoccerSearch(String searchStr);
}

class SoccerSearchRemoteDataSourceImpl implements SoccerSearchRemoteDataSource {
  final http.Client client;
  final SharedPreferences sharedPreferences;

  SoccerSearchRemoteDataSourceImpl({@required this.client, @required this.sharedPreferences});
  @override
  Future<SoccerSearchModel> getSoccerSearch(String searchStr) async {
    final String token = this.sharedPreferences.getString(CACHED_AUTH_TOKEN);
    final response = await client.get(HOST + '/api/search?searchStr=$searchStr',
        headers: {'Content-Type': 'application/json', 'authorization': token});

    if (response.statusCode == 200) {
      return SoccerSearchModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 403) {
      throw BadCredentialsException();
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else {
      throw ServerException();
    }
  }

}