import 'package:bili/http/core/hi_error.dart';
import 'package:bili/http/core/hi_net.dart';
import 'package:bili/http/request/test_request.dart';
import 'package:bili/widget/search_bar.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Function callback = (BuildContext context, int index) {
    print("点击了${index}");
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: ListView(
        children: [
          SearchBar(
            hideLeft: true,
            defaultText: '',
            searchBarType: SearchBarType.normal,
            hint: '在这里输入搜索关键字',
            leftButtonClick: () {
              Navigator.pop(context);
            },
            onChanged: _onTextChanged,
          ),
          _buildCircleAvatar1(),
          const SizedBox(
            height: 10,
          ),
          _buildClipOval(),
          const SizedBox(
            height: 10,
          ),
          _buildStackAvatar(),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 150,
            child: Swiper(
              itemCount: 2,
              autoplay: true,
              pagination: SwiperPagination(),
              control: SwiperControl(),
              itemBuilder: (context, index) {
                return _buildGestureDetector();
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Divider(
            height: 2,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              child: Container(
                height: 40,
                width: 80,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    '点击',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            onTap: () async {
              BotToast.showText(text: '按钮被点击');
              TestRequest request = TestRequest();
              request.add("aaa", "bbb").add("ccc", "dddd");
              try {
                var result = await HiNet.getInstance().fire(request);
                print(result);
              } on NeedAuth catch (e) {
                print(e.message);
              } on NeedLogin catch (e) {
                print(e.message);
              } on HiNetError catch (e) {
                print(e.message);
              } catch (e) {
                print(e.message);
              }
            },
          ),
          ElevatedButton(
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return SearchPage();
              // }));
              showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return Container(
                      width: 400,
                      height: 300,
                      child: Text(
                        '我的',
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                    );
                  });
            },
            child: Text("CustomText"),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.grey),
              overlayColor: MaterialStateProperty.all(Colors.blue),
            ),
          ),
        ],
      )),
    );
  }

  GestureDetector _buildGestureDetector() {
    return GestureDetector(
      onTap: () {
        callback.call();
      },
      child: Image.asset(
        "assets/images/mn.png",
        fit: BoxFit.cover,
      ),
    );
  }

  Stack _buildStackAvatar() {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipOval(
          child: Container(
            width: 160,
            height: 160,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.lightBlueAccent, Colors.blueAccent])),
          ),
        ),
        ClipOval(
          child: Container(
            width: 150,
            height: 150,
            color: Colors.white,
          ),
        ),
        ClipOval(
          child: Image.asset(
            "assets/images/mn.png",
            width: 140,
            height: 140,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }

  _buildClipOval() {
    return SizedBox(
      width: 140,
      height: 140,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          ClipOval(
            child: Image.asset(
              "assets/images/mn.png",
              width: 140,
              height: 140,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }

  CircleAvatar _buildCircleAvatar1() {
    return CircleAvatar(
      backgroundImage: AssetImage("assets/images/mn.png"),
      child: Container(
        child: Stack(
          children: const [
            Positioned(
              child: Text(
                '在线',
                style: TextStyle(color: Colors.white),
              ),
              bottom: 10,
              right: 10,
            )
          ],
        ),
      ),
      radius: 80,
    );
  }

  _onTextChanged(String text) {}
}
