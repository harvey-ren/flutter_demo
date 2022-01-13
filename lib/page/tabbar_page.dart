import 'package:flutter/material.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key key}) : super(key: key);

  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List tabs = ["新闻", "历史", '图片'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: 220,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    width: 1, color: Colors.blue, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.blue,
                indicatorSize: TabBarIndicatorSize.tab,
                controller: _tabController,
                indicator: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                tabs: tabs.map((e) => Tab(text: e)).toList(),
              ),
            ),
            Expanded(
                child: TabBarView(
              //构建
              controller: _tabController,
              children: tabs.map((e) {
                return Container(
                  alignment: Alignment.center,
                  child: Text(e, textScaleFactor: 3),
                );
              }).toList(),
            ))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // 释放资源
    _tabController.dispose();
    super.dispose();
  }
}
