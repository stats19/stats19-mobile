import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/features/match/presentation/bloc/soccer_match_bloc.dart';
import 'package:stat19_app_mobile/features/player/presentation/pages/player_page.dart';

class MatchHighlights extends StatelessWidget {
  const MatchHighlights({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(
          left: 20,
          top: 0,
          right: 20,
          bottom: 20,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            color: Colors.blue),
        child: BlocBuilder<SoccerMatchBloc, SoccerMatchState>(
            builder: (context, state) {
          if (state is Loading) {
            return CircularProgressIndicator();
          } else if (state is Loaded) {
            print(state.soccerMatch.matchId);
            return Column(
              children: <Widget>[
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(8),
                    itemCount: state.soccerMatch.details.length,
                    itemBuilder: (BuildContext context, int index) {
                      return HighLight(
                          name: state.soccerMatch.details[index].playerName,
                          type: state.soccerMatch.details[index].type,
                          id: state.soccerMatch.details[index].playerId,
                          home: state.soccerMatch.details[index].home,
                          elapsed: state.soccerMatch.details[index].elapsed,
                          elapsedPlus:
                              state.soccerMatch.details[index].elapsedPlus);
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  ),
                ),
              ],
            );
          } else if (state is Error) {
            return Text('there is error' + state.message);
          }
          return Container();
        }));
  }
}

class HighLight extends StatelessWidget {
  final int id;
  final String name;
  final int type;
  final bool home;
  final int elapsed;
  final int elapsedPlus;

  const HighLight(
      {Key key,
      @required this.name,
      @required this.type,
      @required this.home,
      @required this.elapsed,
      @required this.elapsedPlus,
      @required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
//      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(0.0),
//              color: Colors.red,
              child: Row(
                children: <Widget>[
                  home
                      ? Flexible(
                          child: FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return PlayerPage(
                                      playerId: id,
                                    );
                                  }),
                                );
                              },
                              child: Row(
                                children: <Widget>[
                                  Container(
                                      child: Flexible(
                                          child: Text(
                                    name,
                                    textAlign: TextAlign.left,
                                  ))),
                                  IconAction(type: type),
                                ],
                              )))
                      : Container()
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
                child: Text(
                    elapsed.toString() +
                        (elapsedPlus != null
                            ? ' +' + elapsedPlus.toString()
                            : ''),
                    textAlign: TextAlign.center)),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Row(
                children: <Widget>[
                  !home
                      ? Flexible(
                      child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return PlayerPage(
                                  playerId: id,
                                );
                              }),
                            );
                          },
                          child: Row(
                            children: <Widget>[
                              Container(
                                  child: Flexible(
                                      child: Text(
                                        name,
                                        textAlign: TextAlign.left,
                                      ))),
                              IconAction(type: type),
                            ],
                          )))
                      : Container()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IconAction extends StatelessWidget {
  final int type;
  const IconAction({
    Key key, this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (type == 3){
      return Image.asset(
      "lib/ressource/assets/goal.png",
      width: 20);
    return Container();
    }
    else if (type == 2){
      return Row(
        children: <Widget>[
          Image.asset(
              "lib/ressource/assets/yellow-card.png",
              width: 20),
          Image.asset(
              "lib/ressource/assets/yellow-card.png",
              width: 20),
        ],
      );
      return Container();
    }
    else if (type == 1){
      return Image.asset(
          "lib/ressource/assets/red-card.png",
          width: 20);
      return Container();
    }
    else if (type == 0){
      return Image.asset(
          "lib/ressource/assets/yellow-card.png",
          width: 20);
      return Container();
    }
  }
}
