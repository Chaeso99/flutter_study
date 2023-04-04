import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_lostark/charname_dto.dart';
import 'package:flutter_lostark/charprofile_dto.dart';
import 'package:flutter_lostark/charprofile_repository.dart';
import 'package:flutter_lostark/lostark_item.dart';
import 'package:flutter_lostark/charname_repository.dart';

class ProfilePage extends HookWidget {
  const ProfilePage({Key? key, required this.charName}) : super(key: key);
  final String charName;
  @override
  Widget build(BuildContext context) {
    final listState = useState<List<NameDTO?>>([]);
    final listState2 = useState<List<ProfileDTO>>([]);

    useEffect(() {
      CharNameRepository.getDTO(charName).then((value) {
        if (value != null) {
          listState.value = value;
          print(value.map((e) => e.characterName));
          CharProfileRepository.getDTO(value).then((value){
            listState2.value = value;
          });
        }
      });
    }, []);

    if(listState2.value.isEmpty){
      return Scaffold(
        body: SafeArea(
          child: Container(
            alignment: Alignment.center,
            child: Text("검색 결과 없음"),
          )
        ),
      );
    }else{
      return Scaffold(
        body: SafeArea(
          child: ListView(
            children:
            listState2.value.map((e) => LostarkItem(profileDTO: e)).toList(),
          ),
        ),
      );
    }
  }
}
