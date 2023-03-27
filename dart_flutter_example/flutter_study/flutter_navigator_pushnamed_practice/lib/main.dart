import 'package:flutter/material.dart';
import 'package:flutter_navigator_pushnamed_practice/routes.dart';
import 'package:flutter_navigator_pushnamed_practice/view/one.dart';
import 'package:flutter_navigator_pushnamed_practice/view/two.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Routes.route1: (context) => const onePage(),
        Routes.route2: (context) => const twoPage(),
      },
      initialRoute: Routes.route1,
    );
  }
}
