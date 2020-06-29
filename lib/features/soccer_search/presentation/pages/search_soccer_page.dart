import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../injection_container.dart';
import '../../../navigation/presentation/widgets/bottom_bar.dart';
import '../../../player/presentation/pages/player_page.dart';
import '../../../team/presentation/pages/team_page.dart';
import '../../domain/entities/soccer_search.dart';
import '../bloc/soccer_search_bloc.dart';

class SoccerSearchPage extends StatelessWidget {
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
          bottomNavigationBar: BottomBar(),
          body: TabBarView(
            children: [
              BlocBuilder<SoccerSearchBloc, SoccerSearchState>(
                  builder: (context, state) {
                if ((state is Empty)) {
                  return Container();
                } else if (state is Error) {
                  return Text(state.message);
                } else if (state is Loading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is Loaded) {
                  return Column(
                    children: <Widget>[
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.results.players.length,
                          itemBuilder: (BuildContext context, int index) {
                            return BuildItem(
                                item: state.results.players[index], type: 'player');
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
                  return Center(child: CircularProgressIndicator());
                } else if (state is Loaded) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.results.teams.length,
                      itemBuilder: (BuildContext context, int index) {
                        return BuildItem(
                            item: state.results.teams[index], type: 'team');
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
  final SoccerSearchResult item;
  final String type;

  BuildItem({this.item, this.type});

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
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) {
                    return new TeamPage(teamId: item.id,);
                  }
              )
          );
        } else if (type == 'player') {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) {
                    return PlayerPage(playerId: item.id,);
                  }
              )
          );
        }
      },
    );
  }
}
