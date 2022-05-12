import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

/**
 * 第一步：创建全局变量evenBus
 */
final evenBus = EventBus();
class UserInfo {
  String nickname;
  int level;
  UserInfo(this.nickname, this.level);
}

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

class HYHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Column(
        children: [
          HYButton(),
          HYText()
        ],
      ),
    );
  }
}

class HYText extends StatefulWidget {
  @override
  State<HYText> createState() => _HYTextState();
}

class _HYTextState extends State<HYText> {
  String _message = "Hello World";

  @override
  void initState() {
    super.initState();
    /**
     * 第三步：获取数据
     */
    evenBus.on<UserInfo>().listen((event) {
      setState(() {
        _message = "${event.nickname}-${event.level}";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(_message);
  }
}

class HYButton extends StatelessWidget {
  const HYButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("按钮"),
        onPressed: () {
          /**
           * 第二步：发布数据
           */
          final info = UserInfo("WYJ", 1);
          evenBus.fire(info);
        }
    );
  }
}
