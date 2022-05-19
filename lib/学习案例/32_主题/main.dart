import 'package:flutter/material.dart';
import 'package:flutter_learn/%E5%AD%A6%E4%B9%A0%E6%A1%88%E4%BE%8B/32_%E4%B8%BB%E9%A2%98/theme_share.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: HYAppTheme.normalTheme,
        //暗黑模式
        darkTheme: HYAppTheme.darkTheme,
        home: HYHomePage());
  }
}

class HYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: HYHomeContent(),
    );
  }
}

class HYHomeContent extends StatefulWidget {
  @override
  State<HYHomeContent> createState() => _HYHomeContentState();
}

class _HYHomeContentState extends State<HYHomeContent> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
