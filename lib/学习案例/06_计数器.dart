import 'package:flutter/material.dart';
import 'package:flutter_learn/%E5%AD%A6%E4%B9%A0%E6%A1%88%E4%BE%8B/02_checkbox.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HYHomePage(),
    );
  }
}
class HYHomePage extends StatelessWidget {
  const HYHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品列表"),
      ),
      body: HYHomeContent(),
    );
  }
}

//Widget是暴露给别人使用的，state是私有的
class HYHomeContent extends StatefulWidget {
  const HYHomeContent({Key? key}) : super(key: key);
  final String messgae = "信息从Widget传到state";
  @override
  State<HYHomeContent> createState() => _HYHomeContentState();
}

//当状态改变时，并不希望重新创建新的state
class _HYHomeContentState extends State<HYHomeContent> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _getButton(),
          Text("当前计数: $_counter", style: TextStyle(fontSize: 25),),
          Text("传递的信息：${widget.messgae}", style: TextStyle(fontSize: 20),)
        ],
      ),
    );
  }

  Widget _getButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              _counter++;
            });
          },
          child: Text("+", style: TextStyle(fontSize: 20, color: Colors.white),),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green)
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _counter--;
            });
          },
          child: Text("-", style: TextStyle(fontSize: 20, color: Colors.white),),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red)
          ),
        )
      ],
    );
  }
}
