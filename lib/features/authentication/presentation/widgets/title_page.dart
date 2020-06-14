import 'package:flutter/material.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Center(
        child: SingleChildScrollView(
            child: Text(
              'Connectez-vous !',
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            )),
      ),
    );
  }
}