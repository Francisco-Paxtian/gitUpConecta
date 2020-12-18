import 'package:conecta/providers/articles_provider.dart';
import 'package:conecta/widgets/list_articles_widget.dart';
import 'package:flutter/material.dart';

class CovocatoriaPage extends StatefulWidget {
  
  @override
  _CovocatoriaPageState createState() => _CovocatoriaPageState();
}

class _CovocatoriaPageState extends State<CovocatoriaPage> with AutomaticKeepAliveClientMixin{
  final articleProvider = new ArticlesProvider();

  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: Scaffold(
        body: _listArticles(),        
      ),
    );
  }

  Widget _listArticles(){
    
    return FutureBuilder(
      future: articleProvider.getEnNoticias(),      
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        
        if (snapshot.hasData) {
          return ListArticlesWidget(articles: snapshot.data);
        }else{
          return Center(
            child: CircularProgressIndicator()
          );
        }

        
      },
    );

  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}