import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/core/presentation/widgets/loading_widget.dart';

import '../../../../core/presentation/widgets/navigation.dart';
import '../../../../core/presentation/widgets/on_push_value.dart';
import '../bloc/leagues_bloc.dart';

class LeagueRanking extends StatelessWidget {
  final ValueChanged<OnPushValue> onPush;

  const LeagueRanking({
    Key key,
    @required this.leagueId,
    this.onPush,
  }) : super(key: key);

  final int leagueId;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white30,
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            BlocBuilder<LeaguesBloc, LeaguesState>(builder: (context, state) {
              if (state is RankingLoaded) {
                return RankingFilter(
                    season: state.ranking.season, leagueId: leagueId);
              }
              return RankingFilter(season: '2015/2016', leagueId: leagueId);
            }),
            BlocBuilder<LeaguesBloc, LeaguesState>(builder: (context, state) {
              double tabletxtsize = 17;
              if (state is Loading) {
                return Center(child: LoadingWidget());
              } else if (state is RankingLoaded) {
                print(state.toString());
                return Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: (DataTable(
                      columnSpacing: 10,
                      columns: [
                        DataColumn(
                          label: Text('Club',
                              style: TextStyle(fontSize: tabletxtsize)),
                          numeric: false,
                        ),
                        DataColumn(
                          label: Text('MJ',
                              style: TextStyle(fontSize: tabletxtsize)),
                          numeric: false,
                        ),
                        DataColumn(
                          label: Text('G',
                              style: TextStyle(fontSize: tabletxtsize)),
                          numeric: false,
                        ),
                        DataColumn(
                          label: Text('N',
                              style: TextStyle(fontSize: tabletxtsize)),
                          numeric: false,
                        ),
                        DataColumn(
                          label: Text('P',
                              style: TextStyle(fontSize: tabletxtsize)),
                          numeric: false,
                        ),
                        DataColumn(
                          label: Text('S',
                              style: TextStyle(fontSize: tabletxtsize)),
                          numeric: false,
                        ),
                        DataColumn(
                          label: Text('Pts',
                              style: TextStyle(fontSize: tabletxtsize)),
                          numeric: false,
                        ),
                      ],
                      rows: state.ranking
                          .rankingItems // Loops through dataColumnText, each iteration assigning the value to element
                          .map(
                            ((element) => DataRow(
                                  cells: <DataCell>[
                                    DataCell(FlatButton(
                                        padding: EdgeInsets.only(left: 0),
                                        onPressed: () => onPush(OnPushValue(
                                            type: TabNavigatorRoutes.team,
                                            id: element.teamId)),
                                        child: Container(
                                            width: 80,
                                            child: Text(element.name,
                                                style: TextStyle(
                                                    fontSize: tabletxtsize))))),
                                    DataCell(Text(
                                        element.matchPlayed.toString(),
                                        style:
                                            TextStyle(fontSize: tabletxtsize))),
                                    DataCell(Text(element.win.toString(),
                                        style:
                                            TextStyle(fontSize: tabletxtsize))),
                                    DataCell(Text(element.draw.toString(),
                                        style:
                                            TextStyle(fontSize: tabletxtsize))),
                                    DataCell(Text(element.lose.toString(),
                                        style:
                                            TextStyle(fontSize: tabletxtsize))),
                                    DataCell(Text(element.score.toString(),
                                        style:
                                            TextStyle(fontSize: tabletxtsize))),
                                    DataCell(Text(element.points.toString(),
                                        style:
                                            TextStyle(fontSize: tabletxtsize))),
                                  ],
                                )),
                          )
                          .toList(),
                    )),
                  ),
                );
              } else if (state is Error) {
                return Text('there is error' + state.message);
              }
              return Container();
            }),
          ],
        ));
  }
}

class RankingFilter extends StatelessWidget {
  final String season;
  final int leagueId;

  const RankingFilter({Key key, this.season, this.leagueId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: season,
      elevation: 16,
      onChanged: (String newValue) {
        BlocProvider.of<LeaguesBloc>(context)
            .add(GetRankingEvent(leagueId: leagueId, season: newValue));
      },
      items: [
        '2015/2016',
        '2014/2015',
        '2013/2014',
        '2012/2013',
        '2011/2012',
        '2010/2011',
        '2009/2010',
        '2008/2009'
      ]
          .map<DropdownMenuItem<String>>((e) => DropdownMenuItem<String>(
                value: e,
                child: Text(e),
              ))
          .toList(),
    );
  }
}
