//third_page.dart
import 'package:flutter/material.dart';

// 객체 리스트를 받아서 화면 구성
class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //파싱된 데이터
    List<Post> postList = [
      Post(userId:0, id:0, title:"제목1", body: "내용1"),
      Post(userId:1, id:1, title:"제목2", body: "내용2"),
    ];

    //map에서 이용할 요소를 바꾸는 함수
    final change = (Post post){
      return Row(
        children: [
          Text("유저번호 : ${post.userId} | "),
          Text("글번호 : ${post.id} | "),
          Text("제목 : ${post.title} | "),
          Text("내용 : ${post.body}"),
        ],
      );
    };

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: postList.map(change).toList(),
        ),
      ),
    );
  }
}

class Post{
  int userId;
  int id;
  String title;
  String body;

  //Post(this.userId, this.id, this.title, this.body);
  Post(
      {
        required this.userId,
        required this.id,
        required this.title,
        required this.body});
}

void main(){ //main.dart 페이지에서 main함수를 실행하므로 얘는 동작안함
  //Post post1 = new Post(0, 0, "title", "content");
  Post post1 = new Post(
      userId: 0,
      id: 0,
      title: "제목",
      body: "내용"
  );
}