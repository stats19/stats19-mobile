import 'package:flutter/material.dart';

import 'core/presentation/widgets/bottom_navigation.dart';
import 'core/presentation/widgets/navigation.dart';
class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {

  TabItem _currentTab = TabItem.home;
  Map<TabItem, GlobalKey<NavigatorState>> _navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.search: GlobalKey<NavigatorState>(),
    TabItem.refresh: GlobalKey<NavigatorState>(),
    TabItem.fantasy: GlobalKey<NavigatorState>(),
    TabItem.profile: GlobalKey<NavigatorState>()
  };

  void _selectTab(TabItem tabItem) {
    print("hehe");
    if (tabItem == _currentTab) {
      // pop to first route
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      print(tabItem.toString());
      setState(() => _currentTab = tabItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        _buildOffstageNavigator(TabItem.home),
        _buildOffstageNavigator(TabItem.search),
        _buildOffstageNavigator(TabItem.refresh),
        _buildOffstageNavigator(TabItem.fantasy),
        _buildOffstageNavigator(TabItem.profile)
      ],),
      bottomNavigationBar: BottomNavigation(
        currentTab: _currentTab,
        onSelectTab: _selectTab,
      ),
    );
  }


  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}