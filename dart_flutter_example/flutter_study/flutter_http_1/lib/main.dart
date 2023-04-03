import 'package:flutter/material.dart';
import 'package:flutter_http_1/post/controller/post_table_controller.dart';
import 'package:flutter_http_1/post/view/pages/list_page.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        //create는 함수를 받음
        create: (BuildContext context) => PostTableController(),
        child: ListPage(),
      ),
    );
  }
}