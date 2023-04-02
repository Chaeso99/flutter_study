import 'dart:convert';

import 'package:flutter_movie_json/movie/model/dto/movie_dto.dart';
import 'package:http/http.dart' as http;

class MovieRepository{

  static MovieRepository? _instance;

  MovieRepository._MRConstructor(){
  }

  //싱글톤 객체 getter
  static MovieRepository get instance => _instance ??= MovieRepository._MRConstructor();

  Future<List<MovieDTOTable>?> getDTOList() async{
    String url = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=20120101";
    http.Response response = await http.get(Uri.parse(url));

    if(response.statusCode==200){ //http 상태 코드. 200은 정상 진행
      return MovieDTOTable.fromJsonList(jsonDecode(response.body)['boxOfficeResult']['dailyBoxOfficeList']);
    }else{
      return null;
    }
  }
}

void main() {

}