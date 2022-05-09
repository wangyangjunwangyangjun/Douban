import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HYHomePage(),
      theme: ThemeData(
        // Colors.red
        // Colors.red[100]
        // Color(0xffffffff)
        // Color.fromRGBO(111, 100, 100, 50)
          primaryColor: Colors.red,
          colorScheme: const ColorScheme.light(
            //顶部栏栏颜色
            primary: Colors.red,
            //顶部栏字体颜色
            onPrimary: Colors.white,
            onBackground: Colors.white,

          )
      ),
    );
  }
}

class HYHomePage extends StatelessWidget {
  const HYHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("基础的Widget"),
      ),
      body: TextFieldDemo(),
    );
  }
}
class TextFieldDemo extends StatefulWidget {
  const TextFieldDemo({Key? key}) : super(key: key);

  @override
  State<TextFieldDemo> createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  final usernameTextEditController = TextEditingController();
  final passwordTextEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: usernameTextEditController,
              decoration: InputDecoration(
                  labelText: "user name",
                  icon: Icon(Icons.people),
                  hintText: "请输入用户名",
                  border: InputBorder.none,
                  fillColor: Colors.red[100],
                  filled: true
              ),
              onChanged: (value) => {
                print(value)
              },
              onSubmitted: (value) => {
                print(value)
              },
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: passwordTextEditController,
              decoration: InputDecoration(
                  labelText: "password",
                  icon: Icon(Icons.lock),
                  border: OutlineInputBorder()
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 40,
              width: double.infinity,
              child: FlatButton(
                child: Text("登 录", style: TextStyle(fontSize: 20, color: Colors.white),),
                onPressed: () {
                  //获取用户名和密码
                  final String username = usernameTextEditController.text;
                  final String password = passwordTextEditController.text;
                  print("账号：${username}; 密码：${password}");
                },
                color: Colors.blue,
              ),
            ),
          )
        ],
      ),
    );
  }
}
