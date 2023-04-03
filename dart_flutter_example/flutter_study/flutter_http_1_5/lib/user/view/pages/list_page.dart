import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_http_1_5/routes.dart';
import 'package:flutter_http_1_5/user/controller/user_table_controller.dart';
import 'package:flutter_http_1_5/user/model/dto/user_dto.dart';
import 'package:flutter_http_1_5/user/model/repository/user_repository.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ListPage extends HookWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final controller = context.watch<UserTableController>();

    useEffect((){
      controller.setUserDTOTableList();
    },[]);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: controller.userDTOTableList?.map((e)=>ListItem(userDTOTable: e)).toList()?? [],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  UserDTOTable userDTOTable;

  ListItem({Key? key, required this.userDTOTable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        context.pushNamed(Routes.detailpage, params: {"userId" : userDTOTable.id.toString()});
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.orange)),
        child: Column(
          children: [
            Text("아이디 : ${userDTOTable.id}"),
            Divider(),
            Text("이름 : ${userDTOTable.name}"),
            Divider(),
            Text("이메일 : ${userDTOTable.email}"),
          ],
        ),
      ),
    );
  }
}
