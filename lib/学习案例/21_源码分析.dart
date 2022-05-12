import 'dart:math';

import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue, splashColor: Colors.transparent
        ),
        home: HYHomePage()
    );
  }
}

class HYHomePage extends StatefulWidget {
  @override
  State<HYHomePage> createState() => _HYHomePageState();
}

class _HYHomePageState extends State<HYHomePage> {
  final List<String> names = ["aaaa", "bbbbb", "cccccc"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("列表测试"),
      ),
      body: ListView(
        children:
        names.map((item) {
          //把名字作为key
          // return ListItemFul(item, key: ValueKey(names),);
          return ListItemFul(item, key: UniqueKey(),);

        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          setState(() {
            names.removeAt(0);
          });
        },
      ),
    );
  }
}

class ListItemFul extends StatefulWidget {
  final String name;

  ListItemFul(this.name, {key}): super(key: key);

  @override
  State<ListItemFul> createState() => _ListItemFulState();
}

class _ListItemFulState extends State<ListItemFul> {
  final Color randColor = Color.fromARGB(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Text(widget.name),
      height: 80,
      color: randColor,
      width: double.infinity,
    );
  }
}

