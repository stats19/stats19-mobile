import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MatchStat extends StatelessWidget {
  final int home;
  final int away;
  final String title;

  const MatchStat({
    Key key,
    @required this.home,
    @required this.away,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 10), child: Text(title)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(home.toString()),
                LinearPercentIndicator(
                  width: 130.0,
                  lineHeight: 8.0,
                  percent: home + away > 0 ? home / (home + away) : 0.0,
                  progressColor: Colors.green,
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(away.toString()),
                LinearPercentIndicator(
                  width: 130.0,
                  lineHeight: 8.0,
                  percent: home + away > 0 ? away / (home + away) : 0.0,
                  progressColor: Colors.red,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}