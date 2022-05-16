import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';


class login_intro extends StatefulWidget {
  @override
  login_pageState createState() => login_pageState();
}

class login_pageState extends State<login_intro> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String background_color = "255, 189, 65,1.0";


  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isUserSignedIn = false;

  @override
  void initState() {
    super.initState();


  }



  @override
  Widget build(BuildContext context) {

    final path = new Path();

    return Scaffold(
        resizeToAvoidBottomInset : false,
        backgroundColor: Color.fromRGBO(255, 189, 65, 1.0),

        body: CustomPaint(
            painter: PlatosClipper(),
            child: Center(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[

                  Hero(
                    tag: 'portada',
                    child: Image(
                      image: AssetImage('assets/iconportada.png'),
                      //width: _width,
                      height: 250,

                      //fit: BoxFit.c
                    ),
                  )
                 ,

                  Container(
                      height: 60,
                      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(color: Color.fromRGBO(255, 189, 65, 1.0))),
                        onPressed: () {
                         // Navigator.pushNamed(context, 'login');
                          onGoogleSignIn(context);
                        //  Navigator.pop(context, false);
                        },
                        //color:  Colors.redAccent,
                        color:  Color.fromRGBO(255, 189, 65, 1.0),
                        textColor: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            FaIcon(FontAwesomeIcons.google),

                            SizedBox(width: 10),
                            Text(
                                'Ingresar con Google',
                                style: TextStyle(color: Colors.white,fontSize: 17))
                          ],
                        ),
                      )),
                  Center(
                    child: Container(
                        margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child:
                        Row(
                            children: <Widget>[
                              Expanded(
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Divider(
                                      color: Colors.grey,),
                                  ),
                              ),

                              Text("o por correo",
                                  style: TextStyle(fontSize: 17,color: Colors.grey)),

                              Expanded(
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Divider(
                                      color: Colors.grey,),
                                  )
                              ),
                            ]
                        )
                    ),
                  ),
                 Container(
 child: Row(
   mainAxisAlignment: MainAxisAlignment.spaceBetween,
   children: <Widget>[
     Container(
         height: 60,
         width: 180,
         margin: EdgeInsets.fromLTRB(20, 30, 0, 0),
        // margin: EdgeInsets.fromLTRB(40, 250, 40, 0),
         padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
         child: MaterialButton(
           shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(30),
               side: BorderSide(color: Colors.black,width: 1)),
           onPressed: () {
             Navigator.pushNamed(context, 'crear_cuenta_menu');
           },
           color: Colors.white,
           textColor: Colors.black,
           elevation: 0.0,
           child: Text("Registro",
               style: TextStyle(fontSize: 17)),
         )),

     Container(
         height: 60,
         width: 180,
         margin: EdgeInsets.fromLTRB(0, 30, 20, 0),
         padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
         child: RaisedButton(
           shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(30),
               side: BorderSide(color: Color.fromRGBO(255, 189, 65, 1.0))),
           onPressed: () {
             Navigator.pushNamed(context, 'login');
           },
           color: Color.fromRGBO(255, 189, 65, 1.0),
           textColor: Colors.white,
           child: Text("Ingresar",
               style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
         )),

   ],
 )),


                 /* Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0,40),
                      child: Row(
                        children: <Widget>[

                          FlatButton(
                            textColor: Colors.white,
                            child: Text(
                              '¿Olvidaste tu contraseña?',
                              style: TextStyle(fontSize: 16,color: Colors.black,
                                decoration: TextDecoration.underline,fontWeight: FontWeight.bold),
                            ),
                            onPressed: ()
                            {

                            },
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ))*/
                ],
              ),
            )));
  }




  Future<FirebaseUser> _handleSignIn() async {
    FirebaseUser user;
    bool userSignedIn = await _googleSignIn.isSignedIn();

    setState(() {
      isUserSignedIn = userSignedIn;
    });

    if (isUserSignedIn) {
      user = await _auth.currentUser();
    }
    else {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      user = (await _auth.signInWithCredential(credential)).user;
      userSignedIn = await _googleSignIn.isSignedIn();
      setState(() {
        isUserSignedIn = userSignedIn;
      });
    }

    return user;
  }

  void onGoogleSignIn(BuildContext context) async {
    FirebaseUser user = await _handleSignIn();
    var userSignedIn = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              WelcomeUserWidget(user)),
    );

    setState(() {
      isUserSignedIn = userSignedIn == null ? true : false;
    });
  }






}

class WelcomeUserWidget extends StatelessWidget {

  FirebaseUser _user;

  WelcomeUserWidget(FirebaseUser user) {
    _user = user;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
        ),
        body: Container(
            color: Colors.white,
            padding: EdgeInsets.all(50),
            child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ClipOval(
                        child: Image.network(
                            _user.photoUrl,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover
                        )
                    ),
                    SizedBox(height: 20),
                    Text('Bienvenido,', textAlign: TextAlign.center),
                    Text(_user.displayName, textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                    SizedBox(height: 20),
                    FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, 'home');
                        //  _googleSignIn.signOut();
                         // Navigator.pop(context, false);
                        },
                        color: Colors.green,
                        child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.navigate_next, color: Colors.white),
                                SizedBox(width: 10),
                                Text('Continuar', style: TextStyle(color: Colors.white))
                              ],
                            )
                        )
                    )
                  ],
                )
            )
        )
    );
  }
}





class PlatosClipper extends CustomPainter {
  @override
  Path paint(Canvas canvas, Size size) {
    final path = Path();
    final path2 = Path();
    final paint = new Paint();
    final paint2 = new Paint();

    // Circulo inferior izquierdo
  /*  paint2.color = Color.fromRGBO(191, 189, 175,1.0).withOpacity(0.3);
    paint2.style = PaintingStyle.fill;
    path2.moveTo(0, size.height);
    path2.lineTo(0,size.height*0.84);
    path2.quadraticBezierTo(size.width*0.35, size.height*0.90, size.width*0.79,size.height*1.40);
    path2.lineTo(size.width,size.height);
    canvas.drawPath(path2,paint2);

    paint.color = Color.fromRGBO(249, 248, 239,1.0);
    paint.style = PaintingStyle.fill;
    path.moveTo(0, size.height);
    path.lineTo(0,size.height*0.85);
    path.quadraticBezierTo(size.width*0.35, size.height*0.90, size.width*0.79,size.height*1.45);
    path.lineTo(size.width,size.height);
    canvas.drawPath(path,paint);*/


  //Circulo a mitad de pantalla
    paint.color =  Colors.white.withOpacity(0.2);
    paint.style = PaintingStyle.fill;
    path.moveTo(0, size.height);
    path.lineTo(0,size.height*1);
    path.quadraticBezierTo(size.width*0.20, size.height*0.35, size.width*1.90,size.height*0.40);
    path.lineTo(size.width,size.height);
    canvas.drawPath(path,paint);

    paint2.color = Colors.white;
    paint2.style = PaintingStyle.fill;
    path2.moveTo(0, size.height);
    path2.lineTo(0,size.height*0.50);
    path2.quadraticBezierTo(size.width*0.68, size.height*0.35, size.width*1.90,size.height*0.90);

    path2.lineTo(size.width,size.height);
    canvas.drawPath(path2,paint2);





    // return path;
  }

  @override
  bool shouldRepaint(PlatosClipper oldClipper) => false;
}

