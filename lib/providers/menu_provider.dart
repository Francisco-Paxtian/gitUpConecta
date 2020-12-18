import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;


class _MenuProvider{

  List<dynamic> options =  [];


  _MenuProvider(){
    //cargarData();
  }
  
  Future<List<dynamic>> cargarData() async {
    
    final rs = await rootBundle.loadString('data/menu_opts.json' );
   
    Map dataMap = json.decode(rs);
    //print(dataMap['rutas']);
    options = dataMap['rutas'];

    return options;

  }

}


final menuProvider = new _MenuProvider();
