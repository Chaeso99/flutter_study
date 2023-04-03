
import 'dart:js';

import 'package:flutter_http_1/post/view/pages/detail_page.dart';
import 'package:flutter_http_1/post/view/pages/list_page.dart';
import 'package:go_router/go_router.dart';

class Routes{
  static const String posttable = 'table';
  static const String detail = 'detail';

  static final GoRouter goRouter = GoRouter(
    initialLocation: '/table',
      routes: [
        GoRoute(
            name: Routes.posttable,
            path: '/table',
            builder: (context, state) => ListPage(),
        ),
        GoRoute(
          name: Routes.detail,
          path: '/:postId',
          builder: (context, state) => DetailPage(postId: int.parse(state.params["postId"]!)),
        ),
      ],
  );
}