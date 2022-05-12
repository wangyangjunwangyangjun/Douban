import 'dart:math';

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

class HYHomePage extends StatefulWidget {
  @override
  State<HYHomePage> createState() => _HYHomePageState();
}

class _HYHomePageState extends State<HYHomePage>
    with SingleTickerProviderStateMixin {
  //1、创建AnimationController
  late AnimationController _controller;
  late CurvedAnimation animation;
  late Animation valueAnimation;

  //交织动画：创建多个Tween
  late Animation _sizeAnimation;
  late Animation _colorAnimation;
  late Animation _opacityAnimation;
  late Animation _radiansAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 1),
        lowerBound: 0,
        upperBound: 1);

    // 2、设置Curve的值
    animation =
        CurvedAnimation(parent: _controller, curve: Curves.elasticInOut);

    //3、Tween
    valueAnimation = Tween(begin: 50.0, end: 150.0).animate(_controller);

    _colorAnimation =
        ColorTween(begin: Colors.blue, end: Colors.green).animate(_controller);
    _sizeAnimation = Tween(begin: 50.0, end: 150.0).animate(_controller);
    _opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _radiansAnimation = Tween(begin: 0.0, end: 2.0 * pi).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    // //使用AnimatedBuilder就不需要setState
    // _controller.addListener(() {
    //   setState(() {});
    // });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("执行_HYHomePageState的build方法");
    /**
     * 交织动画：
     * 1、大小变化动画
     * 2、颜色变化动画
     * 3、透明度变化动画
     */
    return Scaffold(
      appBar: AppBar(
        title: Text("动画"),
      ),
      body: Center(
          //AnimatedBuilder
        child: AnimatedBuilder(
          builder: (BuildContext context, Widget? child) {
            return Opacity(
              opacity: _opacityAnimation.value,
              child: Transform(
                transform: Matrix4.rotationZ(_radiansAnimation.value),
                alignment: Alignment.center, //对齐方式：以Container中心点居中对齐
                child: Container(
                  height: _sizeAnimation.value,
                  width: _sizeAnimation.value,
                  color: _colorAnimation.value,
                ),
              ),
            );
          },
          animation: _controller,
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.abc,
          color: Colors.red,
        ),
        onPressed: () {
          if (_controller.isAnimating) {
            _controller.stop();
          } else {
            _controller.forward();
          }
        },
      ),
    );
  }
}
