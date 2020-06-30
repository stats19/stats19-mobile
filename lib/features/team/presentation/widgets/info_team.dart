import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'widgets.dart';

class InfoTeam extends StatelessWidget {
  const InfoTeam({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: DefaultTabController(
          length: 3,
          child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  color: Colors.grey.withOpacity(0.2),

//                  decoration: BoxDecoration(
//                    border: Border(bottom: BorderSide(color:  Colors.grey, width: 0.6)),
//                  ),
                  child: TabBar(

                      labelStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                      labelColor: Colors.blueAccent,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(text: "statistics".tr()),
                        Tab(text: "played_matches".tr()),
                        Tab(text: "coming_matches".tr()),
                      ]
                  ),
                ),
                Container(
                    height:MediaQuery.of(context).size.height,
                    child: TabBarView(
                        children: [
                          TeamStats(),
                          EndedMatches(),
                          ComingMatches(),
                        ]
                    )
                )
              ]
          )
      ),
    );
  }
}

