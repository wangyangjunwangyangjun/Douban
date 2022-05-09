import 'package:flutter/material.dart';
import 'package:flutter_learn/douban/model/home_model.dart';
import 'home_request.dart';
import 'home_movie_item.dart';

class HYHomeContent extends StatefulWidget {
  const HYHomeContent({Key? key}) : super(key: key);

  @override
  State<HYHomeContent> createState() => _HYHomeContentState();
}

class _HYHomeContentState extends State<HYHomeContent> {
  final List<MovieItem> movies = [];

  @override
  void initState() {
    super.initState();

    //发送网络请求
    HomeRequest.requestMovieList().then((value) {
      setState(() {
        movies.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return HYHomeMovieItem(movies[index]);
      },
      itemCount: movies.length,
    );
  }
}
