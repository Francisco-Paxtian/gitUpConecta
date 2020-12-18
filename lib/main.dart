import 'package:conecta/providers/ui_provider.dart';
import 'package:conecta/src/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
        //ChangeNotifierProvider(create: (_) => new NewsServices()),
        ChangeNotifierProvider(create: (_) => new UiProvider()),
      ],

      child: MaterialApp(
        title: 'ComponentsApp',
        debugShowCheckedModeBanner: false,
        //home: HomePage()

        initialRoute: '/',                        
        routes: getAplicationRoutes(),      
        theme: ThemeData(
          primaryColor: Color.fromRGBO(164, 54, 54, 1)
        ),
      ),

    );
  }
}