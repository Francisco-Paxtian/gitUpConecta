import 'dart:ui';
import 'package:conecta/providers/articles_provider.dart';
import 'package:conecta/src/models/article_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ListArticlesWidget extends StatelessWidget {

  final articleProvider = new ArticlesProvider();
  final List<Article> articles;  
  

  ListArticlesWidget({@required this.articles});
  

  @override
  Widget build(BuildContext context) {
    return Container(      
        padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 25.0),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          itemCount: articles.length,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          itemBuilder: (BuildContext context, int index) => _cardNotice(index, context),
          staggeredTileBuilder: (int index) =>
            StaggeredTile.count(1, index.isEven ? 1.2 : 1.8), 
        ),
      );    
  }

  

  Widget _cardNotice(int index, BuildContext context){
    
        
    return GestureDetector(
        onTap: (){          
          Navigator.pushNamed(context, 'detalle',arguments: articles[index]);
        },
        child: Container(
        decoration: BoxDecoration(     
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ], 
          color: Color.fromRGBO(243, 242, 240, 1),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        //padding: EdgeInsets.only(bottom: 25.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          child: 
          Stack(
                children: [     
                              
                  Container(
                    height: MediaQuery.of(context).size.height * .8,
                    child: ( articles[index] != null  ) 
                      ? FadeInImage(
                          placeholder: AssetImage('assets/Double400px.gif'), 
                          image: NetworkImage( articles[index].getImgArticle() ),
                          fit: BoxFit.cover,                
                        )
                      : Image(image: AssetImage('assets/no_image.png')),                    
                  ),
                  BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .6,
                            color: Colors.black54.withOpacity(0.1)
                            ),
                  ),
                  Positioned(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 25),
                          child: Align
                          (
                            alignment: Alignment.center,
                            child: _txtStyle(articles[index].getTitleArticle()
                          ))
                        )
                      ],
                    ),
                  )
                ],
          ),          
        ),
      ),
    );
  }

  Widget _txtStyle(String info){

    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Text(info, style: TextStyle(    
        color: Colors.white,
        fontFamily: 'TitilliumWeb',
        fontSize: 15.0
      ),),
    );  
    
  }
  
}