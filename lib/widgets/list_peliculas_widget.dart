
import 'package:conecta/providers/peliculas_provider.dart';
import 'package:conecta/src/models/pelicula_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ListPeliculasWidget extends StatelessWidget {

  final peliculasProvider = new PeliculasProvider();
  final List<Pelicula> peliculas;  

  ListPeliculasWidget({@required this.peliculas});
  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 25.0),
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        itemCount: peliculas.length,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        itemBuilder: (BuildContext context, int index) => _cardNotice(index),
        staggeredTileBuilder: (int index) =>
          StaggeredTile.count(1, index.isEven ? 1.2 : 1.8), 
      ),
    );
  }

  

  Widget _cardNotice(int index){
        
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        child: Container(
          child: ( peliculas[index] != null  ) 
              ? FadeInImage(
                  placeholder: AssetImage('assets/Double400px.gif'), 
                  image: NetworkImage( peliculas[index].getImgPelicula() ),
                  fit: BoxFit.cover,                
                )
              : Image(image: AssetImage('assets/no_image.png')),              
        ),
      ),
    );
  }

}