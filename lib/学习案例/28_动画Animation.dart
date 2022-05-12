import 'package:flutter/material.dart';

main() => runApp(MyApp());
/**
 * 1、Animation:抽象类
 *  - 监听动画值的改变
 *  - 监听动画状态的改变
 *  - value
 *  - status
 *
 *  2、AnimationController继承Animation
 *  - vsync:同步信号，屏幕刷新率(要持续收到同步信号才会继续绘制）
 *  - vsync:this -》with SingleTickerProviderStateMixin
 *  - forward()：向前执行动画
 *  - reverse()：反转执行动画
 *
 *  3、CurvedAnimation：
 *  - 作用：设置动画执行的速率（速度曲线）
 *
 *  4、Tween：设置动画执行的value范围
 *  - begin：开始的大小
 *  - end：结束时大小
 *
 */
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

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 1),
        lowerBound: 0,
        upperBound: 1);

    // 2、设置Curve的值
    animation = CurvedAnimation(parent: _controller, curve: Curves.elasticInOut);

    //3、Tween
    valueAnimation = Tween(begin: 50.0, end: 150.0).animate(animation);

    // valueAnimation.addListener(() {
    //   setState(() {
    //
    //   });
    // });
    _controller.addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        _controller.reverse();
      } else  if(status == AnimationStatus.dismissed){
        _controller.forward();
      }
    });
    
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("执行_HYHomePageState的build方法");
    return Scaffold(
      appBar: AppBar(
        title: Text("动画"),
      ),
      body: Center(

        //AnimatedBuilder
        child: AnimatedBuilder(
          builder: (BuildContext context, Widget? child) {
            return Icon(Icons.favorite, color: Colors.red, size: valueAnimation.value);
          },
          animation: valueAnimation,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.abc, color: Colors.red,),
        onPressed: () {
          if(_controller.isAnimating) {
            _controller.stop();
          }else {
            _controller.forward();
          }
        },
      ),
    );
  }
}

/**
 * AnimatedWidget
 * 1、将需要执行动画的Widget放到一个AnimatedWidget中的build方法进行返回
 * 2、缺点：A、每次都需要创建一个类；B、如果够贱的Widget有子类，那么子类依然会重复构建build
 *
 * AnimatedBuilder
 * 最优选择
 */
// class HYAnimatedIcon extends AnimatedWidget {
//   final Animation valueAnimation;
//   HYAnimatedIcon(this.valueAnimation) : super(listenable: valueAnimation);
//   @override
//   Widget build(BuildContext context) {
//     return Icon(Icons.favorite, color: Colors.red, size: valueAnimation.value);
//   }
// }