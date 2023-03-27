import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
//import 'package:simple_practice/clac_input.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:simple_practice/cip.dart';

launchMyURL() async {
  var uri = Uri.parse("https://www.youtube.com/");
  //String url = "https://naver.com";
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  }
}

void main() {
  runApp(
    MultiProvider(
      providers:[
       ChangeNotifierProvider(create: (context) => ValueController()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Calc(),
    );
  }
}

class Calc extends StatelessWidget {
   Calc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final valueController = context.watch<ValueController>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 14.0),
                    child: Icon(Icons.menu,
                    size: 40.0,),
                  ),
                  // Spacer(),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text
                      ("표준",
                        style:TextStyle(
                      fontSize: 40.0,
                    )
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                      onTap: () {
                        valueController.changeValueStat("history");
                      },
                      child: Icon(Icons.history, size: 40.0,)
                  ),
                ],
              ),
            ),
            Container(
                alignment: Alignment. centerRight,
                color: Colors.grey,
                child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 40),
              child: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text("${valueController.valStr}", style: TextStyle(fontSize: 50),),
              ),
            )),
            Container(
                child: Row(
              children: const[
                Padding(
                  padding: EdgeInsets.only(left: 80, right: 55),
                  child: Text("MC", style: TextStyle(fontSize: 27),),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 60, right:60),
                  child: Text("MR", style: TextStyle(fontSize: 27),),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 60, right: 60),
                  child: Text("M+", style: TextStyle(fontSize: 27),),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 60, right: 60),
                  child: Text("M-", style: TextStyle(fontSize: 27),),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 60, right: 60),
                  child: Text("MS", style: TextStyle(fontSize: 27),),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Text("M*", style: TextStyle(fontSize: 27),),
                ),
              ],
            )),
            Container(
                color: CupertinoColors.systemGrey2,
                child: Column(
                  children:[
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              valueController.changeValueStat("remain");
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Container(
                                alignment: Alignment.center,
                                width: 180,
                                height: 100,
                                padding: EdgeInsets.all(5.0),
                                color: CupertinoColors.systemGrey4,
                                child:Text("%", style: TextStyle(fontSize: 50),),
                              ),
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: (){launchMyURL();},
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Container(
                                alignment: Alignment.center,
                                width: 180,
                                height: 100,
                                padding: EdgeInsets.all(5.0),
                                color: CupertinoColors.systemGrey4,
                                child:Text("CE", style: TextStyle(fontSize: 42),),
                              ),
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              valueController.changeValueStat("C");
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Container(
                                alignment: Alignment.center,
                                width: 180,
                                height: 100,
                                padding: EdgeInsets.all(5.0),
                                color: CupertinoColors.systemGrey4,
                                child:Text("C", style: TextStyle(fontSize: 42),),
                              ),
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              valueController.changeValueStat("backspace");
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Container(
                                alignment: Alignment.center,
                                width: 180,
                                height: 100,
                                padding: EdgeInsets.all(5.0),
                                  color: CupertinoColors.systemGrey4,
                                child:Icon(Icons.backspace, size: 30,)
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        valueController.changeValue(7);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Container(
                                alignment: Alignment.center,
                                width: 180,
                                height: 100,
                                padding: EdgeInsets.all(5.0),
                                color: Colors.white,
                                child:Text("7", style: TextStyle(fontSize: 42),),
                              ),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                valueController.changeValue(8);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 180,
                                  height: 100,
                                  padding: EdgeInsets.all(5.0),
                                  color: Colors.white,
                                  child:Text("8", style: TextStyle(fontSize: 42),),
                                ),
                              ),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                valueController.changeValue(9);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 180,
                                  height: 100,
                                  padding: EdgeInsets.all(5.0),
                                  color: Colors.white,
                                  child:Text("9", style: TextStyle(fontSize: 42),),
                                ),
                              ),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                valueController.changeValueStat("multiply");
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Container(
                                    alignment: Alignment.center,
                                    width: 180,
                                    height: 100,
                                    padding: EdgeInsets.all(5.0),
                                  color: CupertinoColors.systemGrey4,
                                    child:Text("X", style: TextStyle(fontSize: 42),),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        valueController.changeValue(4);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Container(
                                alignment: Alignment.center,
                                width: 180,
                                height: 100,
                                padding: EdgeInsets.all(5.0),
                                color: Colors.white,
                                child:Text("4", style: TextStyle(fontSize: 42),),
                              ),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                valueController.changeValue(5);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 180,
                                  height: 100,
                                  padding: EdgeInsets.all(5.0),
                                  color: Colors.white,
                                  child:Text("5", style: TextStyle(fontSize: 42),),
                                ),
                              ),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                valueController.changeValue(6);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 180,
                                  height: 100,
                                  padding: EdgeInsets.all(5.0),
                                  color: Colors.white,
                                  child:Text("6", style: TextStyle(fontSize: 42),),
                                ),
                              ),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                valueController.changeValueStat("minus");
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 180,
                                  height: 100,
                                  padding: EdgeInsets.all(5.0),
                                  color: CupertinoColors.systemGrey4,
                                  child:Text("ㅡ", style: TextStyle(fontSize: 42),),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        valueController.changeValue(1);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Container(
                                alignment: Alignment.center,
                                width: 180,
                                height: 100,
                                padding: EdgeInsets.all(5.0),
                                color: Colors.white,
                                child:Text("1", style: TextStyle(fontSize: 42),),
                              ),
                            ),
                            Spacer(),
                            InkWell(
                              enableFeedback: true,
                              hoverColor: Colors.lightBlue,
                              onTap: () {
                                valueController.changeValue(2);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 180,
                                  height: 100,
                                  padding: EdgeInsets.all(5.0),
                                  color: Colors.white,
                                  child:Text("2", style: TextStyle(fontSize: 42),),
                                ),
                              ),
                            ),
                            Spacer(),
                            InkWell(
                              enableFeedback: true,
                              hoverColor: Colors.lightBlue,
                              onTap: () {
                                valueController.changeValue(3);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 180,
                                    height: 100,
                                    padding: EdgeInsets.all(5.0),
                                    color: Colors.white,
                                    child:Text("3", style: TextStyle(fontSize: 42),),
                                  ),
                              ),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                valueController.changeValueStat("plus");
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 180,
                                  height: 100,
                                  padding: EdgeInsets.all(5.0),
                                  color: CupertinoColors.systemGrey4,
                                  child:Text("+", style: TextStyle(fontSize: 42),),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 5),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              valueController.changeValueStat("divide");
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Container(
                                alignment: Alignment.center,
                                width: 180,
                                height: 100,
                                padding: EdgeInsets.all(5.0),
                                color: Colors.white,
                                child:Text("/", style: TextStyle(fontSize: 42),),
                              ),
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              valueController.changeValue(0);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Container(
                                alignment: Alignment.center,
                                width: 180,
                                height: 100,
                                padding: EdgeInsets.all(5.0),
                                color: Colors.white,
                                child:Text("0", style: TextStyle(fontSize: 42),),
                              ),
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              valueController.changeValue(".");
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Container(
                                alignment: Alignment.center,
                                width: 180,
                                height: 100,
                                padding: EdgeInsets.all(5.0),
                                color: Colors.white,
                                child:Text(".", style: TextStyle(fontSize: 42),),
                              ),
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              valueController.changeValueStat("is");
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Container(
                                alignment: Alignment.center,
                                width: 180,
                                height: 100,
                                padding: EdgeInsets.all(5.0),
                                color: Colors.blueGrey,
                                child:Text("=", style: TextStyle(fontSize: 42),),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]
                )
            )
          ],
        ),
      ),
    );
  }
}