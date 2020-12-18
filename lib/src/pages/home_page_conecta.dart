
import 'package:conecta/providers/ui_provider.dart';
import 'package:conecta/src/pages/convocatoria_page.dart';
import 'package:conecta/src/pages/noticia_page.dart';
import 'package:conecta/widgets/custombuttom_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageConecta extends StatelessWidget {
  
  final _colorTerra = Color.fromRGBO(164,54,54,1.00);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),  
      body: _HomePageBody(),    
      bottomNavigationBar: CustomButtonWidget(),      
    );    
  }

  Widget _appBar() {
    return AppBar(        
        title: Row(          
          children: [
            Text(
              'CONECTA',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'TitilliumWeb'
              ),
            ),
            Text(
              'SEMSyS',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'FjallaOne',
                fontSize: 22.0
              ),
            ),            
          ],  
        ),
        backgroundColor: _colorTerra,
      );
  }
  
}

class _HomePageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final _uiProvider = Provider.of<UiProvider>(context);

    return PageView(
      controller: _uiProvider.pageController,
      //physics: BouncingScrollPhysics(),
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        
        CovocatoriaPage(),        
        
        NoticiaPage(),

      ],
    );
  }
}