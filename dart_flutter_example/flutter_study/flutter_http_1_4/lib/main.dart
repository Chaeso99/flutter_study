import 'package:flutter/material.dart';
import 'package:flutter_http_1_4/user/controller/user_table_controller.dart';
import 'package:flutter_http_1_4/user/view/pages/list_page.dart';
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
        create: (BuildContext context) => UserTableController(),
        child: ListPage(),
      )
    );
  }
}
