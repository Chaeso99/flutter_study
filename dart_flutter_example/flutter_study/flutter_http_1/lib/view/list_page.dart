import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_http_1/controller/post_dto.dart';
import 'package:http/http.dart' as http;

class ListPage extends HookWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //더미 데이터
    //PostDTOTable postDTOTable = PostDTOTable(userId: 0, id: 0, title: "테스트 제목");

    //실제 데이터
    //통신은 실패할 수 있다 = nullable
    final listState = useState<List<PostDTOTable>?>(null);

    //final jsonState = useState<String?>(null);

    //useEffect(작동함수, 관찰할 상태 리스트);
    //빌드가 완료되면 작동한다
    //관찰하는 상태가 변경되면 작동한다
    //관찰하는 상태가 없으면 빌드시 한번 작동한다.
    useEffect((){
      String url = "https://jsonplaceholder.typicode.com/posts";
      http.get(Uri.parse(url)).then((response) {
        //정상적으로 받아왔는지 체크
        //200은 정상 응답
        if(response.statusCode==200){
          //string을 json 형식으로 파싱
          //들어오는 타입이 객체일지 리스트일지.. 뭔지 몰라서 다이나믹으로 받음
            //dynamic decodedBody = jsonDecode(response.body); //body는 우리가 받아오는 데이터(클래스로 만든 객체가 아니고 문자열임) 제이슨디코드가 Dynamic 타입으로 바꿔줌(파싱해줌)
            //json을 Map List로 캐스팅
            //List jsonList = decodedBody as List;
            //List를 map 함수로 풀어서 요소를 PostDTOTable로 변경 => state에 입력
          listState.value = PostDTOTable.fromJsonList(jsonDecode(response.body));
            //listState.value = jsonList.map((data){
                // return PostDTOTable(
                //     userId: data["userId"], id: data["id"], title: data["title"]);
              //return PostDTOTable.fromJson(data);
            //}).toList();
          }
        //jsonState.value = response.body;
      });
    },[]);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: listState.value?.map((e) => ListItem(postDTOTable: e)).toList()?? [],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  PostDTOTable postDTOTable;

  ListItem({Key? key, required this.postDTOTable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.black)),
      child: Column(
        children: [
          Text("유저번호 : ${postDTOTable.userId}"),
          Divider(),
          Text("글 번호 : ${postDTOTable.id}"),
          Divider(),
          Text("글 제목 : ${postDTOTable.title}"),
        ],
      ),
    );
  }
}
