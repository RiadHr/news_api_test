import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import '../models/article.dart';
import '../utils/global_variables.dart';


class ApiController{
  final Uri url;
  ApiController({required this.url});

  Future<List<Article>> getData() async {
    var response = await http.get(url);

    if (response.statusCode == 200){
      Map<String,dynamic> body = jsonDecode(response.body);
      // logger.i("body = $body");
      List<dynamic> json = body['articles'];
      // logger.w("json = ${json[0]}");
      List<Article> articles = json.map((dynamic item) => Article.fromJson(item)).toList();
      // logger.i("articles: $articles");
      return articles;
    }else{
      throw Exception("failed to load article in the fetcharticles method");
    }
  }



}