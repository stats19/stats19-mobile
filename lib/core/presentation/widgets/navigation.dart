import 'package:flutter/material.dart';

import '../../../features/fantasy/presentation/pages/fantasy_page.dart';
import '../../../features/league/presentation/pages/league_info_page.dart';
import '../../../features/league/presentation/pages/leagues_page.dart';
import '../../../features/match/presentation/pages/soccer_match_page.dart';
import '../../../features/player/presentation/pages/player_page.dart';
import '../../../features/soccer_search/presentation/pages/search_soccer_page.dart';
import '../../../features/team/presentation/pages/team_page.dart';
import 'bottom_navigation.dart';

enum TabNavigatorRoutes {
  root,
  search,
  fantasy,
  profile,
  league,
  refresh,
  match,
  team,
  player
}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});

  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  void _push(BuildContext context,
      {int id: 500, TabNavigatorRoutes type: TabNavigatorRoutes.root}) {
    var routeBuilders = _routeBuilders(context, id: id, type: type);
    print(routeBuilders[type.toString()]);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => routeBuilders[type.toString()](context)));
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
      {int id: 500, TabNavigatorRoutes type: TabNavigatorRoutes.root}) {
    return {
      TabNavigatorRoutes.root.toString(): (context) => LeaguesPage(
            onPush: (param) => _push(context, id: param.id, type: param.type),
          ),
      TabNavigatorRoutes.search.toString(): (context) => SoccerSearchPage(
            onPush: (param) => _push(context, id: param.id, type: param.type),
          ),
      TabNavigatorRoutes.fantasy.toString(): (context) => FantasyPage(
            onPush: (param) => _push(context, id: param.id, type: param.type),
          ),
      TabNavigatorRoutes.profile.toString(): (context) => null,
      TabNavigatorRoutes.league.toString(): (context) => LeagueInfoPage(
          leagueId: id,
          onPush: (param) => _push(context, id: param.id, type: param.type)),
      TabNavigatorRoutes.match.toString(): (context) => SoccerMatchPage(
          matchId: id,
          onPush: (param) => _push(context, id: param.id, type: param.type)),
      TabNavigatorRoutes.team.toString(): (context) => TeamPage(
          teamId: id,
          onPush: (param) => _push(context, id: param.id, type: param.type)),
      TabNavigatorRoutes.player.toString(): (context) =>
          PlayerPage(playerId: id)
    };
  }

  @override
  Widget build(BuildContext context) {
    var routeBuilders = _routeBuilders(context);
    return Navigator(
        key: navigatorKey,
        initialRoute: getInitRoute(),
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
              builder: (context) => routeBuilders[routeSettings.name](context));
        });
  }


  String getInitRoute() {
    switch(tabItem) {
      case TabItem.home:
        return TabNavigatorRoutes.root.toString();
      case TabItem.search:
        return TabNavigatorRoutes.search.toString();
      case TabItem.refresh:
//        return TabNavigatorRoutes.root.toString();
        break;
      case TabItem.fantasy:
        return TabNavigatorRoutes.fantasy.toString();
      case TabItem.profile:
      // TODO: Handle this case.
        break;
    }
    return TabNavigatorRoutes.root.toString();
  }
}
