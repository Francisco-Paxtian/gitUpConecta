
import 'package:conecta/src/models/category_model.dart';
import 'package:conecta/src/models/news_models.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

final _URL_NEW = 'https://newsapi.org/v2';
final _API_KEY = 'a73134ae87084fe3b49538102a071130';

class NewsServices with ChangeNotifier {


  List<Category> categories = [
    Category( FontAwesomeIcons.building, 'business'),
    Category( FontAwesomeIcons.tv, 'entertainment'),
    Category( FontAwesomeIcons.addressCard, 'general'),
    Category( FontAwesomeIcons.headSideVirus, 'health'),
    Category( FontAwesomeIcons.vials, 'science'),
    Category( FontAwesomeIcons.volleyballBall, 'sports'),
    Category( FontAwesomeIcons.memory, 'technology'),
  ];

  List<Article> headLines = [];

  NewsServices(){

    this.getTopHeadLines();
  }

  getTopHeadLines() async{
    
    final url   = '$_URL_NEW/top-headlines?apiKey=$_API_KEY&country=us';
    final resp  = await http.get(url);

    final newReponse = newReponseFromJson(resp.body);

    this.headLines.addAll(newReponse.articles);
    notifyListeners();

  }
  
}