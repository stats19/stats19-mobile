import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child:
        Image.asset(
          "lib/resources/assets/ball_loading.gif",
        height: 100.0,
        width: 100.0,
        ));
//        CircularProgressIndicator());
  }
}
