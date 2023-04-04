class NameDTO {
  final String characterName;

  NameDTO({
    required this.characterName,
  });

  factory NameDTO.fromJson(dynamic json) => NameDTO(
        characterName: json["CharacterName"],
      );

  static List<NameDTO> fromJsonList(List jsonList) {
    return jsonList.map((e) => NameDTO.fromJson(e)).toList();
  }
}
