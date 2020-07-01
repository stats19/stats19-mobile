import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/core/presentation/widgets/loading_widget.dart';

import '../../../../core/presentation/widgets/navigation.dart';
import '../../../../core/presentation/widgets/on_push_value.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/soccer_search.dart';
import '../bloc/soccer_search_bloc.dart';

class SoccerSearchPage extends StatelessWidget {
  final ValueChanged<OnPushValue> onPush;

  const SoccerSearchPage({Key key, this.onPush}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: buildApp(context));
  }

  BlocProvider<SoccerSearchBloc> buildApp(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SoccerSearchBloc>(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
//                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Text("players").tr()),
//                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Text("teams").tr()),
              ],
            ),
            title: BlocBuilder<SoccerSearchBloc, SoccerSearchState>(
                builder: (context, state) {
              return TextField(
                decoration: InputDecoration(
                  hintText: "search".tr(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.white70,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  contentPadding: EdgeInsets.all(16),
                  fillColor: Colors.white,
                ),
                autofocus: true,
                onChanged: (value) {
                  BlocProvider.of<SoccerSearchBloc>(context)
                      .add(GetSoccerSearchEvent(value));
                },
              );
            }),
          ),
          body: TabBarView(
            children: [
              BlocBuilder<SoccerSearchBloc, SoccerSearchState>(
                  builder: (context, state) {
                if ((state is Empty)) {
                  return Container();
                } else if (state is Error) {
                  return Text(state.message);
                } else if (state is Loading) {
                  return Center(child: LoadingWidget());
                } else if (state is Loaded) {
                  return Column(
                    children: <Widget>[
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.results.players.length,
                          itemBuilder: (BuildContext context, int index) {
                            return BuildItem(
                                item: state.results.players[index], type: 'player', onPush: onPush,);
                          },
                        ),
                      ),
                    ],
                  );
                }
                return Container();
              }),
              BlocBuilder<SoccerSearchBloc, SoccerSearchState>(
                  builder: (context, state) {
                if ((state is Empty)) {
                  return Container();
                } else if (state is Error) {
                  return Text(state.message);
                } else if (state is Loading) {
                  return Center(child: LoadingWidget());
                } else if (state is Loaded) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.results.teams.length,
                      itemBuilder: (BuildContext context, int index) {
                        return BuildItem(
                            item: state.results.teams[index], type: 'team', onPush: onPush,);
                      },
                    ),
                  );
                }
                return Container();
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildItem extends StatelessWidget {
  final ValueChanged<OnPushValue> onPush;
  final SoccerSearchResult item;
  final String type;

  BuildItem({this.item, this.type, @required this.onPush});

  @override
  Widget build(BuildContext context) {
    return new FlatButton(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Text(
          this.item.name,
          style: TextStyle(fontSize: 16.0),
        ),
      ),
      onPressed: () {
        if (type == 'team') {
         onPush(OnPushValue(type: TabNavigatorRoutes.team, id: item.id));
        } else if (type == 'player') {
          onPush(OnPushValue(type: TabNavigatorRoutes.player, id: item.id));
        }
      },
    );
  }
}
