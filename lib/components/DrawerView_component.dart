

import 'package:flutter/material.dart';
import 'package:stat19_app_mobile/ressource/themes.dart';

class Menu{
  String _name;
  bool _isOpen;
  bool _hasSousMenus;
  List<Menu> _sousMenus;
  Color _onpressColor = Color.fromRGBO(196, 208, 4, 1.0);
  Menu();
  Menu.sansSousMenu(this._name){
    this._isOpen = false;
    this._hasSousMenus = false;
    _sousMenus = null;
    // _icon_arrow = CLOSE_ARROW;
  }
  Menu.avecSousMenu({String name,List<Menu> listSousMenus}){
    this._name = name;
    this._isOpen = false;
    this._hasSousMenus = true;
    this._sousMenus = new List<Menu>.from(listSousMenus);
  }
  bool open() => _isOpen;
  void set_open(bool open){
    _isOpen = open;
  }
  bool hasSousMenus() => this._hasSousMenus;
  List<Menu> listSousMenus() => this._sousMenus;
  get name => this._name;
  set name(String name) => this._name = name;
}

class HomeNavigationBar extends Drawer{
  HomeNavigationBar({Key key}):super(key:key,
    child: Container(
      color: MENU_BACKGROUND_COLOR,
      child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child:Column(
                  children: <Widget>[
                    Material(
                      child:Image.asset("images/football-player-icon.jpg",color: Color.fromRGBO(196, 208, 4,1.0), colorBlendMode: BlendMode.color),
                    ),
                    Padding(padding:EdgeInsets.all(8.0),child:Text("show username here",textAlign: TextAlign.end,))
                  ],
                )
              ),
            ),
            ListTile(
              title: Text("Profils"),
              onTap: ()=> onClick("Menu"),
            ),
            ListTile(
              title: Text("Parametre"),
              onTap: ()=> onClick("menu Parametre"),
            ),
            ListTile(

              title: Text("Deconnexion"),
              onTap: ()=> onClick("menu Deconnexion"),
            ),
            NavMenu(new Menu.sansSousMenu("Menu")),
            NavMenu(new Menu.avecSousMenu(
                name:"Menu avec sous Menu",
                listSousMenus:[new Menu.sansSousMenu("...1.1"),new Menu.sansSousMenu("...1.2")]
              )
            ),

          ]),
    )
  );

   static onClick(String value){
     print(value);
   }
}

class NavMenu extends StatefulWidget{
  Menu _menu;
  NavMenu(this._menu);
  @override
  State<StatefulWidget> createState() => NavMenuState(menu:_menu);
}

class NavMenuState extends State<NavMenu>{
  NavMenuState({Menu menu,}){
    this.menu = menu;
    this.sousMenus = menu.hasSousMenus()==true?menu.listSousMenus():null;
  }
  Menu menu;
  List<Menu> sousMenus;

  Icon arrow;
  bool developSousMenu;
  @override
  void initState() {
    arrow = CLOSE_ARROW;
    developSousMenu = false;
    super.initState();
  }

  void onPressAction(){
    menu.open()==true?menu.set_open(false):menu.set_open(true);
    setState(() {
      arrow = menu.open() && menu.hasSousMenus()?OPEN_ARROW:CLOSE_ARROW;
      developSousMenu = menu.open()==true && menu.hasSousMenus()?true:false;
    });
    print(menu.name+": isOpen: "+menu.open().toString() );
  }
  List<NavMenu> listSousMenu(){
    List<NavMenu> sous_NavMenu_menus =  new List<NavMenu>();
    for(Menu item in sousMenus){
      sous_NavMenu_menus.add(new NavMenu(item));
    }
    return sous_NavMenu_menus;
  }
  Widget buildMenuViewOrListView(){
   if(developSousMenu){
      return Column(
        children: <Widget>[
          ListTile(
            title: Text('${menu.name}'),
            trailing: this.arrow,
            onLongPress: (){
              onPressAction();
            },
            onTap: (){
             onPressAction();
            },
          ),
          for(var sous_menu in sousMenus) new NavMenu(sous_menu),
        ],
      );
   }
   return ListTile(
     title: Text('${menu.name}'),
     trailing: this.arrow,
     onLongPress: (){
       onPressAction();
     },
     onTap: (){
       onPressAction();
     },
   );
  }

  @override
  Widget build(BuildContext context) {
    return buildMenuViewOrListView();
  }
}
