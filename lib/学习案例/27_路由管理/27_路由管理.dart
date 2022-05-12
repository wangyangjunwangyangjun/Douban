import 'package:flutter/material.dart';
import './about.dart';
import './detail.dart';
import 'error.dart';
import 'router/router.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          splashColor: Colors.transparent,
        ),
        routes: HYRouter.routes,
        initialRoute: HYRouter.initialRoute,
        onGenerateRoute: HYRouter.generateRoute,
        onUnknownRoute: HYRouter.unknownRoute);
  }
}

class HYHomePage extends StatefulWidget {
  static const String routerName = "/";

  @override
  State<HYHomePage> createState() => _HYHomePageState();
}

class _HYHomePageState extends State<HYHomePage> {
  String _message = "message";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
                child: Text("跳转至详情"), onPressed: () => _jumpToDetail(context)),
            RaisedButton(
                child: Text("跳转至关于页面"), onPressed: () => _jumpToAbout(context)),
            RaisedButton(
                child: Text("跳转至详情页面"),
                onPressed: () => _jumpToDetail2(context)),
            RaisedButton(
                child: Text("跳转至设置页面"),
                onPressed: () => _jumpToSettings(context)),
            Text(_message)
          ],
        ),
      ),
    );
  }

  void _jumpToDetail(BuildContext context) {
    //普通的跳转方式
    Future result =
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
      return HYDetailScreen("home is message");
    }));
    result.then((value) {
      setState(() {
        _message = value;
      });
      print(value);
    });
  }

  void _jumpToAbout(BuildContext context) {
    Navigator.of(context)
        .pushNamed(HYAboutPage.routerName, arguments: "a home message");
  }

  void _jumpToDetail2(BuildContext context) {
    Navigator.of(context).pushNamed(HYDetailScreen.routername,
        arguments: "a home detail2 message");
  }

  void _jumpToSettings(BuildContext context) {
    Navigator.of(context).pushNamed("/settings");
  }
}
