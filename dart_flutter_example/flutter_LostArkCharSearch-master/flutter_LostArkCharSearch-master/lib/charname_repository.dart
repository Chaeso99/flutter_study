import 'dart:convert';

import 'package:http/http.dart' as http;
import 'charname_dto.dart';

class CharNameRepository {
  static Future<List<NameDTO>?> getDTO(String charName) async {
    // final String url =
    //     "https://apis.data.go.kr/6260000/AttractionService/getAttractionKr?serviceKey=oGKbCDCXuLZ8JgTtEerm9oeF5uEDGodCs0IddQge74Sf1w6crhRPabRCkI4Hq8h48x4QyT3TnoK%2FtTFge8wQlQ%3D%3D&pageNo=1&numOfRows=10&resultType=json";
    final String url =
        'https://developer-lostark.game.onstove.com/characters/$charName/siblings';

    // Map.of("accept", "application/json",);

    http.Response response = await http.get(Uri.parse(url), headers: {
      "accept": "application/json",
      "authorization":
          'bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6IktYMk40TkRDSTJ5NTA5NWpjTWk5TllqY2lyZyIsImtpZCI6IktYMk40TkRDSTJ5NTA5NWpjTWk5TllqY2lyZyJ9.eyJpc3MiOiJodHRwczovL2x1ZHkuZ2FtZS5vbnN0b3ZlLmNvbSIsImF1ZCI6Imh0dHBzOi8vbHVkeS5nYW1lLm9uc3RvdmUuY29tL3Jlc291cmNlcyIsImNsaWVudF9pZCI6IjEwMDAwMDAwMDAyMTYyMDkifQ.g9mt5AuOSA1AQRpmFW9pLstAfLPYCeCZgdYTBPkjRNtp_H5q-Ygg623vIvJyqvQZBXFGmfA-YeHHL1gQ5dXJykpC_JjYdT6FueVStHfe-_XWgS61OPysjTjVyB934cOab8O5hMW6b_0tSYBcymlM3bf2_P9P79pY-eRuHrZyedJL6z82LcO-YJOGYVUTGCVtdMpMC9zML8lBZYpbEEtcIdx3mfu7gyMOor9ZUBVRhPM07IRJjGNF34oUtR8tkfjyFKd6nToME_UYTB-TIqzlAdvc5Ci7Z70HYTanK34zzFNj0_VvZAeHZDNhrd2fTWYOHVk5sxG_YwAggAdojA8chA'
    });
    if (response.statusCode == 200) {
      dynamic json = jsonDecode(response.body);
      // if(json == null){
      //   return null;
      // }
      return NameDTO.fromJsonList(json);
    } else {
      print(response.statusCode);
      return null;
    }
  }
}
