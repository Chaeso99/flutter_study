import 'package:flutter/material.dart';
import 'package:flutter_navigator_pushnamed_practice/view/one.dart';

class twoPage extends StatelessWidget {
  const twoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String>? args; //받아오는 데이터 타입과 같아야함

    try{
      //args=ModalRoute.of(context)?.settings.arguments as String?; //String을 받을때
      args=ModalRoute.of(context)?.settings.arguments as List<String>?; //List를 받을때
    }catch(e){
      print(e);
    }
    
    return WillPopScope(
        onWillPop: (){
      Navigator.pop(context, "돌려받았습니다.");
      return Future.value(true);
    },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("두번째 화면"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //List의 각 원소를 map으로 반복계산(map)해서 다시 List<String>형으로 변경. ??뒤에도 널값일때 표시할 내용이 List<String>형으로 들어가야함
            children: args?.map((e) => Text(e)).toList() ?? [Text("잘못된 요청입니다.")],
              //Text(args ??"잘못된 요청입니다."),
             /* ElevatedButton(onPressed: (){
                showToast(context, "토스트메세지내용");
              }, child: Text("토스트"),
              )*/

          ),
        ),
      ),
    );
  }
}

void showToast(BuildContext context, String message) { //화면 아래쪽의 한줄정도되는 공간(잠깐 안내메세지 띄울때 주로 사용)
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}
