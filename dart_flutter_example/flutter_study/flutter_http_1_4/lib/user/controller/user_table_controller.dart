import 'package:flutter/material.dart';
import 'package:flutter_http_1_4/user/model/dto/user_dto.dart';
import 'package:flutter_http_1_4/user/model/repository/user_repository.dart';

class UserTableController extends ChangeNotifier{
  List<UserDTOTable>? _userDTOTableList;

  List<UserDTOTable>? get userDTOTableList => _userDTOTableList;

  void setUserDTOTableList(){
    UserRepository.instance.getDTOList().then((value) {
      _userDTOTableList = value;
      notifyListeners();
    });
  }
}