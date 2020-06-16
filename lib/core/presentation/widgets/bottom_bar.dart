import 'package:flutter/material.dart';
import 'package:stat19_app_mobile/features/league/presentation/pages/leagues_page.dart';
import 'package:stat19_app_mobile/features/match/presentation/pages/soccer_match_page.dart';
import 'package:stat19_app_mobile/features/soccer_search/presentation/pages/search_soccer_page.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 75,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(icon: Icon(Icons.home), onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LeaguesPage()),
              );
            }),
            IconButton(icon: Icon(Icons.search), onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SoccerSearchPage()),
              );
            }),
            IconButton(icon: Icon(Icons.account_circle), onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SoccerMatchPage(matchId: 1729)),
              );
            })
          ],
        ),
      ),
    );
  }
}