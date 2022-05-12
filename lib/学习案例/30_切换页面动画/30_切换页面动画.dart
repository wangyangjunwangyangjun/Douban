import 'package:flutter/material.dart';
import 'modal_page.dart';

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
        title: Text(""),
      ),
      body: Center(
        child: Text("Hello World"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              transitionDuration: Duration(seconds: 3),
                pageBuilder: (ctx, animation1, animation2) {
                  return FadeTransition(
                      opacity: animation1,
                      child: HYModalPage()
                  );
                }
            )
            // MaterialPageRoute(builder: (ctx) {
            //   return HYModalPage();
            // }),
          );
        },
      ),
    );
  }
}
