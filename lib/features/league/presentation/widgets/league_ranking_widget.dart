import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/features/league/presentation/bloc/leagues_bloc.dart';

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
                          DataColumn(label: Text('Club')),
                          DataColumn(label: Text('MJ')),
                          DataColumn(label: Text('G')),
                          DataColumn(label: Text('N')),
                          DataColumn(label: Text('P')),
                          DataColumn(label: Text('Pts')),
                        ],
                        rows: state.ranking
                            .rankingItems // Loops through dataColumnText, each iteration assigning the value to element
                            .map(
                          ((element) => DataRow(
                            cells: <DataCell>[
                              DataCell(
                                  Flexible(child: Text(element.name))),
                              DataCell(
                                  Text(element.matchPlayed.toString())),
                              DataCell(Text(element.win.toString())),
                              DataCell(Text(element.draw.toString())),
                              DataCell(Text(element.lose.toString())),
                              DataCell(Text(element.points.toString())),
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
