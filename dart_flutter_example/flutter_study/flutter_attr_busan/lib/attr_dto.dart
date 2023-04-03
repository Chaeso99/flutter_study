class AttrDTO {
  //MAIN_TITLE
  //CNTCT_TEL
  //MAIN_IMG_THUMB

  //카멜케이스 형식으로
  String mainTitle;
  String cntctTel;
  String mainImgThumb;

  AttrDTOs({
  required this.mainTitle, required this.cntctTel, required this mainImgThumb,
});

  factory AttrDTO fromjson (dynamic json) => AttrDTO(
  mainTitle : json["MAIN_TITLE"],
  cntctTel : json["CNTCT_TEL"],
  mainImgThumb: json["MAIN_IMG_THUMB"],
)
  static List<AttrDTO> fromJsonList(List json){
    jsonList.map((e)=>AttrDTO.fromJson(e)).toList();

}
}