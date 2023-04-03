import 'package:flutter/material.dart';
import 'package:flutter_attr_busan/attr_item.dart';

class AttrPage extends StatelessWidget {
  const AttrPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

        child: ListView(
          children: listState.value.map((e) => AttrItem(attrDTO: e)).toList(),
        ),
      ),
    );
  }
}
