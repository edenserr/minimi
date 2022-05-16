
import 'package:flutter/material.dart';

import '../pages/intro.dart';
import '../pages/portada_page.dart';


Map<String, WidgetBuilder> getApplicationRoutes(){

  return <String, WidgetBuilder>{
    'portada': (BuildContext context) => portada_page(),
   'intro': (BuildContext context) => intro_page(),
   /* 'menu': (BuildContext context) => login_page()

    'crear_cuenta_usuario': (BuildContext context) => crear_cuenta_usuario_page(),
    'crear_cuenta_menu': (BuildContext context) => crear_cuenta_menu_page(),
    'crear_cuenta_negocio': (BuildContext context) => crear_cuenta_negocio_page(),
    'panel': (BuildContext context) => panel_page(),
    'home': (BuildContext context) => HomePage(),
    'category_detail': (BuildContext context) => food_category_detail_page(),*/

  };


}

