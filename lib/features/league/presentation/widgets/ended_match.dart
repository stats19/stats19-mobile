
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stat19_app_mobile/core/presentation/widgets/match_gradient.dart';
import 'package:stat19_app_mobile/core/presentation/widgets/navigation.dart';
import 'package:stat19_app_mobile/core/presentation/widgets/on_push_value.dart';
import 'package:stat19_app_mobile/features/league/domain/entities/matches_by_league.dart';
import 'package:easy_localization/easy_localization.dart';


class EndedMatch extends StatelessWidget {
  final PlayedMatch playedMatch;
  final ValueChanged<OnPushValue> onPush;

  const EndedMatch({
    Key key,
    this.playedMatch, this.onPush,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var win = winLinearGradient();
    var lose = loseLinearGradient();
    var draw = drawLinearGradient();
    var notyet = notyetLinearGradient();

    Gradient playedGradient = playedMatch.home.goals > playedMatch.away.goals
        ? win
        : playedMatch.home.goals == playedMatch.away.goals
        ? draw
        : playedMatch.home.goals < playedMatch.away.goals ? lose: notyet;

    final String homewin  = (playedMatch.forecast.toString() + "_HOME");
    final String awaywin  = (playedMatch.forecast.toString() + "_AWAY");

    Gradient forcastedgradient = playedMatch.forecast == null
        ? notyet
        : (playedMatch.home.name + '_' + playedMatch.forecast).toString() == homewin
        ? win
        :  playedMatch.forecast == 'DRAW'
        ? draw
        : (playedMatch.home.name + '_' + playedMatch.forecast) == awaywin ? lose : notyet;


    final String formatted =
    DateFormat.yMMMMEEEEd().format(DateTime.parse(playedMatch.date));
    return FlatButton(
    onPressed: () => onPush(OnPushValue(type: TabNavigatorRoutes.match, id: playedMatch.matchId)),
    child: Container(
          padding: EdgeInsets.all(5),
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
                height: 40,
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
                    gradient: playedGradient
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left:8.0, right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Image.network(playedMatch.home.picture, width: 25),
                              ),
                              Text(
                                playedMatch.home.name,
                                style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ],
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                playedMatch.away.name,
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
                                textAlign: TextAlign.justify,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Image.network(playedMatch.away.picture, width: 25),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "forecast".tr() + ' : ',
                      style: TextStyle(color: Colors.blueGrey[500]), textAlign: TextAlign.center,
                    ),
                    Container(
                      width : 70,
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          border: Border.all(color: Colors.white, width: 1),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 6,
                            )
                          ],
                          gradient: forcastedgradient
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Text(
                                playedMatch.home.name,
                                style: TextStyle(fontSize: 9, fontWeight: FontWeight.w700, color: Colors.white),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Text(
                                playedMatch.away.name,
                                style: TextStyle(fontSize: 9, fontWeight: FontWeight.w700, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )

            ],
          ),
        ));
  }
}