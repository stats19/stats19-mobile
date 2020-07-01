import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

import 'app.dart';
import 'features/authentication/data/datasources/user_local_data_source.dart';
import 'features/authentication/presentation/pages/authentication_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  var shared = await SharedPreferences.getInstance();
  var token = shared.get(CACHED_AUTH_TOKEN);
  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('fr')],
      path: 'lib/resources/lang', // <-- change patch to your
      fallbackLocale: Locale('en'),
      child: MyApp(token: token,)
  ));
}

class MyApp extends StatefulWidget {
  final String token;

  const MyApp({Key key, this.token}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(
          seconds: 3,
          navigateAfterSeconds: MaterialApp(
            title: 'router',
            home: widget.token != null ? App() : AuthenticationPage(),
            // List all of the app's supported locales here
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
          ),
          title: new Text('Stats19',
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0
            ),),
          image: new Image.asset('lib/resources/assets/splash.png'),
          backgroundColor: Colors.white,
          styleTextUnderTheLoader: new TextStyle(),
          photoSize: 100.0,
          onClick: ()=>print("Flutter Egypt"),
          loaderColor: Colors.red
      ),
    );
  }
}