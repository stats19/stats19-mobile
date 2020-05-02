
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stat19_app_mobile/models/league-model.dart';
import 'package:stat19_app_mobile/models/user-model.dart';
import 'api-services.dart';

class LeaguesServices{

  Future<ApiResponse<List<Leagues>>> getLeagues() async{
    return await http.get(ApiArgs.LEAGUES_ENDPOINT(), headers: ApiArgs.header).then((data){
      if(data.statusCode == 200){
        List<Leagues> leagues = new List<Leagues>();
        final jsonData = jsonDecode(data.body);
        int i=0;
        for(var json in jsonData){
            leagues.add(new Leagues.fromjson(json));
            i++;
        }
        return ApiResponse(data:leagues, errorMsg: null);
      }
      return ApiResponse(data:null, errorMsg: "error(s)");
    });//.catchError(return ApiResponse(data:null,  errorMsg: "error(s): not working"); );
  }
}