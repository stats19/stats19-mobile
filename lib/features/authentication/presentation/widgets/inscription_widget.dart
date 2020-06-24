import 'package:flutter/material.dart';

class InscriptionWidget extends StatelessWidget {
  const InscriptionWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text("Pas encore de compte ?"),
          FlatButton(
            child: Text("Inscrivez vous ! "),
          ),
        ],
      ),
    );
  }
}