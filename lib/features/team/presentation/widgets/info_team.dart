import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'widgets.dart';

class InfoTeam extends StatelessWidget {
  const InfoTeam({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          margin: const EdgeInsets.only(
            left: 20,
            top: 18,
            right: 20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10)
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 11,
                spreadRadius: 2.0,
              )
            ],
          ),
          child: DefaultTabController(
              length: 3,
              child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color:  Colors.grey, width: 0.6)),
                              ),
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
                            )
                        ),
                      ],
                    ),
                    Expanded(
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
        )
    );
  }
}

