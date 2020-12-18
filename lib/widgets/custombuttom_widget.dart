
import 'package:conecta/providers/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomButtonWidget extends StatelessWidget {
  
  final _colorTerra = Color.fromRGBO(164,54,54,1.00);

  @override
  Widget build(BuildContext context) {
    
    final uiProvider = Provider.of<UiProvider>(context);
    final currenIndex = uiProvider.selectMenuOpt;

    return Theme(

      data:   Theme.of(context).copyWith(
        canvasColor: Colors.white,
        primaryColor: Colors.black26,
        textTheme: Theme.of(context).textTheme
          .copyWith(caption: TextStyle(color: _colorTerra))
      ), 
      child:  BottomNavigationBar(
        onTap: (int i) => uiProvider.selectMenuOpt = i,
        currentIndex: currenIndex,
        elevation: 1,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Container()),
          BottomNavigationBarItem(icon: Icon(Icons.public), title: Container()),
        ]
      )
    );
  }
}