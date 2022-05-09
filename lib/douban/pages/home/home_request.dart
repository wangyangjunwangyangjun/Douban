import 'package:flutter_learn/service/config.dart';

import '../../../service/http_request.dart';
import '../../model/home_model.dart';

class HomeRequest {
  //返回一个future
  static Future<List<MovieItem>> requestMovieList() async {
    // final movieURL = "https://api.wmdb.tv/api/v1/top";
    final movieURL = "/api/v1/top";

    //发送网络请求获取结果
    final result = await HttpRequest.request(movieURL, method: "get", params: {
      "type": "Imdb",
      "limit": HomeConfig.movieCount,
      "skip": 0,
      "lang": "Cn"
    });

    List<MovieItem> movies = [];
    for(var movie in result) {
      movies.add(MovieItem.fromMap(movie));
    }
    return movies;
  }
}
