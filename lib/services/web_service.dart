import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stat19_app_mobile/models/league-model.dart';
import 'package:stat19_app_mobile/models/user-model.dart';

/**
 * Class WebService being a singleton to handle data such the auth token
 */
class WebService {
  static final WebService _singleton = WebService._internal();
  String _token;
  String get token => _token;
  final String SERVER_IP = "http://192.168.0.35:8080";
  final http.Client client = new http.Client();
  static final int codeOk = 200;
  static final String _autorizationIndex = "authorization";
  User _currentUser;
  User get currentUser => _currentUser;

  factory WebService(){
    return _singleton;
  }

  WebService._internal();

  /**
   * Async method in charge to connect a user
   * the received token is stocked in _token attribute to be reused anywhere in the app
   */
  Future auth(User user) async {
    print("WebService.auth($user)");
    var url = "$SERVER_IP/login";

    Map data = {
      "username": user.username,
      "password": user.password
    };

    var body = json.encode(data);
    //new test
    http.Response res = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: body
    );

    if(res.statusCode == WebService.codeOk){
      if(res.headers.containsKey(WebService._autorizationIndex)){
        this._token = res.headers[WebService._autorizationIndex];
        this._currentUser = new User();
        this._currentUser.username = user.username;
      }else{
        throw Exception("no token found");
      }
    }else{
      throw Exception("bad status code : ${res.statusCode}");
    }
  }

  Future<LeaguesList> getLeagues() async {
    print("WebService.GetLeagues()");
    LeaguesList ret;
    String url = "$SERVER_IP/api/leagues";
    http.Response res = await http.get(url,
      headers: {"Content-Type": "application/json", "authorization": this._token}
    );

    if(res.statusCode == WebService.codeOk){
      var body = json.decode(res.body);
      ret = new LeaguesList.fromJson(body);
    }else{
      throw Exception("bad status code : ${res.statusCode}");
    }
    return ret;
  }
}