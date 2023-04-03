import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_http_1/post/model/repository/post_repository.dart';


class DetailPage extends HookWidget {
  final int postId;

  const DetailPage({Key? key, required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final detailState = useStatie<PostDitail

    useEffect(
        PostRepository.instance.getDTO.then(value)0){
          detailState.value = value;
    };

    return Scaffold(
      body: SafeArea(
        child: detailState.value != ? Column(
          children: [
            Text("유저번호 : "),
            Text("글번호 : "),
            Text("제목 : "),
          ],
        ),
      ),
    );
  }
}
