import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/features/team/domain/entities/team.dart';
import 'package:stat19_app_mobile/features/team/presentation/bloc/team_bloc.dart';

class TeamHeader extends StatelessWidget {
  final int teamId;
  const TeamHeader({
    Key key, this.teamId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 35,
        left: 35,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0)),
          color: Colors.blueGrey[700],
          boxShadow: [
            BoxShadow(color: Colors.grey, spreadRadius: 3)
          ]
      ),

      padding: EdgeInsets.all(10),
      child:
      BlocBuilder<TeamBloc, TeamState>(
          builder: (context, state) {
            if ((state is Empty)) {
              BlocProvider.of<TeamBloc>(context)
                  .add(GetTeamEvent(teamId));
              return Container();
            } else if (state is Loading) {
              return CircularProgressIndicator();
            } else if (state is Loaded) {
              return  Column(
                children: <Widget>[
                  TeamName(teamName: state.team.name),
                  TeamLeagueWidget(league: state.team.league,),
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
    return Container(
        padding: EdgeInsets.only(
          top: 5,
          left: 10,
          right: 10,
          bottom: 5,
        ),
        decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.all(Radius.circular(15))
        ),
        child: Text(league.name, style : TextStyle(color: Colors.white,  fontSize: 18,), textAlign: TextAlign.center,));
  }
}

class TeamName extends StatelessWidget {
  final String teamName;
  const TeamName({
    Key key, this.teamName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[

        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.tag_faces,
              size: 80,
            ),
          ),
        ),
        Expanded(
            flex : 3,
            child: Text(teamName,
              style : TextStyle(color: Colors.white,  fontSize: 35,),
              textAlign: TextAlign.center,)),
      ],
    );
  }
}