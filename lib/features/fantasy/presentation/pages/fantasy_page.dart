import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/core/presentation/widgets/loading_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:stat19_app_mobile/core/presentation/widgets/navigation.dart';

import '../../../../core/presentation/widgets/on_push_value.dart';
import '../../../../injection_container.dart';
import '../bloc/fantasy_bloc.dart';
import 'package:stat19_app_mobile/features/fantasy/domain/entities/fantasy.dart';

class FantasyPage extends StatefulWidget {
  final ValueChanged<OnPushValue> onPush;

  FantasyPage({this.onPush});

  @override
  _FantasyPageState createState() => _FantasyPageState();
}

class _FantasyPageState extends State<FantasyPage> {
  final tabs = ['goalKeepers', 'defenders', 'middleFielders', 'forwards'];
  final _scrollController = ScrollController();
  final FantasyBloc _fantasyBloc = sl<FantasyBloc>();
  final _scrollThreshold = 100.0;

  _FantasyPageState() {
    _fantasyBloc.add(GetFantasyEvent());
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  @override
  void dispose() {
    _fantasyBloc.close();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _fantasyBloc.add(GetFantasyEvent());
    }
  }

  BlocProvider<FantasyBloc> buildBody(BuildContext context) {
    return BlocProvider(
        create: (_) => _fantasyBloc,
        child:
            BlocBuilder<FantasyBloc, FantasyState>(builder: (context, state) {
          if (state is FantasyInitial) {
            BlocProvider.of<FantasyBloc>(context).add(GetFantasyEvent());
          } else if (state is Loading) {
            return LoadingWidget();
          } else if (state is Loaded) {
            return DefaultTabController(
              length: 4,
              child: Scaffold(
                  appBar: AppBar(
                    title: Text("Fantasy"),
                    bottom: TabBar(
                      labelStyle: TextStyle(fontSize: 11),
                      tabs: tabs
                          .map<Tab>((e) => Tab(
                                text: '$e'.tr(),
                              ))
                          .toList(),
                    ),
                  ),
                  backgroundColor: Colors.grey[300],
                  body: TabBarView(
                      children: tabs
                          .map((e) => buildListView(state.fantasy.get(e), state.hasReachedMax))
                          .toList())),
            );
          } else if (state is Error) {
            return Text('there is error' + state.message);
          }
          return Container();
        }));
  }

  ListView buildListView(List<FantasyPlayer> fantasyPlayers, bool ended) =>
      ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: ended ? fantasyPlayers.length : fantasyPlayers.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == fantasyPlayers.length) {
            return BottomLoader();
          }  
          return buildListItem(fantasyPlayers[index]);
        },
        controller: _scrollController,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      );

  Widget buildListItem(FantasyPlayer e) => Container(
        height: 50,
        color: Colors.blue[100],
        child: Center(
            child: Row(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  child: GestureDetector(
                    onTap: () => widget.onPush(OnPushValue(
                        type: TabNavigatorRoutes.league, id: e.leagueId)),
                    child: Image.network(e.leaguePicture, width: 10),
                  ),
                )),
            Expanded(
              flex: 2,
              child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(6),
                  child: GestureDetector(
                    onTap: () => widget.onPush(OnPushValue(
                        type: TabNavigatorRoutes.team, id: e.teamId)),
                    child: Image.network(e.teamPicture, width: 25),
                  )),
            ),
            Expanded(
              flex: 5,
              child: GestureDetector(
                onTap: () => widget.onPush(OnPushValue(
                    type: TabNavigatorRoutes.player, id: e.playerId)),
                child: Row(
                  children: <Widget>[
                    Image.network(e.picture != null ? e.picture : 'https://www.crazyhit.fr/img/icone_commentaire.jpg', width: 25),
                    Text(e.name)
                  ],
                ),
              ),
            ),
            Expanded(flex: 1, child: Center(child: Text(e.score.toString()))),
          ],
        )),
      );
}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 33,
          height: 33,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}