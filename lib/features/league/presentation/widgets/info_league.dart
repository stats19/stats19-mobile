import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/widgets/on_push_value.dart';
import '../bloc/leagues_bloc.dart';
import 'coming_matches.dart';
import 'widgets.dart';

class InfoLeague extends StatefulWidget {
  final int leagueId;
  final ValueChanged<OnPushValue> onPush;

  const InfoLeague({
    Key key,
    this.leagueId, this.onPush,
  }) : super(key: key);

  @override
  _InfoLeagueState createState() => _InfoLeagueState(leagueId: leagueId, onPush: onPush);
}

class _InfoLeagueState extends State<InfoLeague>
    with SingleTickerProviderStateMixin {
  final int leagueId;
  final ValueChanged<OnPushValue> onPush;
  TabController _tabController;

  _InfoLeagueState({@required this.leagueId, this.onPush});

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _tabController.addListener(() {
      if (_tabController.index == 0) {
        BlocProvider.of<LeaguesBloc>(context)
            .add(GetMatchByLeagueEvent(leagueId: leagueId));
      } else {
        BlocProvider.of<LeaguesBloc>(context)
            .add(GetRankingEvent(leagueId: leagueId));
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[300],
//              borderRadius: BorderRadius.all(Radius.circular(15))
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15))),
            margin: EdgeInsets.only(
              top: 10,
            ),
            child: Scaffold(
              appBar: TabBar(
                  labelStyle:
                      TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  controller: _tabController,
                  tabs: [
                    Tab(
                      text: "coming_matches".tr(),
                    ),
                    Tab(
                      text: "ranking".tr(),
                    ),
                  ]),
              body: TabBarView(controller: _tabController, children: [
                ComingMatch(leagueId: widget.leagueId, onPush: onPush),
                LeagueRanking(leagueId: widget.leagueId, onPush: onPush)
              ]),
            )));
  }
}
