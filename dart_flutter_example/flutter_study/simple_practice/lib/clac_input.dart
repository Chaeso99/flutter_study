
import 'package:flutter/cupertino.dart';
import 'package:simple_practice/main.dart';

class ValueController with ChangeNotifier {
  //현재 곱하기 상태인지 더하기 상태인지 상태를 저장하는 함수 하나
  //누른 숫자를 넣는 함수 하나

  double oldval = 0;
  String stat = "";

  double _val = 0;
  String valStr="";
  String get val => _val.toString();

  void changeValue(value){
    if(_val == 0) //값이 0이면 누른 값을 0대신 집어넣음
      {
        _val = value;
      }
    else //0 이외의 값이면 뒷자리에 누른 값을 붙임
      {
        _val = double.parse(_val.toString()+value.toString());
      }

    notifyListeners();
  }

  void changeValueStat(String value){
    if(value == "C")
      {
        _val = 0;
      }

    else if(value == "dot")
      {
        valStr =_val.toString();
        valStr = valStr+".";
        //print(valStr);
        if(valStr.endsWith("."))
          {
            
          }
        else
        {
          _val = double.parse(valStr);
        }
      }

    else if(value == "backspace")
      {
        valStr = _val.toString();
        if(valStr.length==1)
        {
          valStr="0";
        }
        else{
          valStr = valStr.substring(0, valStr.length-1);
        }
        _val = double.parse(valStr);
      }
    else if(value == "plus")
      {
        oldval = _val;
        _val = 0;
        stat = "plus";
      }
    else if(value == "minus")
    {
      oldval = _val;
      _val = 0;
      stat = "minus";
    }
    else if(value == "multiply")
    {
      oldval = _val;
      _val = 0;
      stat = "multiply";
    }
    else if(value == "divide")
    {
      oldval = _val;
      _val = 0;
      stat = "divide";
    }
    else if(value == "remain") {
      oldval = _val;
      _val = 0;
      stat = "remain";
    }

    else if(value == "is")
      {
        switch(stat){
          case "plus":
            _val = oldval+_val;
            break;
          case "minus":
            _val = oldval-_val;
            break;
          case "multiply":
            _val = oldval*_val;
            break;
          case "divide":
            _val = (oldval~/_val) as double;
            break;
          case "remain":
            _val = oldval%_val;
        }
        stat = "";
      }
    notifyListeners();
  }
}