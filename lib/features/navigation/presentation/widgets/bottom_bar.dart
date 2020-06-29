import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../../../league/presentation/pages/leagues_page.dart';
import '../../../player/presentation/pages/player_page.dart';
import '../../../soccer_search/presentation/pages/search_soccer_page.dart';
import '../../../team/presentation/pages/team_page.dart';
import '../bloc/navigation_bloc.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LeaguesPage()),
                  );
                }),
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SoccerSearchPage()),
                  );
                }),
            refreshButton(context),
            IconButton(
                icon: Icon(Icons.group),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TeamPage(teamId: 3457,)),
                  );
                }),
            IconButton(
                icon: Icon(Icons.account_circle),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PlayerPage(playerId: 10749)),
                  );
                }),

          ],
        ),
      ),
    );
  }
}

BlocProvider<NavigationBloc> refreshButton(BuildContext context) {
  return BlocProvider(
    create: (_) => sl<NavigationBloc>(),
    child: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          Color color = Colors.black;
          if (state is NavigationInitial || state is Loaded) {
            color = Colors.black;
          } else if (state is Loading) {
            color = Colors.grey;
          } else if (state is Error) {
            color = Colors.red;
          }
          return IconButton(
              icon: Icon(Icons.refresh),
              color: color,
              onPressed: () {
                if (color != Colors.grey) {
                  BlocProvider.of<NavigationBloc>(context).add(RefreshForecastEvent());
                }
              });
        }),
  );
}
