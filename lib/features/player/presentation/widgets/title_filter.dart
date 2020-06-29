import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import '../bloc/player_bloc.dart';

class TitleFilter extends StatelessWidget {
  const TitleFilter({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder<PlayerBloc, PlayerState>(
          builder: (context, state) {
            if (state is Loading) {
              return CircularProgressIndicator();
            } else if (state is Loaded) {
              return Container(
                padding: EdgeInsets.only(left: 20, bottom: 10),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Text("statistics".tr(),
                          style: TextStyle(color: Colors.black, fontSize: 20)),
                    ),
                    PlayerFilter(season: state.season, playerId: state.player.playerId)
                  ],
                ),
              );
            } else if (state is Error) {
              return Text('there is error' + state.message);
            }
            return Container();
          });
  }
}

class PlayerFilter extends StatelessWidget {
  final String season;
  final int playerId;

  const PlayerFilter({Key key, this.season, this.playerId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: season,
      elevation: 16,
      onChanged: (String newValue) {
        BlocProvider.of<PlayerBloc>(context)
            .add(GetPlayerEvent(playerId: playerId, season: newValue));
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
        child: Text(e, style: TextStyle(color: Colors.blue)),
      ))
          .toList(),
    );
  }
}