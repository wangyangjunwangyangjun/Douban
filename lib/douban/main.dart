import 'package:flutter/material.dart';
import 'package:flutter_learn/douban/pages/main/main.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            splashColor: Colors.transparent,
          //高亮颜色（点击出现的水波纹可以去掉）
            highlightColor: Colors.transparent,

        ),
        home: HYMainPage());
  }
}
