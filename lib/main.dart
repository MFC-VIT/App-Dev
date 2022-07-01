import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/splash.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  var prefs = await SharedPreferences.getInstance();
  var boolKey = 'isFirstTime';
  var isFirstTime = prefs.getBool(boolKey) ?? true;
  runApp(MyApp(prefs: prefs, isFirstTime: isFirstTime));
}

class MyApp extends StatelessWidget {
  final bool isFirstTime;
  final SharedPreferences prefs;
  static const boolKey = 'isFirstTime';
  const MyApp({
    Key? key,
    required this.isFirstTime,
    required this.prefs,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodieland',
      theme: ThemeData(),
      home: SplashScreen(prefs: prefs, isFirstTime: isFirstTime),
      debugShowCheckedModeBanner: false,
    );
  }
}
