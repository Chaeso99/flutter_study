import 'package:flutter/material.dart';
import 'package:flutter_lostark/charname_dto.dart';
import 'package:flutter_lostark/charprofile_dto.dart';

class LostarkItem extends StatelessWidget {
  final ProfileDTO profileDTO;

  const LostarkItem({Key? key, required this.profileDTO}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.black)),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                    child: FadeInImage.assetNetwork(
                  placeholder: 'Assets/Spinner.gif',
                  image: profileDTO.charImage,
                )),
                Expanded(
                    child: Column(
                  children: [
                    Text("서버 : " + profileDTO.serverName,
                        textAlign: TextAlign.center),
                    Text("캐릭터명 : " + profileDTO.characterName,
                        textAlign: TextAlign.center),
                    Text("전투레벨 : " + profileDTO.characterLevel.toString(),
                        textAlign: TextAlign.center),
                    Text("클래스명 : " + profileDTO.characterClassName,
                        textAlign: TextAlign.center),
                    Text("평균아이템레벨 : " + profileDTO.itemAvgLevel,
                        textAlign: TextAlign.center),
                    Text("최고아이템레벨 : " + profileDTO.itemMaxLevel,
                        textAlign: TextAlign.center),
                  ],
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
