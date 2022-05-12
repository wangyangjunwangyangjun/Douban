import 'package:flutter/material.dart';
import 'viewmodel/initialize.dart';
import 'package:provider/provider.dart';
import 'viewmodel/01_inheritedWidget.dart';
import 'viewmodel/02_UserViewModel.dart';

/**
 * 1。创建自己需要共享的数据
 * 2.在应用程序的顶层加上ChangeNotifierProvider
 * 3.在其他位置使用共享的数据
 *  - provider.of:数据发生改变时，所在的Widget的build方法会重新执行
 *  - Consumer：只有consumer的build方法会重新构建
 *  - selector: 1.selector方法对原有数据进行转换；2、shouldRebuild是否要重新构建
 *
 *  多个共享数据使用MultiProvider
 *
 */

main() {
  runApp(
      MultiProvider(
        providers: provider,
        child: MyApp(),
      )
  );
}

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
        body: Column(
          children: [HYShowData01(), HYShowData02(), HYShowData03()],
        ),
        floatingActionButton:
        Selector<HYCounterViewModel, HYCounterViewModel>(
            selector: (ctx, counterVM) {
              return counterVM;
            },
            shouldRebuild: (prev, next) {
              return false;
            },
            builder: (ctx, builder, child) {
              return FloatingActionButton(
                child: child,
                onPressed: () {
                  builder.counter++;
                },
              );
            },
            child: Icon(Icons.add),
        )
      // Consumer<HYCounterViewModel>(
      //     builder: (ctx, builder, child) {
      //       return FloatingActionButton(
      //         child: child,
      //         onPressed: () {
      //           builder.counter++;
      //         },
      //       );
      //     },
      //   child: Icon(Icons.add),,
      // )
    );
  }
}

class HYShowData01 extends StatelessWidget {
  const HYShowData01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //拿到对象
    int counter = Provider
        .of<HYCounterViewModel>(context)
        .counter;

    return Card(
      color: Colors.blue,
      child: Text("当前计数：$counter"),
    );
  }
}

class HYShowData02 extends StatelessWidget {
  const HYShowData02({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int counter = Provider
        .of<HYCounterViewModel>(context)
        .counter;

    return Consumer<HYCounterViewModel>(
        builder: (ctx, builder, child) {
          return Card(
            color: Colors.red,
            child: Text("当前计数：${builder.counter}"),
          );
        }
    );
  }
}

class HYShowData03 extends StatelessWidget {
  const HYShowData03({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Consumer<HYUserViewModel>(builder: (ctx, builder, child) {
    //   return Text("nickname:${builder.user.nickname}");
    // });
    return Consumer2<HYUserViewModel, HYCounterViewModel>(builder: (ctx, userVM, counterVM, child) {
      return Text("nickname:${userVM.user.nickname}, counter:${counterVM.counter}");
    });
  }
}