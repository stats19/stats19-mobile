import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stat19_app_mobile/features/authentication/data/datasources/user_local_data_source.dart';
import 'package:stat19_app_mobile/features/authentication/presentation/pages/authentication_page.dart';
import 'app.dart';
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

class MyApp extends StatelessWidget {
  final String token;

  const MyApp({Key key, this.token}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'router',
      home: token != null ? App() : AuthenticationPage(),
      // List all of the app's supported locales here
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}