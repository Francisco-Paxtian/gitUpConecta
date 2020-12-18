
import 'package:conecta/providers/menu_provider.dart';
import 'package:conecta/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

class HomePage  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 'Componets' ),
      ),
      body: _list(),
    );
  }

  Widget _list() {

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        
        print(snapshot.data);
        return ListView(
          children: _listItems(snapshot.data, context),
        );

      },
    );
    //print(menuProvider.options);
    /*menuProvider.cargarData().then(( options ){
        print('_list');
        print( options );
    });*/            

  }

  List<Widget> _listItems(List<dynamic> data, BuildContext context) {

    final List<Widget> options = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),        
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.amber),
        onTap: (){
          
          /*final route = MaterialPageRoute(builder: (context){
            return AlertPage();
          });
          Navigator.push(context, route);*/
          Navigator.pushNamed(context, opt['ruta']);

        },
      );
      options..add(widgetTemp)
             ..add(Divider());
     });
    
    return options;
    
  }

}