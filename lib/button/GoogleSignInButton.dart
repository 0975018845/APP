import 'package:flutter/material.dart';
import 'package:flutter_app2/ui/todoList.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_sign_in/google_sign_in.dart';


class GoogleSignInButton extends StatefulWidget {
  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {

  bool _isLoggedIn = false;

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  login() async{
    try{
      await _googleSignIn.signIn();
      setState(() {
        _isLoggedIn = true;
      });
    } catch (err){
      print(err);
    }
  }

  logout(){
    _googleSignIn.signOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(icon: FaIcon(FontAwesomeIcons.google,color: Colors.red,)
            ,onPressed: () {
              login();
              Navigator.push(context,MaterialPageRoute(builder: (context) => TodoList()),);
            })
      ],
    );


  }
}
