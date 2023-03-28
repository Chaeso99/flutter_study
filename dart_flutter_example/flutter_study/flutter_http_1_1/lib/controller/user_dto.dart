class UserDTOTable{
  int id; //아이디
  String name; //이름
  String email; //이메일

  UserDTOTable({required this.id, required this.name,
    required this.email});

  factory UserDTOTable.fromJson(dynamic json) => UserDTOTable(
    id:json["id"],
    name:json["name"],
    email:json["email"],
  );
}
