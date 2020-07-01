import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/widgets/navigation.dart';
import '../../../../core/presentation/widgets/on_push_value.dart';
import '../../../player/presentation/pages/player_page.dart';
import '../bloc/soccer_match_bloc.dart';

class MatchHighlights extends StatelessWidget {
  final ValueChanged<OnPushValue> onPush;
  const MatchHighlights({
    Key key, this.onPush,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white30,
        child: BlocBuilder<SoccerMatchBloc, SoccerMatchState>(
            builder: (context, state) {
          if (state is Loading) {
            return Container();
//            return LoadingWidget();
          } else if (state is Loaded) {
            print(state.soccerMatch.matchId);
            return Column(
              children: <Widget>[
                ListView.separated(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.all(8),
                  itemCount: state.soccerMatch.details.length,
                  itemBuilder: (BuildContext context, int index) {
                    return HighLight(
                        onTap: onPush,
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
  final ValueChanged<OnPushValue> onTap;
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
      @required this.id, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(0.0),
              child: Row(
                children: <Widget>[
                  home
                      ? Flexible(
                          child: FlatButton(
                              onPressed: () => onTap(OnPushValue(type: TabNavigatorRoutes.player, id: id)),
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
                              IconAction(type: type),
                              Container(
                                  child: Flexible(
                                      child: Text(
                                        name,
                                        textAlign: TextAlign.right,
                                      ))),
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
    double iconWidth = 20;
    if (type == 3){
      return Image.asset(
      "lib/resources/assets/goal.png",
      width: iconWidth);
    }
    else if (type == 2){
      return Row(
        children: <Widget>[
          Image.asset(
              "lib/resources/assets/yellow-card.png",
              width: iconWidth),
          Image.asset(
              "lib/resources/assets/yellow-card.png",
              width: iconWidth),
        ],
      );
    }
    else if (type == 1){
      return Image.asset(
          "lib/resources/assets/red-card.png",
          width: iconWidth);
    }
    else if (type == 0){
      return Image.asset(
          "lib/resources/assets/yellow-card.png",
          width: iconWidth);
    }

    return Container();
  }
}
