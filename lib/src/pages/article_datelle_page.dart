
import 'package:conecta/src/models/article_model.dart';
import 'package:flutter/material.dart';

class ArticleDetallePage extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {

    final Article article = ModalRoute.of(context).settings.arguments;  

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _appbarArticle(article),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 25.0),
                Row(
                  children: [
                    _txtStyle(article.getAutorArticle(), 15,Colors.black),
                    _txtStyle(article.getPublishedAtArticle(), 15,Colors.black),
                  ],
                ),
                SizedBox(height: 15.0),
                _txtStyle(article.getDescriptionArticle(), 25,Colors.black),
                SizedBox(height: 15.0),
                _txtStyle(article.getContentArticle(), 20,Colors.black),
              ],
            )
          ),
        ],
      ),
    );
  }

  Widget _appbarArticle(Article article){
    return SliverAppBar(
      elevation: 2.0, 
      backgroundColor: Color.fromRGBO(164,54,54,1.00),
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: _txtStyle(article.getTitleArticle(), 12.0, Colors.white),
        background: FadeInImage(
          placeholder: AssetImage('assets/cargando.gif'), 
          image: NetworkImage( article.getImgArticle() ),
          fadeInDuration: Duration(microseconds: 150),
          fit: BoxFit.cover,                
        ),
      ),
    );
  }

  Widget _txtStyle(String info, double size, Color color){

    return Container(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: Text(info, style: TextStyle(    
        color: color,
        fontFamily: 'TitilliumWeb',
        fontSize: size,
      ),),
    );  
    
  }
}