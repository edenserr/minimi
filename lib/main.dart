import 'package:flutter/material.dart';
import 'package:minimi/pages/portada_page.dart';
import 'package:minimi/routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main(){
  runApp( new MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minimi Panamá',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        //GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // English
        const Locale('es','ES'), // Hebrew
        // ... other locales the app supports
      ],

      //  home: Homepage(),
      initialRoute: 'portada',
      routes: getApplicationRoutes(),
      onGenerateRoute: (RouteSettings settings){
        //print('Ruta llamada: ${ settings.name} ');
        return MaterialPageRoute(
          builder: (BuildContext context) => portada_page()
           // builder: (BuildContext context) => login_intro()
          //  builder: (BuildContext context) => order_detail_page()
        );

      },
    );
  }
}

