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

class HYHomePage extends StatelessWidget {
  final GlobalKey<_HYHomeContentState> homeKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: HYHomeContent(key: homeKey,),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.gesture),
        onPressed: () {
          print(homeKey.currentState?.widget.message);
          print(homeKey.currentState?.name);
        },
      ),
    );
  }
}
class HYHomeContent extends StatefulWidget {
  final String message = "aaaa";

  HYHomeContent({key}): super(key: key);

  @override
  State<HYHomeContent> createState() => _HYHomeContentState();
}

class _HYHomeContentState extends State<HYHomeContent> {
  final String name = "bbbb";

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}