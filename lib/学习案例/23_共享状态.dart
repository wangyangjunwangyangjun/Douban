import 'package:flutter/material.dart';

main() => runApp(MyApp());

/**
 * 1、共享数据
 * 2、定义构造方法
 * 3、获取组件最近的当前InheritedWidget
 * 4、决定要不要回调State中的didChangeDependencies
 */

class HYCounterWidget extends InheritedWidget {
  final int counter;
  HYCounterWidget({required this.counter, child}): super(child: child);
  static HYCounterWidget? of(BuildContext context) {
    // 沿着Element树，去找到最近的HYCounterElement
    return context.dependOnInheritedWidgetOfExactType();
  }

  //返回true：执行依赖当前的InheritedWidget的state中的didChangeDependencies方法
  @override
  bool updateShouldNotify(HYCounterWidget oldWidget) {
    // return true;
    //判断counter是否发生改变，改变就返回true
    return oldWidget.counter != counter;
  }
}

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
  int _counter = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("状态管理"),
      ),
      body: HYCounterWidget(
        counter: _counter,
        child: Column(
          children: [
            HYShowData01(),
            HYShowData02()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            this._counter++;
          });
        },
      ),
    );
  }
}
class HYShowData01 extends StatefulWidget {
  const HYShowData01({Key? key}) : super(key: key);

  @override
  State<HYShowData01> createState() => _HYShowData01State();
}

class _HYShowData01State extends State<HYShowData01> {

  // 依赖InheritedWidget（HYCounterWidget），
  // 当数据改变时，会调用这里的didChangeDependencies方法
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("执行了_HYHomePageState中的didChangeDependencies方法");
  }

  @override
  Widget build(BuildContext context) {
    int? counter = HYCounterWidget.of(context)?.counter;
    return Card(
      color: Colors.red,
      child: Text("当前计数：${counter}"),
    );
  }
}
class HYShowData02 extends StatelessWidget {
  const HYShowData02({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int? counter = HYCounterWidget.of(context)?.counter;
    return Card(
      color: Colors.blue,
      child: Text("当前计数：${counter}"),
    );
  }
}
