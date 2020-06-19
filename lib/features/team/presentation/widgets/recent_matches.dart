import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/features/team/presentation/bloc/team_bloc.dart';

class RecentMatches extends StatelessWidget {
  const RecentMatches({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
                "Les derniers matchs",
                style : TextStyle(color: Colors.white,  fontSize: 20)
            ),
          ),
          BlocBuilder<TeamBloc, TeamState>(
              builder: (context, state) {
                if ((state is Empty)) {
                  BlocProvider.of<TeamBloc>(context)
                      .add(GetTeamEvent(5));
                  return Container();
                } else if (state is Loading) {
                  return CircularProgressIndicator();
                } else if (state is Loaded) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ResultBubble(issue: 1,),
                    ],
                  );
                } else if (state is Error) {
                  // return MessageDisplay(message: state.message);
                  return Text('there is error' + state.message);
                }
                return Container();
              }),

        ],
      ),
    );
  }
}

class ResultBubble extends StatelessWidget {
  final int issue;
  const ResultBubble({
    Key key, this.issue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(5),
      width: 25,
      height: 25,
      decoration: BoxDecoration(
          color: issue  == 0 ? Colors.redAccent :issue == 1 ? Colors.grey: Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(50))
      ),
      child: ButtonTheme(
        minWidth: 25,
        height: 25,
        padding: EdgeInsets.all(0),
        child: Align(
          child: FlatButton(
              onPressed: null,
              textColor: Colors.white,
              child: Text( issue == 0 ? "D" : issue == 1 ? "N" : "V", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),)
//              child: Text("N", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),)
          ),
        ),
      ),
    );
  }
}