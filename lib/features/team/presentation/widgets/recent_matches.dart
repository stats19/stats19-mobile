import 'package:flutter/material.dart';

class RecentMatches extends StatelessWidget {
  const RecentMatches({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
                "Les derniers matchs",
                style : TextStyle(color: Colors.white,  fontSize: 20)
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(5),
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(50))
                ),
                child: ButtonTheme(
                  minWidth: 25,
                  height: 25,
                  padding: EdgeInsets.all(0),
                  child: Align(
                    child: FlatButton(
                        onPressed: null,
                        textColor: Colors.white,
                        child: Text("V", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),)
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(5),
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(50))
                ),
                child: ButtonTheme(
                  minWidth: 25,
                  height: 25,
                  padding: EdgeInsets.all(0),
                  child: Align(
                    child: FlatButton(
                        onPressed: null,
                        textColor: Colors.white,
                        child: Text("D", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),)
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(5),
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(50))
                ),
                child: ButtonTheme(
                  minWidth: 25,
                  height: 25,
                  padding: EdgeInsets.all(0),
                  child: Align(
                    child: FlatButton(
                        onPressed: null,
                        textColor: Colors.white,
                        child: Text("N", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),)
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(5),
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(50))
                ),
                child: ButtonTheme(
                  minWidth: 25,
                  height: 25,
                  padding: EdgeInsets.all(0),
                  child: Align(
                    child: FlatButton(
                        onPressed: null,
                        textColor: Colors.white,
                        child: Text("V", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),)
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}