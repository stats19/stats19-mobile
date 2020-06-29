import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'app_router.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('fr')],
      path: 'lib/resources/lang', // <-- change patch to your
      fallbackLocale: Locale('en'),
      child: MyApp()
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'router',
      onGenerateRoute: routing,
      initialRoute: NamedRoute.CONNECTION_ROUTE,
      // List all of the app's supported locales here
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
