
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stat19_app_mobile/core/presentation/widgets/navigation.dart';
import 'package:stat19_app_mobile/core/presentation/widgets/on_push_value.dart';
import 'package:stat19_app_mobile/features/league/domain/entities/matches_by_league.dart';

class EndedMatch extends StatelessWidget {
  final PlayedMatch playedMatch;
  final ValueChanged<OnPushValue> onPush;

  const EndedMatch({
    Key key,
    this.playedMatch, this.onPush,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var win = LinearGradient(
      colors: [Colors.green, Colors.white, Colors.redAccent],
      begin: Alignment.centerLeft,
      stops: [
        0.49,
        0.50,
        0.51
      ],
      end: Alignment.centerRight,
    );
    var lose = LinearGradient(
      colors: [Colors.redAccent, Colors.white, Colors.green],
      begin: Alignment.centerLeft,
      stops: [
        0.49,
        0.50,
        0.51
      ],
      end: Alignment.centerRight,
    );
    var draw = LinearGradient(
      colors: [Colors.grey, Colors.white, Colors.grey],
      begin: Alignment.centerLeft,
      stops: [
        0.49,
        0.50,
        0.51
      ],
      end: Alignment.centerRight,
    );
    var notyet = LinearGradient(
      colors: [Colors.black, Colors.white, Colors.black],
      begin: Alignment.centerLeft,
      stops: [
        0.49,
        0.50,
        0.51
      ],
      end: Alignment.centerRight,
    );

    Gradient gradient = playedMatch.home.goals > playedMatch.away.goals
        ? win
        : playedMatch.home.goals == playedMatch.away.goals
        ? draw
        : playedMatch.home.goals < playedMatch.away.goals ? lose: notyet;

    final String formatted =
    DateFormat.yMMMMEEEEd().format(DateTime.parse(playedMatch.date));
    return FlatButton(
    onPressed: () => onPush(OnPushValue(type: TabNavigatorRoutes.match, id: playedMatch.matchId)),
    child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
          ),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 5),
                width : MediaQuery.of(context).size.width,
                child: Text(
                  formatted,
                  style: TextStyle(color: Colors.blueGrey[500]), textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                width : MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    border: Border.all(color: Colors.white, width: 1),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6.0,
                        color: Colors.black.withOpacity(.7),
                      )
                    ],
                    gradient: gradient
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left:8.0, right: 8.0),
                          child: Text(
                            playedMatch.home.name,
                            style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left:8.0, right: 8.0),
                          child: Text(
                            playedMatch.home.goals.toString() + '   ' + playedMatch.away.goals.toString(),
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left:8.0, right: 8.0),
                          child: Text(
                            playedMatch.away.name,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}