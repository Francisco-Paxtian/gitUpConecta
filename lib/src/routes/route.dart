
import 'package:conecta/src/pages/article_datelle_page.dart';
import 'package:conecta/src/pages/convocatoria_page.dart';
import 'package:conecta/src/pages/home_page_conecta.dart';
import 'package:conecta/src/pages/noticia_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getAplicationRoutes(){

  return <String, WidgetBuilder>{
    //'/'                 : (BuildContext context ) => HomePage(),
    '/'                   : (BuildContext context ) => HomePageConecta(),    
    'noti'                : (BuildContext context ) => NoticiaPage(),
    'convo'               : (BuildContext context ) => CovocatoriaPage(),  
    'detalle'             : (BuildContext context ) => ArticleDetallePage(),    
  };

}

