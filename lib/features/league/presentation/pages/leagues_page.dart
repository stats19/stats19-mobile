import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/features/navigation/presentation/widgets/bottom_bar.dart';

import '../../../../injection_container.dart';
import '../bloc/leagues_bloc.dart';

class LeaguesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Les ligues'),
      ),
      body: buildBody(context),
      bottomNavigationBar: BottomBar(),
    );
  }

  BlocProvider<LeaguesBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LeaguesBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
              alignment: Alignment.topCenter,
              child: Column(
                children: <Widget>[
                  BlocBuilder<LeaguesBloc, LeaguesState>(
                      builder: (context, state) {
                    if ((state is Empty)) {
                      BlocProvider.of<LeaguesBloc>(context)
                          .add(GetLeaguesEvent());
                      return Container();
                    } else if (state is Loading) {
                      return Text("is loading");
                    } else if (state is LeaguesLoaded) {
                      return Container(
                          margin: const EdgeInsets.all(10.0),
                          child: (new ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.leagues == null
                                ? 0
                                : state.leagues.length,
                            itemBuilder: (BuildContext context, int index) {
                              return RaisedButton(
                                  child: new Text(state.leagues[index].name),
                                  splashColor: Colors.grey[900],
                                  onPressed: () {
//                                  Navigator.push(
//                                    context,
//                                    MaterialPageRoute(builder: (context) => SearchBar()),
//                                  );
                                  });
                            },
                          )));
                    } else if (state is Error) {
                      // return MessageDisplay(message: state.message);
                      return Text('there is error' + state.message);
                    }
                    return Container();
                  })
                ],
              )),
        ),
      ),
    );
  }
}
