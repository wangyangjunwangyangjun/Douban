import 'package:flutter/material.dart';

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
      body: HYGuestureDemo03(),
    );
  }
}

class HYGuestureDemo03 extends StatelessWidget {
  const HYGuestureDemo03({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          GestureDetector(
            onTapDown: (detail) {
              print("outer Click");
            },
            child: Container(width: 200, height: 200, color: Colors.red)
          ),
          // IgnorePointer()  忽略手势
          GestureDetector(
            onTapDown: (detail) {
              print("inner Click");
            },
            child: Container(width: 100, height: 100, color: Colors.blue)
          ),
        ],
      ),
    );
  }
}

class HYGestureDemo02 extends StatelessWidget {
  const HYGestureDemo02({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTapDown: (detail) {
          print("outer Click");
        },
      child: Container(
        width: 200,
        height: 200,
        color: Colors.red,
        //这里Container嵌套Container如果不加上Aligment属性，
        // 里面的Container会扩展至外部包裹的Container大小
        alignment: Alignment.center,
        child: GestureDetector(
          onTapDown: (detail) {
            print("inner Click");
          },
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
          ),
        ),
      ),
    ));
  }
}

class HYGestureDemo extends StatelessWidget {
  const HYGestureDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          print("手势点击");
        },
        onTapDown: (detail) {
          print("手势下落");
        },
        onTapUp: (detail) {
          print("手势抬起");
        },
        onTapCancel: () {
          print("手势取消");
        },
        child: Container(
          width: 200,
          height: 200,
          color: Colors.orange,
        ),
      ),
    );
  }
}

class HYListenerDemo extends StatefulWidget {
  @override
  State<HYListenerDemo> createState() => _HYHYListenerDemoState();
}

class _HYHYListenerDemoState extends State<HYListenerDemo> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Listener(
        onPointerDown: (event) {
          print("指针按下：$event");
          print(event.position); //相对屏幕（左上角为0,0；往下为y，往右为x）
          print(event.localPosition); //相对当前组件的位置
        },
        onPointerMove: (event) {
          print("指针移动：$event");
        },
        onPointerUp: (event) {
          print("指针抬起：$event");
        },
        child: Container(
          width: 200,
          height: 200,
          color: Colors.red,
        ),
      ),
    );
  }
}
