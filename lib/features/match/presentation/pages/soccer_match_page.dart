import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/widgets/on_push_value.dart';
import '../../../../injection_container.dart';
import '../bloc/soccer_match_bloc.dart';
import '../widgets/widgets.dart';

class SoccerMatchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  final int matchId;
  final ValueChanged<OnPushValue> onPush;

  SoccerMatchPage({this.matchId, this.onPush});

  BlocProvider<SoccerMatchBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SoccerMatchBloc>(),
      child: Scaffold(
          appBar: AppBar(
            title: TitleMatch(matchId: matchId),
          ),
            backgroundColor: Colors.grey[300],
          body: MatchDetailsWidget(
            matchId: matchId,
            onPush: onPush
          )),
    );
  }
}

class MatchDetailsWidget extends StatelessWidget {
  final int matchId;
  final ValueChanged<OnPushValue> onPush;

  const MatchDetailsWidget({
    Key key,
    this.matchId, this.onPush,
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
                              MatchHighlights(onPush: onPush),
                              SoccerMatchStats()
                        ]))
                      ]))
          )
        ],
      ),
    );
  }
}




