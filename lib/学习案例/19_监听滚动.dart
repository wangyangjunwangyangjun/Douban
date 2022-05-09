import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue, splashColor: Colors.transparent),
        home: HYHomePage());
  }
}

class HYHomePage extends StatefulWidget {
  @override
  State<HYHomePage> createState() => _HYHomePageState();
}

class _HYHomePageState extends State<HYHomePage> {
  ScrollController _controller = ScrollController(initialScrollOffset: 300);
  bool _isShowFloatingButton = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      // print("监听到滚动--${_controller.offset}");
      setState(() {
        _isShowFloatingButton = _controller.offset >= 1000;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    /**
     * 两种方式可以监听：
     * controller：
     *    1、设置默认值
     *    2、监听滚动，也可以监听滚动的位置
     * NotificationListener
     *    1、监听开始滚动和结束滚动
     */
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom ScrollView"),
      ),
      body: NotificationListener(
        onNotification: (ScrollNotification notification) {
          if(notification is ScrollStartNotification) {
            print("开始滚动");
          } else if (notification is ScrollEndNotification) {
            print("结束滚动");
          } else if(notification is ScrollUpdateNotification) {
            print("正在滚动...，总滚动的范围为${notification.metrics.maxScrollExtent}；当前滚动的像素为${notification.metrics.pixels}");
          }
          return true;
        },
        child: ListView.builder(
            controller: _controller,
            itemCount: 100,
            itemBuilder: (BuildContext ctx, int index) {
              return ListTile(
                leading: Icon(Icons.people),
                title: Text("联系人$index"),
              );
            }),
      ),
      floatingActionButton: _isShowFloatingButton
          ? FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: () {
          _controller.animateTo(0,
              duration: Duration(seconds: 1), curve: Curves.easeIn);
        },
      )
          : null,
    );
  }
}
