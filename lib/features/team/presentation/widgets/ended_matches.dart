import 'package:flutter/material.dart';

class EndedMatches extends StatelessWidget {
  const EndedMatches({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
          shrinkWrap: true,
          primary: false,
          children: <Widget>[
            Column(
              children: <Widget>[
                FlatButton(child: Text('HomeTeam' + ' - ' + 'AwayTeam', style: TextStyle(fontSize: 18, color: Colors.white), )),
                FlatButton(child: Text('HomeTeam' + ' - ' + 'AwayTeam', style: TextStyle(fontSize: 18, color: Colors.white), )),
                FlatButton(child: Text('HomeTeam' + ' - ' + 'AwayTeam', style: TextStyle(fontSize: 18, color: Colors.white), )),
                FlatButton(child: Text('HomeTeam' + ' - ' + 'AwayTeam', style: TextStyle(fontSize: 18, color: Colors.white), )),
                FlatButton(child: Text('HomeTeam' + ' - ' + 'AwayTeam', style: TextStyle(fontSize: 18, color: Colors.white), )),
                FlatButton(child: Text('HomeTeam' + ' - ' + 'AwayTeam', style: TextStyle(fontSize: 18, color: Colors.white), )),
                FlatButton(child: Text('HomeTeam' + ' - ' + 'AwayTeam', style: TextStyle(fontSize: 18, color: Colors.white), )),
                FlatButton(child: Text('HomeTeam' + ' - ' + 'AwayTeam', style: TextStyle(fontSize: 18, color: Colors.white), )),
                FlatButton(child: Text('HomeTeam' + ' - ' + 'AwayTeam', style: TextStyle(fontSize: 18, color: Colors.white), )),
              ],
            )
          ],
        )
    );
  }
}