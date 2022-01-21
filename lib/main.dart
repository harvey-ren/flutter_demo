import 'package:bili/page/home_page.dart';
import 'package:bili/page/tabbar_page.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          brightness:Brightness.light,
          primarySwatch: Colors.blue,
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          backgroundColor: Colors.white),
      builder: (context, child) {
        child = botToastBuilder(context, child);
        return child;
      },
      navigatorObservers: [BotToastNavigatorObserver()],
      home: HomePage(),
    );
  }
}
