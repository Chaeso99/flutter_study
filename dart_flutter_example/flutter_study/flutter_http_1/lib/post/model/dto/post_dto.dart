//테이블 용
class PostDTOTable { //Post가 게시판을 뜻하는것임
  int userId; //유저번호
  int id; //글 번호
  String title;//제목

  PostDTOTable({required this.userId, required this.id, required this.title});

  //팩토리:생성자를 통해서 객체를 만들려고 하는데 처리가 번거로울 경우 사용함
  //어떠한 타입을 받아서 클래스 내부에서 객체를 생성해서 리턴 해주기 위함
  factory PostDTOTable.fromJson (dynamic json) => PostDTOTable(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
  );
  //모양은 화살표 함수와 비슷, 기능과 역할은 다르다.
  
  //팩토리 아님, 일반 함수임
  //JSON은 JSON인데 LIST타입의 데이터를 받는 JSON
  static List<PostDTOTable> fromJsonList(List jsonList){
    return jsonList.map((json) => PostDTOTable.fromJson(json)).toList(); //괄호안에 e를 그대로 써도되고 json으로 바꿔도되고..
  }

}

//상세 페이지용
class PostDTODetail{
  int userId; //유저번호
  int id; //글 번호
  String title;//제목
  String body; //내용

  PostDTODetail({required this.userId, required this.id,
    required this.title, required this.body});

}