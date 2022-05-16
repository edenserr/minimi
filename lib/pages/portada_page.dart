import 'dart:math';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class portada_page extends StatefulWidget {
  @override
  _portada_pageState createState() => _portada_pageState();
}


class _portada_pageState extends State<portada_page> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color =   const Color.fromRGBO(249, 245, 242, 1.0);

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

/*
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isUserSignedIn = false;

  void checkIfUserIsSignedIn() async {
    var userSignedIn = await _googleSignIn.isSignedIn();

    setState(() {
      isUserSignedIn = userSignedIn;

      if (isUserSignedIn== true){
      ///////  Navigator.pushNamed(context, 'home');
      }
      else {
        WidgetsBinding.instance
            ?.addPostFrameCallback((_) => _siguientePagina());

      }


    });
  }*/

  @override
  void initState() {
    super.initState();
    obtenerPagina();

    Future.delayed(const Duration(seconds: 1), () {

      _siguientePagina();
   ///////   checkIfUserIsSignedIn();


    });


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 245, 242, 1.0),

      body: Center(
        child: AnimatedContainer(
          child: _crearImagen(),
          width: _width,
          height: _height,
          decoration: BoxDecoration(borderRadius: _borderRadius, color: _color),
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,

        ),
      ),
    );
  }

  void _cambiarForma() {
    final random = Random();
    _width = 250;
    _height =250;
    _color = const Color.fromRGBO(249, 245, 242, 1.0);
    _borderRadius = BorderRadius.circular(20);

    setState(() {});


  }

  void _siguientePagina() {
    const duration = Duration(seconds: 2);
     Timer(duration,(){
      Navigator.pushNamed(context, 'intro');
    });
  }


  Future<void> obtenerPagina() async{
    const duration =  Duration(milliseconds: 1);
     Timer(duration,(){
      _cambiarForma();
    });

    return Future.delayed(duration);
  }
  Widget _crearImagen() {

    return Hero(
      tag: 'portada',
      child: Image(
        image: AssetImage('assets/logo.png'),
        width: _width,
        height: _height,

        //fit: BoxFit.c
      ),
    );
  }
}
