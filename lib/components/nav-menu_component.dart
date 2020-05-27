import 'package:flutter/material.dart';
import 'package:stat19_app_mobile/models/menu_item.dart';
import 'package:stat19_app_mobile/ressource/themes.dart';

class NavMenu extends StatefulWidget{
  Menu _menu;
  NavMenu();
  NavMenu.single(this._menu);
  NavMenu.withIcon(this._menu,this.iconImage);
  IconData iconImage;
  @override
  State<StatefulWidget> createState() => NavMenuState(menu:_menu,iconData:iconImage);
}

class NavMenuState extends State<NavMenu>{
  NavMenuState({Menu menu,IconData iconData}){
    this.menu = menu;
    this.sousMenus = menu.hasSousMenus()==true?menu.listSousMenus():null;
    arrow =  menu.hasSousMenus()?CLOSE_ARROW:Icon(Icons.arrow_drop_up);
    optionnelIcon = Icon(iconData);
  }
  Menu menu;
  List<Menu> sousMenus;
  Icon optionnelIcon;
  Icon arrow;
  bool developSousMenu;
  @override
  void initState() {
    developSousMenu = false;
    super.initState();
  }

  void onPressAction(){
    menu.open()==true?menu.set_open(false):menu.set_open(true);
    setState(() {
      if(menu.hasSousMenus()){
        arrow = menu.open() && menu.hasSousMenus()?OPEN_ARROW:CLOSE_ARROW;
      }
      developSousMenu = menu.open()==true && menu.hasSousMenus()?true:false;
    });
    print(menu.name+": isOpen: "+menu.open().toString() );
  }
  List<NavMenu> listSousMenu(){
    List<NavMenu> sous_NavMenu_menus = new List<NavMenu>();
    for(Menu item in sousMenus){
      sous_NavMenu_menus.add(new NavMenu.single(item));
    }
    return sous_NavMenu_menus;
  }

  Widget buildMenuViewOrListView(){
    if(developSousMenu){
      return Column(
        children: <Widget>[
          ListTileTheme(
            selectedColor: MENU_BACKGROUND_ONPRESS_COLOR,
            child:  ListTile(
              title: Text('${menu.name}'),
              trailing: this.arrow,
              onLongPress: (){
                onPressAction();
              },
              onTap: (){
                onPressAction();
              },
            ),
          ),
          Column(children:listSousMenu()),
        ],
      );
    }
    return ListTileTheme(
      selectedColor: MENU_BACKGROUND_ONPRESS_COLOR,
      child: ListTile(
        title: Text('${menu.name}', style:TextStyle(fontWeight: FontWeight.bold)),
        leading:optionnelIcon!=null?optionnelIcon:Row(),
        trailing: this.arrow,
        onLongPress: (){
          onPressAction();
        },
        onTap: (){
          onPressAction();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildMenuViewOrListView();
  }
}