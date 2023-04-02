class MovieDTOTable { //영화정보 테이블
  String movieNm; //영화 이름
  String openDt; //개봉일
  String rank; //랭킹
  String audiCnt; //관객 수

  MovieDTOTable({required this.movieNm, required this.openDt,
    required this.rank, required this.audiCnt});

  factory MovieDTOTable.fromJson (dynamic json) => MovieDTOTable(
    movieNm: json["movieNm"],
    openDt: json["openDt"],
    rank: json["rank"],
    audiCnt: json["audiCnt"],
  );

  static List<MovieDTOTable> fromJsonList(List jsonList){
    return jsonList.map((json) => MovieDTOTable.fromJson(json)).toList();
  }

}

//상세 페이지용
class MovieDTODetail{

}