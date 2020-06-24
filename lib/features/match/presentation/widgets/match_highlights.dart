import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/features/match/presentation/bloc/soccer_match_bloc.dart';

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
            return Column(
              children: <Widget>[
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(8),
                    itemCount: state.soccerMatch.details.length,
                    itemBuilder: (BuildContext context, int index) {
                      return HighLight(
                          name: state.soccerMatch.details[index].playerName,
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
  final String name;
  final bool home;
  final int elapsed;
  final int elapsedPlus;

  const HighLight(
      {Key key,
      @required this.name,
      @required this.home,
      @required this.elapsed,
      @required this.elapsedPlus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              child: Row(
                children: <Widget>[home ? Flexible(child: Text(name)) : Container()],
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
                children: <Widget>[!home ? Flexible(child: Text(name)) : Container()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
