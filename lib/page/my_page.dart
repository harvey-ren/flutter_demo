import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          alignment: Alignment.center,
          index: 1,
          children: [
            // 黄色 300
            Container(
              width: 300,
              height: 300,
              color: Colors.orange,
            ),
            // 红色 200
            Container(
              width: 200,
              height: 200,
              color: Colors.red,
            ),
            // 蓝色 100
            Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
