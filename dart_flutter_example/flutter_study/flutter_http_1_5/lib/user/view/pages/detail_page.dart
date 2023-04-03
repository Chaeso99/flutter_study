import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_http_1_5/user/model/dto/user_dto.dart';
import 'package:flutter_http_1_5/user/model/repository/user_repository.dart';

class DetailPage extends HookWidget {
  final int userId;

  const DetailPage({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final detailState = useState<UserDTODetail?>(null);

    useEffect(() {
      UserRepository.instance.getDTO(userId).then((value) {
        detailState.value = value;
      });
    }, []);

    return Scaffold(
      body: SafeArea(
        child: detailState.value != null
            ? Column(
                children: [
                  Text("아이디: ${detailState.value!.id}"),
                  Text("이름: ${detailState.value!.name}"),
                  Text("이메일: ${detailState.value!.email}"),
                ],
              )
            : Text("값이 없습니다."),
      ),
    );
  }
}
