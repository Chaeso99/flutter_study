//테이블 용
class PostDTOTable {
  int userId; //유저번호
  int id; //글 번호
  String title;//제목

  PostDTOTable({required this.userId, required this.id, required this.title});
  
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