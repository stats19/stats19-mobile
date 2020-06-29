import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
//      height: MediaQuery.of(context).size.height / 3,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
              'connection',
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          ).tr(),
        ),
      ),
    );
  }
}