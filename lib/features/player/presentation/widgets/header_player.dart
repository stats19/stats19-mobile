import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/features/player/presentation/bloc/player_bloc.dart';

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
    return Container(
      child: Row(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
                child: BlocBuilder<PlayerBloc, PlayerState>(
                    builder: (context, state) {
                      if (state is Loading) {
                        return CircularProgressIndicator();
                      } else if (state is Loaded) {
                        return Text(state.player.name,
                            style:
                            TextStyle(color: Colors.white, fontSize: 40));
                      } else if (state is Error) {
                        return Text('there is error' + state.message);
                      }
                      return Container();
                    })
            ),
          )
        ],
      ),
    );
  }
}

