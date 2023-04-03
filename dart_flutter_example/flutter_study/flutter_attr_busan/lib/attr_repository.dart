import 'dart:convert';

import 'package:flutter_attr_busan/attr_dto.dart';
import 'package:http/http.dart' as http;

class AttrRepository {
  static Future<List<AttrDTO>?> getDTO() async {
    final String url = "https://apis.data.go.kr/6260000/AttractionService/getAttractionKr?serviceKey=g3%2FAuxiiARVuMl8t%2B2l9KVfFq2jcIu5MY6PkLcFKLJ3RZvz2UQDeTl1CCsbaxfrTw7BbYnPQlxkunGyPvdrx8A%3D%3D&pageNo=1&numOfRows=10&resultType=json";
    http.Response response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      dynamic json = jsonDecode(response.body);
      return AttrDTO.fromJsonList(json["getAttractionKr"]["item"]);
    } else {
      return null;
    }
  }
}