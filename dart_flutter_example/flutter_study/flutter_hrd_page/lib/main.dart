import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_hrd_page/check/controller/check_controller.dart';
import 'package:flutter_hrd_page/default/view/default_page.dart';
import 'package:provider/provider.dart'; //위젯들 가져오는애

void main(){
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=>CheckController()),
        ],
        child: MyApp(),
    )
  );
}

//MyApp에는 MaterialApp을 들고있고 MaterialApp은 home을 들고있음.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("메인 빌드됨");
    return MaterialApp(
      home:DefaultPage() ,
    );
  }
}