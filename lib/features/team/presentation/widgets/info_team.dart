import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:stat19_app_mobile/core/presentation/widgets/on_push_value.dart';

import 'widgets.dart';

class InfoTeam extends StatelessWidget {
  final ValueChanged<OnPushValue> onPush;
  const InfoTeam({
    Key key, this.onPush,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child:
        DefaultTabController(
            length: 3,
            child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TabBar(
                      labelColor: Colors.blueAccent,
                      unselectedLabelColor: Colors.grey,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          color: Colors.white30,
                      ),
                      tabs: [
                        Tab(child: Align(
                          alignment: Alignment.center,
                          child: Text("statistics".tr()),
                        ),),
                        Tab(child: Align(
                          alignment: Alignment.center,
                          child: Text("played_matches".tr()),
                        ),),
                        Tab(child: Align(
                          alignment: Alignment.center,
                          child: Text("coming_matches".tr()),
                        ),),
                      ]
                  ),
                  Expanded(
//                      height:MediaQuery.of(context).size.height,
                      child: TabBarView(
                          children: [
//                            Text('data'),
//                            Text('data'),
//                            Text('data')
                          TeamStats(),
                          EndedMatches(onPush: onPush),
                          ComingMatches(),
                          ]
                      )
                  )
                ]
            )
        ),
      ),
    );
  }
}

