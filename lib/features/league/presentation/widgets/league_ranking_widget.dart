import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/features/league/presentation/bloc/leagues_bloc.dart';
import 'package:stat19_app_mobile/features/team/presentation/pages/team_page.dart';

class LeagueRanking extends StatelessWidget {
  const LeagueRanking({
    Key key,
    @required this.leagueId,
  }) : super(key: key);

  final int leagueId;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            BlocBuilder<LeaguesBloc, LeaguesState>(builder: (context, state) {
              if (state is RankingLoaded) {
                return RankingFilter(season: state.ranking.season, leagueId: leagueId);
              }
              return RankingFilter(season: '2015/2016', leagueId: leagueId);
            }),
            BlocBuilder<LeaguesBloc, LeaguesState>(builder: (context, state) {
              if (state is Loading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is RankingLoaded) {
                print(state.toString());
                return Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: FittedBox(
                      child: (DataTable(
                        columns: [
                          DataColumn(label: Text('Club', style: TextStyle(fontSize: 40))),
                          DataColumn(label: Text('MJ', style: TextStyle(fontSize: 40))),
                          DataColumn(label: Text('G', style: TextStyle(fontSize: 40))),
                          DataColumn(label: Text('N', style: TextStyle(fontSize: 40))),
                          DataColumn(label: Text('P', style: TextStyle(fontSize: 40))),
                          DataColumn(label: Text('S', style: TextStyle(fontSize: 40))),
                          DataColumn(label: Text('Pts', style: TextStyle(fontSize: 40))),
                        ],
                        rows: state.ranking
                            .rankingItems // Loops through dataColumnText, each iteration assigning the value to element
                            .map(
                              ((element) => DataRow(
                                    cells: <DataCell>[
                                      DataCell(
//                                          Flexible(child: Text(element.name, style: TextStyle(fontSize: 40)))),
                                          Flexible(child: FlatButton(
                                              onPressed: () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(builder: (BuildContext context) {
                                                      return TeamPage(
                                                        teamId: element.teamId,
                                                      );
                                                    }));
                                              },
                                              child: Text(element.name, style: TextStyle(fontSize: 40)))
                                          )
                                      ),
                                      DataCell(
                                          Text(element.matchPlayed.toString(), style: TextStyle(fontSize: 40))),
                                      DataCell(Text(element.win.toString(), style: TextStyle(fontSize: 40))),
                                      DataCell(Text(element.draw.toString(), style: TextStyle(fontSize: 40))),
                                      DataCell(Text(element.lose.toString(), style: TextStyle(fontSize: 40))),
                                      DataCell(Text(element.score.toString(), style: TextStyle(fontSize: 40))),
                                      DataCell(Text(element.points.toString(), style: TextStyle(fontSize: 40))),
                                    ],
                                  )),
                            )
                            .toList(),
                      )),
                    ),
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
