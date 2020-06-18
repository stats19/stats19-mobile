import 'package:flutter/material.dart';
import 'package:stat19_app_mobile/core/presentation/widgets/info_square.dart';

class TeamStats extends StatelessWidget {
  const TeamStats({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      GridView.count(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          crossAxisCount: 3,
          children: List.generate(playersdata.length, (index) {
            return Center(
              child: InfoSquare(data: playersdata[index]),
            );
          })
      ),
    );
  }
}