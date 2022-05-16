import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';



class intro_page extends StatefulWidget {
  @override
  _intro_pageState createState() => _intro_pageState();
}


class _intro_pageState extends State<intro_page> {
  late final Function onPress;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(249, 245, 242, 1.0),

        body: Stack(
            children: [

              const Positioned.fill(
                  child: Image(
                    image: AssetImage('assets/img.png'),
                    fit: BoxFit.cover,

                  )
              ),

              Positioned.fill(
    child: Container(
    padding: EdgeInsets.all(10.0),
    decoration: const BoxDecoration(

             gradient: LinearGradient(
             colors: [
             Colors.transparent,
             Colors.transparent,
             Colors.transparent,
             Colors.transparent
             ],
             begin: Alignment.topCenter,
             end: Alignment.bottomCenter,
             stops: [0, 0, -9, 1],
             ),
        )
               , child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [


                   const   Padding(
                     padding:   EdgeInsets.fromLTRB(10,0, 10, 50),
                     child:  Align(
                         alignment: Alignment.bottomLeft,
                         child: Text('Omitir',style:  TextStyle(color:  Color.fromRGBO(221, 151, 136, 1.0), fontSize: 20,
                           fontFamily: 'crystasea',shadows:[
                           Shadow(
                           blurRadius: 20.0,
                           color: Colors.black26,
                           offset: Offset(5.0, 5.0),
                         ),
                             ])
                     )),
                   ),
                   Padding(
                      padding:  const EdgeInsets.fromLTRB(0,0, 10, 40),
                      child: Align(
                        alignment: Alignment.bottomRight,
                          child:  ElevatedButton(onPressed: () {


                          }, child: const Text('Continuar'),

                              style: ElevatedButton.styleFrom(

                                  primary: const Color.fromRGBO(221, 151, 136, 1.0),
                                  onPrimary: Colors.white,
                                  //      backgroundColor: Color.fromRGBO(128, 2, 53, 1.0),
                                  onSurface: Colors.green,
                                  shadowColor: Colors.grey,
                                  elevation: 10,
                                  animationDuration:const Duration(milliseconds: 1000),

                                  minimumSize:const Size(150, 50),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(12))),
                                  textStyle: const TextStyle(

                                    color: Colors.green,
                                    fontSize: 20,
                                    fontStyle: FontStyle.normal, fontFamily: 'crystasea',
                                  ))
                          ),

                      ),
                    ),

                 ],
               ),
        )
              )
,

               Padding(
                  padding:   EdgeInsets.fromLTRB(10,400, 10, 50),
                  child:  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
    alignment:Alignment.center ,
    //place this container to right side
    constraints: BoxConstraints(maxWidth: 450, maxHeight: 100),

    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(8.0),
    color: Colors.white.withOpacity(0.8)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Descubre lo nuevo en el catálogo',
                              style:  TextStyle(color:  Color.fromRGBO(221, 151, 136, 1.0), fontSize:30,
                                  fontFamily: 'crystasea',shadows:[
                                    Shadow(
                                      blurRadius: 10.0,
                                      color: Colors.black26,
                                      offset: Offset(2.0, 2.0),
                                    ),
                                  ])
                          ),
                        ),
                      )),
                ),


            ]

        ));
  }
}