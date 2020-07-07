import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/core/presentation/widgets/loading_widget.dart';

import '../bloc/player_bloc.dart';

class HeaderPlayer extends StatefulWidget {
  const HeaderPlayer({
    Key key,
  }) : super(key: key);

  @override
  _HeaderPlayerState createState() => _HeaderPlayerState();
}

class _HeaderPlayerState extends State<HeaderPlayer> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
        builder: (context, state) {
          if (state is Loading) {
            return LoadingWidget();
          } else if (state is Loaded) {
            return Center(
              child: Container(
                margin: new EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color:  Colors.blueGrey[700], width: 0.5),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0)
                  ),
                  color: Colors.blueGrey[500],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      blurRadius: 9,
                      spreadRadius: 2.0,
                    )
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Container(width: 80,
                    child: Image.network(state.player.picture),),
                    Text(state.player.name,
                        style:
                        TextStyle(color: Colors.white, fontSize: 35)),
                  ],
                ),
              ),
            );
          } else if (state is Error) {
            return Text('there is error' + state.message);
          }
          return Container();
        });
  }
}
