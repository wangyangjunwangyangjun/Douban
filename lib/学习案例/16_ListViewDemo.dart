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

class HYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("列表测试"),
      ),
      body: ListViewDemo03(),
    );
  }
}

class ListViewDemo03 extends StatelessWidget {
  const ListViewDemo03({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (BuildContext ctx, int index) {
          return Text(
            "Hello World",
            style: TextStyle(fontSize: 20),
          );
        },
        separatorBuilder: (BuildContext ctx, int index) {
          return Divider(
            color: Colors.red,
            thickness: 3,
            indent: 10,
          );
        },
        itemCount: 100);
  }
}

class ListViewDemo01 extends StatelessWidget {
  const ListViewDemo01({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      // scrollDirection: Axis.horizontal,
      // reverse: true,

      // item高度
      // itemExtent: 100,
      children: List.generate(100, (index) {
        return ListTile(
          leading: Icon(Icons.people),
          trailing: Icon(Icons.delete),
          title: Text("联系人${index + 1}"),
          subtitle: Text("联系人电话号码：188888222221"),
        );
      }),
    );
  }
}

class ListViewDemo02 extends StatelessWidget {
  const ListViewDemo02({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 100,
        itemExtent: 60,
        itemBuilder: (BuildContext ctx, int index) {
          return Text(
            "Hello World",
            style: TextStyle(fontSize: 20),
          );
        });
  }
}
