import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/core/presentation/widgets/loading_widget.dart';

import '../../../league/presentation/pages/league_info_page.dart';
import '../../domain/entities/team.dart';
import '../bloc/team_bloc.dart';

class TeamHeader extends StatelessWidget {
  final int teamId;
  const TeamHeader({
    Key key, this.teamId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width:MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(
        right: 30,
        left: 30,
        bottom: 15
      ),
      decoration: BoxDecoration(
        border: Border.all(color:  Colors.blueGrey[700], width: 0.5),
        borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0)
        ),
        color: Colors.blueGrey[500],
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 9,
            spreadRadius: 2.0,
//            offset: (Offset(0, 5))
          )
        ],
      ),
      padding: EdgeInsets.all(10),
      child:
      BlocBuilder<TeamBloc, TeamState>(
          builder: (context, state) {
            if (state is Loading) {
              return LoadingWidget();
            } else if (state is Loaded) {
              return  Column(
                children: <Widget>[
                  TeamName(teamName: state.team.name),
                  Row(
                    children: <Widget>[
                      TeamLeagueWidget(league: state.team.league),
                      TeamFilter(teamId: state.team.teamId, season: state.season)
                    ],
                  ),
                ],
              );
            } else if (state is Error) {
              // return MessageDisplay(message: state.message);
              return Text('there is error' + state.message);
            }
            return Container();
          }),

    );
  }
}

class TeamLeagueWidget extends StatelessWidget {
  final TeamLeague league;
  const TeamLeagueWidget({
    Key key, this.league,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
    RaisedButton(
        elevation: 4,
        padding: EdgeInsets.only(
          top: 3,
          left: 7,
          right: 7,
          bottom: 3,
        ),
        color: Colors.blueGrey[400],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
                return LeagueInfoPage(
                  leagueId: league.leagueId,
                );
              }));
        },
        child: Text(league.name, style : TextStyle(color: Colors.white,  fontSize: 12), textAlign: TextAlign.center,));
  }
}

class TeamName extends StatelessWidget {
  final String teamName;
  const TeamName({
    Key key, this.teamName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(teamName,
          style : TextStyle(color: Colors.white,  fontSize: 25,),
          textAlign: TextAlign.center,));
  }
}

class TeamFilter extends StatelessWidget {
  final String season;
  final int teamId;

  const TeamFilter({Key key, this.season, this.teamId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: DropdownButton<String>(
        value: season,
        elevation: 16,
        onChanged: (String newValue) {
          BlocProvider.of<TeamBloc>(context)
              .add(GetTeamEvent(teamId: teamId, season: newValue));
        },
        items: [
          '2015/2016',
          '2014/2015',
          '2013/2014',
          '2012/2013',
          '2011/2012',
          '2010/2011',
          '2009/2010',
          '2008/2009'
        ]
            .map<DropdownMenuItem<String>>((e) => DropdownMenuItem<String>(
          value: e,
          child: Text(e, style: TextStyle(color: Colors.blueAccent, fontSize: 15, fontWeight: FontWeight.w700),),
        ))
            .toList(),
      ),
    );
  }
}