import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:stat19_app_mobile/core/presentation/widgets/loading_widget.dart';

import '../../../../core/presentation/widgets/info_square.dart';
import '../bloc/player_bloc.dart';
import 'title_filter.dart';


class StatsPlayer extends StatelessWidget {
  const StatsPlayer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<PlayerBloc, PlayerState>(
        builder: (context, state) {
          if (state is Loading) {
            return LoadingWidget();
          } else if (state is Loaded) {
            return Container(
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
              child: Column(
                children: <Widget>[
                  TitleFilter(),
                  GridView.count(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      crossAxisCount: 3,
                      children: [
                    InfoSquare(type: "age".tr(),value: state.player.age),
                    InfoSquare(type: "weight".tr(),value: lbsToKg(state.player.weight) ),
                    InfoSquare(type: "height".tr(),value: state.player.height),
                    InfoSquare(type: "goals".tr(),value: state.player.goals),
                    InfoSquare(type: "on_target".tr(),value: state.player.shotOnTarget),
                    InfoSquare(type: "red_card".tr(),value: state.player.redCards),
                    InfoSquare(type: "yellow_card".tr(),value: state.player.yellowCards),
                  ]),
                ],
              ),
            );
          } else if (state is Error) {
            return Text('there is error' + state.message);
          }
          return Container();
        });
  }

  int lbsToKg(int weight) {
    double kgWeight = weight / 2.2;
    return kgWeight.round();
  }
}