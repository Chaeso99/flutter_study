import 'package:flutter/material.dart';
import 'package:flutter_navigator_pushnamed_practice/routes.dart';

var tempList = ["1번", "2번", "3번"];

class onePage extends StatelessWidget {
  const onePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("첫번째 화면"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed:(){
                  //Navigator.pushNamed(context, Routes.route2, arguments: "안녕하세요").then((value) => print(value)); //String "안녕하세요"를 보낼때
                  Navigator.pushNamed(context, Routes.route2, arguments: tempList).then((value) => print(value)); //List 를 보낼때
                },
                child: const Text("두번째 화면 열기\n(현재 화면 위로 열기)"),
            ),
            const SizedBox( //버튼에 패딩을 주고싶을때 한쪽만 공간을 주면 되는경우
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
