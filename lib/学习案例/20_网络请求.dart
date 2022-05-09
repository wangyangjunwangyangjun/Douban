import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/service/http_request.dart';

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
        title: Text("网络请求"),
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
  void initState() {
    super.initState();

    //发送网络请求
    //1、创建dio对象
    //2、发送网络请求
    final dio = Dio();
    dio.get("https://httpbin.org/get").then((value) {
      print(value);
    });
    dio.post("https://httpbin.org/post").then((value) {
      print(value);
    });
    HttpRequest.request("https://httpbin.org/get", params: {"name": "WYJ"}, inter: InterceptorsWrapper(
        onRequest: null
    )).then((value) {
      print(value);
    }).catchError((err){
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}