import 'package:flutter/material.dart';

import '../pages/registration_page.dart';

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
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return RegistrationPage(
                    );
                  }));
            },
            child: Text("Inscrivez vous ! "),
          ),
        ],
      ),
    );
  }
}