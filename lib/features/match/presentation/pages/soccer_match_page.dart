import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../injection_container.dart';
import '../../../navigation/presentation/widgets/bottom_bar.dart';
import '../bloc/soccer_match_bloc.dart';
import '../widgets/widgets.dart';

class SoccerMatchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  final int matchId;

  SoccerMatchPage({this.matchId});

  BlocProvider<SoccerMatchBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SoccerMatchBloc>(),
      child: Scaffold(
          appBar: AppBar(
            title: TitleMatch(matchId: matchId),
          ),
//          backgroundColor: Colors.blueGrey[900],
          backgroundColor: Colors.grey[300],
          body: MatchDetailsWidget(
            matchId: matchId,
          ),
          bottomNavigationBar: BottomBar()),
    );
  }
}

class MatchDetailsWidget extends StatelessWidget {
  final int matchId;

  const MatchDetailsWidget({
    Key key,
    this.matchId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderPanel(matchId: matchId),

          Container(
              child: DefaultTabController(
                  length: 2,
                  child: Container(
                    child: new Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TabBar(
                              labelColor: Colors.blueAccent,
                              unselectedLabelColor: Colors.grey,
                              tabs: [
                                Tab(text: "highlights".tr()),
                                Tab(text: "statistics".tr()),

                              ]),
                          Container(
                              height:MediaQuery.of(context).size.height,
                              child: TabBarView(children: [
//                                Text("toto"),
//                                Text("toto")
                                MatchHighlights(),
                                SoccerMatchStats()
                          ]))
                        ]),
                  ))
          )
        ],
      ),
    );
  }
}




