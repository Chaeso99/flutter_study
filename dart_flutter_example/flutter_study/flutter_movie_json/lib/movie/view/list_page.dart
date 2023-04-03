import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_movie_json/movie/model/dto/movie_dto.dart';
import 'package:flutter_movie_json/movie/model/repository/movie_repository.dart';
import 'package:http/http.dart' as http;

class ListPage extends HookWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final listState = useState<List<MovieDTOTable>?>(null);

    useEffect((){
      MovieRepository.instance.getDTOList().then((value){
        listState.value = value;
      });
    },[]);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: listState.value?.map((e) => ListItem(movieDTOTable: e)).toList()?? [],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  MovieDTOTable movieDTOTable;

  ListItem({Key? key, required this.movieDTOTable}) : super(key: key);

  // 기본적인 UI 세팅(원래 만들었던 예제와 동일)
  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     padding: EdgeInsets.all(10),
  //     decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.black)),
  //     child: Column(
  //       children: [
  //         Text("영화제목 : ${movieDTOTable.movieNm}"),
  //         Divider(),
  //         Text("개봉일 : ${movieDTOTable.openDt}"),
  //         Divider(),
  //         Text("랭킹 : ${movieDTOTable.rank}"),
  //         Divider(),
  //         Text("관객 수 : ${movieDTOTable.audiCnt}")
  //       ],
  //     ),
  //   );
  // } //build

  @override
  Widget build(BuildContext context) {
    return Row(
          children:[
            Divider(height: 20,),
            Column(
              children: [
                //이미지 들어갈 부분 추가필요
                Divider(),
                Text("영화제목 : ${movieDTOTable.movieNm}"),
                Divider(),
                Text("개봉일 : ${movieDTOTable.openDt}"),
                Divider(),
                Text("랭킹 : ${movieDTOTable.rank}"),
                Divider(),
                Text("관객 수 : ${movieDTOTable.audiCnt}"),
              ],
            ),
          ],
    );
  }
}
