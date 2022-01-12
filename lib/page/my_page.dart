import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Text(
          "我的",
          style: TextStyle(color: Colors.white, decoration: TextDecoration.none),
        ),
      ),
    );
  }
}
