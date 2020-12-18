import 'dart:convert';

import 'package:conecta/src/models/article_model.dart';
import 'package:conecta/src/models/category_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class ArticlesProvider{

  List<Category> categories = [
    Category( FontAwesomeIcons.building, 'business'),
    Category( FontAwesomeIcons.tv, 'entertainment'),
    Category( FontAwesomeIcons.addressCard, 'general'),
    Category( FontAwesomeIcons.headSideVirus, 'health'),
    Category( FontAwesomeIcons.vials, 'science'),
    Category( FontAwesomeIcons.volleyballBall, 'sports'),
    Category( FontAwesomeIcons.memory, 'technology'),
  ];
  
  Future<List<Article>> getEnNoticias() async {


    final url = 'http://newsapi.org/v2/top-headlines?country=us&apiKey=a73134ae87084fe3b49538102a071130';
    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);
    
    final articles = new Articles.fromJsonList(decodeData['articles']);      

    return articles.items;

  }

}