class UserDTOTable{
  int id; //아이디
  String name; //이름
  String email; //이메일

  UserDTOTable(
       {required this.id,
        required this.name,
        required this.email});

  factory UserDTOTable.fromJson(dynamic json) => UserDTOTable(
    id:json["id"],
    name:json["name"],
    email:json["email"],
  );

  static List<UserDTOTable> fromJsonList(List jsonList){
    return jsonList.map((json) => UserDTOTable.fromJson(json)).toList();
  }
}

class UserDTODetail{
  int id; //아이디
  String name; //이름
  String email; //이메일
  String username; //성

  UserDTODetail(
       {required this.id,
        required this.name,
        required this.email,
        required this.username});

  factory UserDTODetail.fromJson(dynamic json) => UserDTODetail(
    id:json["id"],
    name:json["name"],
    email:json["email"],
    username: json["username"],
  );
}