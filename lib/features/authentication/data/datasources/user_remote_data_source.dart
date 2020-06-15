import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/config/constant.dart';
import '../../../../core/error/exceptions.dart';
import '../models/user_model.dart';

abstract class UserRemoteDataSource {
  /// calls the /login
  ///
  /// Throws a [BadCredentialsException] for 403 error code.
  /// Throws a [ServerException] for all other error codes.
  Future<UserModel> loginUser(String username, String email);
  /// calls the /register
  ///
  /// Throws a [BadRequestException] for 400 error code.
  /// Throws a [ServerException] for all other error codes.
  Future<UserModel> registerUser(String username, String email, String password);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;
  final SharedPreferences sharedPreferences;

  UserRemoteDataSourceImpl({@required this.client, @required this.sharedPreferences});
  @override
  Future<UserModel> loginUser(String username, String password) async {
    final response = await client.post(HOST + '/login',
        body: json.encode({'username': username, 'password': password}),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      if(response.headers.containsKey('authorization')){
        final token = response.headers['authorization'];
        this.sharedPreferences.setString(CACHED_AUTH_TOKEN, token);
      }else{
        throw ServerException();
      }
      return UserModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 403) {
      throw BadCredentialsException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> registerUser(String username, String email, String password) {
    // TODO: implement registerUser
    return null;
  }

}