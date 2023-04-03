import 'package:flutter/material.dart';
import 'package:flutter_http_1_5/user/view/pages/detail_page.dart';
import 'package:flutter_http_1_5/user/view/pages/list_page.dart';
import 'package:go_router/go_router.dart';

class Routes{
  static const String listpage ='listpage';
  static const String detailpage ='detailpage';
  static final GoRouter goRouter = GoRouter(
    initialLocation :'/listpage',
    routes:[
      GoRoute(
        name:Routes.listpage,
        path:'/listpage',
        builder: (context, state) => ListPage(),
      ),
      GoRoute(
        name: Routes.detailpage,
        path: '/:userId',
        builder: (context, state) => DetailPage(userId: int.parse(state.params["userId"]!)),
      ),
    ],
  );
}