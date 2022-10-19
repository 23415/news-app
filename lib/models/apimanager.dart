import 'package:dio/dio.dart';
import 'package:news_app/models/newsresponse.dart';

class ApiManager {
  final Dio dio = Dio();
  final String apikey = "41803a177a56414e87e6c652018ebc50";

  Future<List<Article>?> fetchNews() async {
    try {
      Response response = await dio.get(
          "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=$apikey");
      NewsResponse newsResponse = NewsResponse.fromJson(response.data);
      return newsResponse.articles;
    } on DioError catch (e) {
      print(e);
    }
  }
}
