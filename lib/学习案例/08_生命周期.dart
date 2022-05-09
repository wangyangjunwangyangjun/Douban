import 'package:flutter/material.dart';
import 'package:flutter_learn/%E5%AD%A6%E4%B9%A0%E6%A1%88%E4%BE%8B/02_checkbox.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HYHomePage(),
    );
  }
}
class HYHomePage extends StatelessWidget {

  HYHomePage() {
    print("调用HYHomePage的构造函数");
  }

  @override
  Widget build(BuildContext context) {
    print("调用HYHomePage的build方法");
    return Scaffold(
      appBar: AppBar(
        title: Text("生命周期"),
      ),
      body: HYHomeContent(),
    );
  }
}
class HYHomeContent extends StatefulWidget {
  HYHomeContent() {
    print("1、调用HYHomeContent的构造函数");
  }

  @override
  State<HYHomeContent> createState() {
    print("2、调用_HYHomeContent的createState方法");
    return _HYHomeContentState();
  }
}

class _HYHomeContentState extends State<HYHomeContent> {
  int _count = 0;

  _HYHomeContentState() {
    print("3、调用_HYHomeContentState的构造函数");
  }
  @override
  void initState() {
    //这里是必须调用super
    //原因：父类做初始化、mustcallSuper注解
    print("4、调用_HYHomeContentState的initState方法");
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    print("5、调用_HYHomeContentState的build方法");
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              setState(() {
                _count++;
              });
            },
            child: Icon(Icons.add)
        ),
        Text("数字:$_count")
      ],
    );
  }
  @override
  void didChangeDependencies() {
    print("调用_HYHomeContentState的didChangeDependencies方法");
    super.didChangeDependencies();
  }
  @override
  void didUpdateWidget(covariant HYHomeContent oldWidget) {
    print("调用_HYHomeContentState的didUpdateWidget方法");
    super.didUpdateWidget(oldWidget);
  }
  @override
  void dispose() {
    print("6、调用_HYHomeContentState的dispose方法");
    super.dispose();
  }
}