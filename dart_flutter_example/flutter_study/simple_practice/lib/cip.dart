
import 'package:flutter/cupertino.dart';
import 'package:simple_practice/main.dart';

class ValueController with ChangeNotifier {
  //현재 곱하기 상태인지 더하기 상태인지 상태를 저장하는 함수 하나
  //누른 숫자를 넣는 함수 하나

  var historyList = ["0"];
  String historyval ="아무값";

  double oldval = 0;
  String stat = "";

  double _val = 0;
  String valStr="0";
  String get val => valStr;

  void checkDot(valDot){
    if(valDot.endsWith(".")) {
      valStr = valDot.substring(0, valDot.length - 1);
    }
  }

  void changeValue(value){
    String tempval = valStr;
    if(valStr == "0") //값이 0이면 누른 값을 0대신 집어넣음
        {
          if(value==".")
            {
              valStr="0.";
            }
          else
            {
              valStr=value.toString();
            }
    }
    else //0 이외의 값이면 뒷자리에 누른 값을 붙임
        {
      valStr = valStr + value.toString();
      if(value=="."&&tempval.contains("."))
        {
          valStr = tempval;
        }
    }
    notifyListeners();
  }

  void changeValueStat(String value){
    if(value == "C")
    {
      valStr = "0";
    }

    else if(value == "history")
      {  historyList.removeLast();
        historyval=historyList.last;
        valStr = historyval;
      }

    else if(value == "backspace")
    {
      if(valStr.length==1)
      {
        valStr="0";
      }
      else
      {
        valStr = valStr.substring(0, valStr.length-1);
      }
    }
    else if(value == "plus")
    {
      checkDot(valStr);
      oldval = double.parse(valStr);
      valStr="0";
      stat = "plus";
    }
    else if(value == "minus")
    {
      checkDot(valStr);
      oldval = double.parse(valStr);
      valStr="0";
      stat = "minus";
    }
    else if(value == "multiply")
    {
      checkDot(valStr);
      oldval = double.parse(valStr);
      valStr="0";
      stat = "multiply";
    }
    else if(value == "divide")
    {
      checkDot(valStr);
      oldval = double.parse(valStr);
      valStr="0";
      stat = "divide";
    }
    else if(value == "remain") {
      checkDot(valStr);
      oldval = double.parse(valStr);
      valStr="0";
      stat = "remain";
    }

    else if(value == "is")
    {
      checkDot(valStr);
      _val = double.parse(valStr);
      double result = 0;
      switch(stat){
        case "plus":
          result = oldval+_val;
          break;
        case "minus":
          result = oldval-_val;
          break;
        case "multiply":
          result = oldval*_val;
          break;
        case "divide":
          result = (oldval~/_val) as double;
          break;
        case "remain":
          result = oldval%_val;
          break;
        default :
          result = double.parse(valStr);
          break;
      }
      valStr = result.toString();
      historyList.add(valStr);
      stat = "";
    }
    notifyListeners();
  }
}