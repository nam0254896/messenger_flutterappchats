import 'package:flutter/material.dart';
import 'package:messenger_flutterappchat/helper/authenticate.dart';
import 'package:messenger_flutterappchat/service/auth.dart';
import 'package:messenger_flutterappchat/view/search.dart';
import 'package:messenger_flutterappchat/view/signin.dart';

class Chatroom extends StatefulWidget {
  const Chatroom();

  @override
  State<Chatroom> createState() => _ChatroomState();
}

class _ChatroomState extends State<Chatroom> {
  AuthMethods authMethods = new AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Color(0xff6ca6cd),
        appBar: AppBar(
          title: Image.asset(
            "assets/images/logo.png",
            height: 100,
            //color: Color(0xff6ca6cd),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                authMethods.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Authenticate()));
              },
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(Icons.exit_to_app)),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => searchScreeen()));
            },
            child: Icon(Icons.search)));
  }
}
