import 'dart:convert';
import 'package:flutter_http_1_5/user/model/dto/user_dto.dart';
import 'package:http/http.dart' as http;

class UserRepository{
  static UserRepository? _instance;

  //private 생성자(기본 public 생성자를 제거하기 위해 만듬)
  //dart에서 private는 이름 맨 앞에 언더바를 붙임.
  UserRepository._constructor(){}

  //싱글톤 객체 getter
  static UserRepository get instance => _instance ??= UserRepository._constructor();

  //값을 넘겨주는 함수. 통신은 실패할 수 있으므로 nullable
  Future<List<UserDTOTable>?> getDTOList()async{
    String url = "https://jsonplaceholder.typicode.com/users";
    http.Response response = await http.get(Uri.parse(url));

    if(response.statusCode == 200)
    {
      return UserDTOTable.fromJsonList(jsonDecode(response.body));
    }else{
      return null;
    }
  }
}