import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stat19_app_mobile/features/authentication/data/datasources/user_local_data_source.dart';
import 'package:stat19_app_mobile/features/authentication/presentation/pages/authentication_page.dart';

import '../../../features/navigation/presentation/bloc/navigation_bloc.dart';
import '../../../injection_container.dart';

enum TabItem { home, search, refresh, fantasy, profile }

Map<TabItem, String> tabName = {
  TabItem.home: 'home'.tr(),
  TabItem.search: 'search'.tr(),
  TabItem.refresh: 'refresh'.tr(),
  TabItem.fantasy: 'fantasy'.tr(),
  TabItem.profile: 'profile'.tr(),
};

Map<TabItem, MaterialColor> activeTabColor = {
  TabItem.home: Colors.blue,
  TabItem.search: Colors.blue,
  TabItem.refresh: Colors.blue,
  TabItem.fantasy: Colors.blue,
  TabItem.profile: Colors.blue
};

class BottomNavigation extends StatelessWidget {
  BottomNavigation({this.currentTab, this.onSelectTab});

  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

//  final snackBar = SnackBar(content: Text('Yay! A SnackBar!'));
//
//// Find the Scaffold in the widget tree and use it to show a SnackBar.
//  Scaffold.of(context).showSnackBar(snackBar);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<NavigationBloc>(),
      child: BlocListener<NavigationBloc, NavigationState>(
        listener: (context, state) {
          if (state is Loaded) {
            final snackBar = SnackBar(content: Text('Les données on été mise à jour'));
            Scaffold.of(context).showSnackBar(snackBar);
          }
        },
        child: BlocBuilder<NavigationBloc, NavigationState>(
            builder: (context, state) {
          Color color = Colors.black;
          if (state is NavigationInitial || state is Loaded) {
            color = Colors.black;
          } else if (state is Loading) {
            color = Colors.grey;
          } else if (state is Error) {
            color = Colors.red;
          }

          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: [
              _buildItem(tabItem: TabItem.home, icon: Icons.home),
              _buildItem(tabItem: TabItem.search, icon: Icons.search),
              _buildItem(
                  tabItem: TabItem.refresh, icon: Icons.refresh, color: color),
              _buildItem(tabItem: TabItem.fantasy, icon: Icons.group),
              _buildItem(tabItem: TabItem.profile, icon: Icons.exit_to_app),
            ],
            onTap: (index) {
              if (index == 2) {
                BlocProvider.of<NavigationBloc>(context)
                    .add(RefreshForecastEvent());
              } else if (index == 4 ){
                SharedPreferences.getInstance().then((value){
                  value.remove(CACHED_AUTH_TOKEN).then((value){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return AuthenticationPage();
                      }),
                    );
                  });
                });
              }

              else {
                return onSelectTab(
                  TabItem.values[index],
                );
              }
            },
          );
        }),
      ),
    );
  }

  BottomNavigationBarItem _buildItem(
      {TabItem tabItem, IconData icon, Color color}) {
    color = color != null ? color : _colorTabMatching(item: tabItem);
    String text = tabName[tabItem];
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: color,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: _colorTabMatching(item: tabItem),
        ),
      ),
    );
  }

  Color _colorTabMatching({TabItem item}) {
    return currentTab == item ? activeTabColor[item] : Colors.black;
  }
}
