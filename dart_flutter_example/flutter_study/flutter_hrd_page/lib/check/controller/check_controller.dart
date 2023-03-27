
import 'package:flutter/cupertino.dart';

class CheckController extends ChangeNotifier{
 bool _isChecked = false;

 bool get isChecked => _isChecked;
 
 void change(){
   _isChecked = !_isChecked; //true랑 false를 왔다갔다함
   notifyListeners();
 }
}