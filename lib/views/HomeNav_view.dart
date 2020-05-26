

import 'package:flutter/material.dart';
import 'package:stat19_app_mobile/app_router.dart';
import 'package:stat19_app_mobile/ressource/themes.dart';
import 'package:stat19_app_mobile/services/web_service.dart';

import '../components/nav-menu_component.dart';
import '../models/menu_item.dart';

class HomeNavigationBar extends Drawer{
  static WebService _ws = new WebService();

  HomeNavigationBar({Key key, BuildContext context}):super(key:key,
    child: Container(
      color: MENU_BACKGROUND_COLOR,
      child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child:Column(
                  children: <Widget>[
                    Material(
                      child:Image.asset("images/football-player-icon.jpg",color: MENU_BACKGROUND_ONPRESS_COLOR, colorBlendMode: BlendMode.color),
                    ),
                    Padding(padding:EdgeInsets.all(8.0),child:Text("${_ws.currentUser.username}",textAlign: TextAlign.end,))
                  ],
                )
              ),
            ),
            ListTileTheme(
                selectedColor: btn_color,
                child: ListTile(
                  title: Text("Profils",  style:TextStyle(fontWeight: FontWeight.bold)),
                  leading:ICON_ACCOUNT,
                  onTap: (){
                  onClick("menu Profils");
                  },
                  onLongPress: (){
                    onClick("menu Profils");
                  },
                )
            ),
            ListTileTheme(
                selectedColor: btn_color,
                 child: ListTile(
                    title: Text("Parametre",  style:TextStyle(fontWeight: FontWeight.bold)),
                    leading: Icon(Icons.settings),
                    onTap: (){
                    onClick("menu Parametre");
                    },
                    onLongPress: (){
                      onClick("menu Parametre");
                    },
                  )
              ),
            ListTileTheme(
                selectedColor: btn_color,
                child: ListTile(
                  title: Text("Deconnection",  style:TextStyle(fontWeight: FontWeight.bold)),
                  leading:Icon(Icons.schedule),
                  onTap: (){
                    onClick("menu Deconnection");
                    // TODO deconnexion via deshautehtification service
                    Navigator.of(context).pushReplacementNamed(NamedRoute.CONNECTION_ROUTE);
                  },
                  onLongPress: (){
                    onClick("menu Deconnection");
                    // TODO deconnexion via deshautehtification service
                    Navigator.of(context).pushReplacementNamed(NamedRoute.CONNECTION_ROUTE);
                  },
                )
            ),
            NavMenu.withIcon(new Menu.avecSousMenu(
                name:"Menu",
                listSousMenus:[new Menu.sansSousMenu("...1.1"),new Menu.sansSousMenu("...1.2")]
                   ), Icons.home ),
            NavMenu.single(new Menu.sansSousMenu("autre menu")),

          ]),
    )
  );
  static Color btn_color = MENU_BACKGROUND_ONPRESS_COLOR;
   static onClick(String value){
     print(value);
   }
}

