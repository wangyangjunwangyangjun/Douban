import 'package:flutter/material.dart';

//只有一句代码就可以使用箭头函数
main() => runApp(MyApp());

//Widget分为有状态和无状态
//有状态是运行过程中有一些状态需要改变
//无状态则是内容无需改变
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(debugShowCheckedModeBanner: false, home: HYHomePage());
  }
}

class HYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("标题"),
        ),
        body: HYContentBody());
  }
}
class HYContentBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HYContentBodyState();
  }
}
//stateful不能定义状态 -》 创建一个单独的类，这个类负责维护状态
class HYContentBodyState extends State<HYContentBody> {
  var flag = true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        //mainAxisAlignment居中
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
            value: flag,
            onChanged: (value) {
              //这里的setSate是通知界面更新
              setState(() {
                flag = value!;
              });
            },
          ),
          Text("同意协议", style: TextStyle(fontSize: 20),)
        ],
      ),
    );
  }
}
