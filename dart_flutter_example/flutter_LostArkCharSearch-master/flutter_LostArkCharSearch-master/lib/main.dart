import 'package:flutter/material.dart';
import 'package:flutter_lostark/lostark_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("로스트아크 원정대 캐릭터 검색"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: '닉네임을 입력해주세요',
              hintText: '캐릭터 닉네임',
            ),
            keyboardType: TextInputType.name,
            onSubmitted: (value) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(charName: value),
                ),
              );
            },
          ),
        )
      ),
    );
  }
}
