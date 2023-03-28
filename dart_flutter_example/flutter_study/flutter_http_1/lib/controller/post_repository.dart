//post_repository.dart
import 'dart:convert';

import 'package:flutter_http_1/controller/post_dto.dart';
import 'package:http/http.dart' as http;

class PostRepository{
  //싱글톤 - 해당 타입의 객체가 프로그램에서 단 한개만 존재
  //스태틱 변수 선언
  static PostRepository? _instance; //첨에는 null이니까 ? 붙임. 지금은 인스턴스가 아니라 오브젝트 상태임

  //public 생성자 제거(public 생성자가 있으면 여러개 만들수 있어서 막아야됨)
  //dart에서 private는 맨 앞에 언더바(_)를 붙인다.
  PostRepository._canAnyName(){
    // count++;
    // print(count);
  } //생성자 이름은 아무거나 만들어도 상관없음 앞에다가 언더바 붙이기

  // static int count = 0;

  //변수 ?? 대체값
  //?? 뒤에는 변수가 null일 경우 대체값으로 들어가는(리턴되는) 내용
  //String str = [null일수도 있는 String]; 이면 에러나는데 String str = [null일수도 있는 String] ?? "값없음";은 가능
  //String str = "값없음";
  //계속 null이라서 부를때마다 새 객체가 호출됨
  //--------------------------------------------------------------------
  //변수 ??= 대입값
  //변수가 null일 경우 변수에 대입값을 넣고 리턴한다.
  //String str = [null일수도 있는 String] ??= "값이 없음";
  //String str = ["값이 없음"라는 값이 들어간 null일수도 있는 String];
  //위 단계에서 값이 들어가기 때문에 다음번 호출할때는 null 아님(새 객체는 한번만 생기고 다음부터는 원래 객체 불러져서 싱글톤 동작)

  //싱글톤 객체 getter
  static PostRepository get instance => _instance ??= PostRepository._canAnyName();

  //값을 넘겨주는 함수. 통신은 실패할 수 있으므로 nullable임
  Future<List<PostDTOTable>?> getDTOList() async{
    String url = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(Uri.parse(url));

      if(response.statusCode==200){ //http 상태 코드. 200은 정상 진행
       return PostDTOTable.fromJsonList(jsonDecode(response.body));
      }else{
        return null;
      }
    }
  }

void main() {
  //PostRepository.instance; //생성자를 불러서 1 출력
  //PostRepository.instance; //생성자를 불러서 2 출력
  //PostRepository.instance; //생성자를 불러서 3 출력
  // (??대신 ??=이면 싱글톤이 적용되어서 여러번 불러도 1 한번만 출력됨)
}