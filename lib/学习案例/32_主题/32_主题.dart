import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,

        //primarySwatch包含primaryColor和accentColor
        primarySwatch: Colors.blue,

        //单独设置导航栏和TabBar的颜色
        primaryColor: Colors.orange,

        //单独设置FloatingButton/Switch
        accentColor: Colors.green,

        //Button的主题
        buttonTheme: ButtonThemeData(
          height: 25,
          minWidth: 10,
          buttonColor: Colors.yellow,
        ),
        cardTheme: CardTheme(
          color: Colors.green,
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 16),
          bodyText2: TextStyle(fontSize: 20),
        ),
      ),
      home: HYHomePage(),
    );
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: "首页"),
        ],
      ),
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
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.purple,
      ),
      child: Center(
        child: Column(
          children: [
            Text(
              "Hello World",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            // Switch(value: true, onChanged: ),
          ],
        ),
      ),
    );
  }
}
