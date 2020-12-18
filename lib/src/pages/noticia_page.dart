
import 'package:conecta/providers/articles_provider.dart';
import 'package:conecta/services/new_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoticiaPage extends StatelessWidget {

  
  final articleProvider = new ArticlesProvider();
  
  @override
  Widget build(BuildContext context) {

    final newServices = Provider.of<NewsServices>(context);

    return SafeArea(
      child: Scaffold(
        body: Expanded(child: _viewPage(context)),
      ),
    );
  }

  Widget _viewPage(BuildContext context){
    

    return Column(
      children: [

        ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: articleProvider.categories.length,
          itemBuilder: (BuildContext context, int index){
            return Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Icon(articleProvider.categories[index].icon),
                  SizedBox(height: 5),
                  Text(articleProvider.categories[index].name)
                ],
              ),
            );
          }
          )

      ],
    );

  }

  //Widget _listPeliculas(){
  //  
  //  
  //  return FutureBuilder(
  //    future: peliculasProvider.getEnCines(),      
  //    builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
  //      
  //      if (snapshot.hasData) {
  //        return ListPeliculasWidget(peliculas: snapshot.data);
  //      }else{
  //        return Center(
  //          child: CircularProgressIndicator()
  //        );
  //      }
//
  //      
  //    },
  //  );
//
  //}
  
}