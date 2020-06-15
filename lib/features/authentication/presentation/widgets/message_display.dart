import 'package:flutter/material.dart';

import '../../../../ressource/themes.dart';

class MessageDisplay extends StatelessWidget {
  final String message;
  const MessageDisplay({
    Key key,
    this.message
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SingleChildScrollView(
            child: Text(
              message,
              style: TextStyle(fontSize: 18, color: ERROR_COLOR),
              textAlign: TextAlign.center,
            )),
      ),
    );
  }
}