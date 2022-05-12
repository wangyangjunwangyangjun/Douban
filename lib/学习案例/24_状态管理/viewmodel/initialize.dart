import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../model/user_model.dart';
import '01_inheritedWidget.dart';
import '02_UserViewModel.dart';

List<SingleChildWidget> provider = [
  ChangeNotifierProvider(create: (ctx) => HYCounterViewModel(),),
  ChangeNotifierProvider(
    create: (ctx) => HYUserViewModel(UserInfo("WYJ", 1, "1111")),)
];