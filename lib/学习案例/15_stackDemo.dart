import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HYHomeContent());
  }
}

class HYHomeContent extends StatelessWidget {
  const HYHomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StackDemo02(),
      appBar: AppBar(
        title: Text("布局"),
      ),
    );
  }
}

class StackDemo01 extends StatefulWidget {
  const StackDemo01({Key? key}) : super(key: key);

  @override
  State<StackDemo01> createState() => _StackDemo01State();
}

class StackDemo02 extends StatefulWidget {
  const StackDemo02({Key? key}) : super(key: key);

  @override
  State<StackDemo02> createState() => _StackDemo02State();
}

class _StackDemo02State extends State<StackDemo02> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/test.jpg",
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "photo",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  // GestureDetector(child: Icon(Icons.favorite, color: Colors.white,)),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          this._isFavorite = !this._isFavorite;
                        });
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: this._isFavorite == true ? Colors.red : Colors.white,
                      ))
                ],
              ),
            ),
            color: Color.fromARGB(150, 0, 0, 0),
          ),
        )
      ],
    );
  }
}

class _StackDemo01State extends State<StackDemo01> {
  @override
  Widget build(BuildContext context) {
    /**
     * Stack默认的大小是包裹内容的
     * - alignment从什么位置开始排布所有的子Widget
     * - fit：expand将子元素拉伸到尽可能大
     * - overflow:超出部分如何处理
     */
    return Stack(
      alignment: Alignment.center,
      // fit: StackFit.expand,
      // clipBehavior: Clip.none,
      children: [
        Image.asset(
          "assets/images/test.jpg",
          width: 300,
          fit: BoxFit.cover,
        ),
        Positioned(
          left: 0,
          bottom: -50,
          child: Container(
            width: 150,
            height: 150,
            color: Colors.red,
          ),
        ),
        Positioned(
          child: Text(
            "photo",
            style: TextStyle(fontSize: 20, color: Colors.green),
          ),
          //left：0表示距离左侧为0
          left: 0,
        )
      ],
    );
  }
}
