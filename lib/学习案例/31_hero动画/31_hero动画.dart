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
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 16 / 9),
          children: List.generate(20, (index) {
            final imageURL = "https://picsum.photos/200/300?random=$index";
            return GestureDetector(
              child: Hero(
                tag: imageURL,
                child: Image.network(imageURL, fit: BoxFit.cover),
              ),
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(pageBuilder: (ctx, animation1, animation2) {
                    return FadeTransition(
                      opacity: animation1,
                      child: HYModalPage(imageURL),
                    );
                  }),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
