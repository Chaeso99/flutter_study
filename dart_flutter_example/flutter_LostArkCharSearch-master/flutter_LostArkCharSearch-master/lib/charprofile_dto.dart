class ProfileDTO {
  final String charImage;
  final String serverName;
  final String characterName;
  final int characterLevel;
  final String characterClassName;
  final String itemAvgLevel;
  final String itemMaxLevel;

  ProfileDTO({
    required this.charImage,
    required this.serverName,
    required this.characterName,
    required this.characterLevel,
    required this.characterClassName,
    required this.itemAvgLevel,
    required this.itemMaxLevel,
  });

  factory ProfileDTO.fromJson(dynamic json) {
    // print(json);
    return ProfileDTO(
      charImage: json["CharacterImage"] ?? "http://cheongjucci.korcham.net/images/no-image01.gif",
      serverName: json["ServerName"],
      characterName: json["CharacterName"] ?? "",
      characterLevel: json["CharacterLevel"] ?? "",
      characterClassName: json["CharacterClassName"] ?? "",
      itemAvgLevel: json["ItemAvgLevel"] ?? "",
      itemMaxLevel: json["ItemMaxLevel"] ?? "",
    );
  }

  static List<ProfileDTO> fromJsonList(List jsonList) {
    return jsonList.map((e) => ProfileDTO.fromJson(e)).toList();
  }
}
