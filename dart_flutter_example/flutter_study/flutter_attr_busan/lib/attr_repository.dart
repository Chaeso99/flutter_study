import 'dart:convert';

import 'package:flutter_attr_busan/attr_dto.dart';
import 'package:http/http.dart' as http;

class AttrRepository{
  static Future<AttrDTO?> getDTO() async{
    final String url = "https://www.visitbusan.net/uploadImgs/files/cntnts/20191222164810529_thumbL";
    http.Response response = await http.get(Uri.parse(url));
    if(response.statusCode==200){
      jsonDecode(response.body);
      return AttrDTO.fromJsonList(json);
    }else {
      return null;
    }
  }
}