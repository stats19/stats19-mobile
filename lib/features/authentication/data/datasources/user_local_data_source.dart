import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exceptions.dart';

abstract class UserLocalDataSource {
  Future<String> getToken();
  Future<void> saveToken(String token);
}

const CACHED_AUTH_TOKEN = 'CACHED_AUTH_TOKEN';

class UserLocalDataSourceImpl extends UserLocalDataSource {
  final SharedPreferences sharedPreferences;

  UserLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<String> getToken() {
    final token = sharedPreferences.getString(CACHED_AUTH_TOKEN);
    if (token == null) {
      throw NotAuthException();
    }
    return Future.value(token);
  }

  @override
  Future<void> saveToken(String token) {
    return sharedPreferences.setString(CACHED_AUTH_TOKEN, token);
  }
}