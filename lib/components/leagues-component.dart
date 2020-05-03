

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stat19_app_mobile/models/league-model.dart';
import 'package:stat19_app_mobile/services/api-services.dart';
import 'package:stat19_app_mobile/services/leagues-services.dart';

class LeaguesView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LeaguesState();
  }
}

class LeaguesState extends State<LeaguesView> {
  ApiResponse<List<Leagues>> _leagues_list_Response;
  bool _isFetching = false;
  double _progressValue = 0.0;

  @override
  void initState() {
    fetchLeaguesList();
    super.initState();
  }

  void fetchLeaguesList() async {
    setState(() {
      _isFetching = true;
    });
    var service = new LeaguesServices();
    _leagues_list_Response = await service.getLeagues();
    print("state: list:"+ _leagues_list_Response.data.toString());
    setState(() {
      _progressValue = 0.0;
      _isFetching = false;
    });
  }

  List<Text> _getTextLeaguesNameWidgets() {
    List<Text> leaguesText = new List<Text>();
    leaguesText.add(Text("Championnats"));
    for (var i = 0; i < _leagues_list_Response.data.length; i++) {
      var league = _leagues_list_Response.data.elementAt(i).toJson();
      print("fetch : " + league['name']);
      leaguesText.add(Text(league['name']));
    }
    return (leaguesText);
  }

  @override
  Widget build(BuildContext context) {
     return Builder(
        builder: (_) {
          if (_isFetching) {
            return CircularProgressIndicator();
          }
          if (_leagues_list_Response.errorMsg != null) {
            return Text("Error: unable to find data");
          }
          if(!_isFetching) return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _getTextLeaguesNameWidgets(),
          );
        }
    );
  }
}