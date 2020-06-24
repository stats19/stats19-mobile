import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/features/league/presentation/pages/leagues_page.dart';
import 'package:stat19_app_mobile/features/match/presentation/pages/soccer_match_page.dart';
import 'package:stat19_app_mobile/features/navigation/presentation/bloc/navigation_bloc.dart';
import 'package:stat19_app_mobile/features/soccer_search/presentation/pages/search_soccer_page.dart';

import '../../../../injection_container.dart';

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
                icon: Icon(Icons.account_circle),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SoccerMatchPage(matchId: 1729)),
                  );
                })
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
