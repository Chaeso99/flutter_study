import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main()async{
  await Supabase.initialize(
      url: "https://tuizoxssgzutponybrcp.supabase.co",
      anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR1aXpveHNzZ3p1dHBvbnlicmNwIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODA1NzIyNDMsImV4cCI6MTk5NjE0ODI0M30.fxvARb8cDjIhTmTBQic17ZTZRxq-xldD_FW0DTtxzcA",
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Supabase.instance.client.from("todo").select().then((value){
    //   print(value);
    // }); //todo는 우리가 만든 테이블명이다. 가장 바깥은 List형식[], 안쪽은 map 형식의 key:value, key:value 로 나옴
    
    //실시간 통신
    Supabase.instance.client.from("todo").stream(primaryKey: ["idx"]).listen((event) {
      print(event);
    });
    
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: StreamBuilder<List<Map<String, dynamic>>>(
            stream: Supabase.instance.client.from("todo").stream(primaryKey: ["idx"]),
            builder: (context, snapshot) {
              return ListView(
                //앞의 데이터가 null이면 빈리스트[] 넣어줄게 라는뜻
                children: snapshot.data?.map((e) => Text(e["content"])).toList() ?? [],
              );
            }
          ),
        ),
      ),
    );
  }
}
