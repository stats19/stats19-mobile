

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stat19_app_mobile/models/league-model.dart';
import 'package:stat19_app_mobile/services/api-services.dart';
import 'package:stat19_app_mobile/services/leagues-services.dart';

class LeaguesView extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return LeaguesState();
  }
}
//TODO a progressive Methode to see times réponse of service task.
class LeaguesState extends State<LeaguesView> {
  ApiResponse<List<Leagues>> _leagues_list_Response;
  bool _isFetching = false;
  @override
  void initState() {
    fetchLeaguesList();
    super.initState();
  }

  void fetchLeaguesList() async {
    setState(() {
      _isFetching = true;
    });
    _leagues_list_Response = await LeaguesServices.getLeagues();

    print("state: list:"+ _leagues_list_Response.data.toString());
    setState(() {
      _isFetching = false;
    });
  }

  List<Text> _getTextLeaguesNameWidgets() {
    List<Text> leaguesText = new List<Text>();
    leaguesText.add(Text("data service leagues"));
    for (var i = 0; i < _leagues_list_Response.data.length; i++) {
      var league = _leagues_list_Response.data.elementAt(i).toJson();
      print("league service fetch : " + league['name']);
      leaguesText.add(Text(league['name']));
    }
    return (leaguesText);
  }

  @override
  Widget build(BuildContext context) {
     return Builder(
        builder: (BuildContext context) {
          if(_isFetching ){
            //TODO stop spinner when le service echoue ou les donneés son vide
              return  _leagues_list_Response==null || _leagues_list_Response.data.isEmpty?CircularProgressIndicator()
                  :Text("Error: unable to find data, no servise available");
          }
            return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _getTextLeaguesNameWidgets(),
            );
        }
    );
  }
}