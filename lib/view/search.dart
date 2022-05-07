import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messenger_flutterappchat/service/database.dart';
import 'package:messenger_flutterappchat/view/signin.dart';
import 'package:messenger_flutterappchat/widget/widget.dart';

class searchScreeen extends StatefulWidget {
  const searchScreeen({Key? key}) : super(key: key);

  @override
  State<searchScreeen> createState() => _searchScreeenState();
}

class _searchScreeenState extends State<searchScreeen> {
  DatabaseMethods databaseMethods = new DatabaseMethods();
  late QuerySnapshot searchSnapshot;
  TextEditingController searchtextEditingController =
      new TextEditingController();
  initStateSearch() {
    databaseMethods
        .getUserByUserName(searchtextEditingController.text)
        .then((val) {
      setState(() {
        searchSnapshot = val;
      });
    });
  }

  Widget searchList() {
    return searchSnapshot != null
        ? ListView.builder(
        itemCount: searchSnapshot.docs.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return SearchTitle(
              userName: searchSnapshot.docs[index].data()["name"],
              userEmail: searchSnapshot.docs[index].data()["email"]);
        })
        : Container();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appMains(context),
      body: Container(
        child: Column(children: [
          Container(
            color: Color.fromARGB(255, 145, 197, 197),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: searchtextEditingController,
                  style: TextStyle(color: Colors.black45),
                  decoration: InputDecoration(
                      hintText: "search username....",
                      hintStyle: TextStyle(color: Colors.black45),
                      border: InputBorder.none),
                )),
                GestureDetector(
                  onTap: () {
                    initStateSearch();
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          const Color(0x36ffffff),
                          const Color(0x0fffffff),
                        ]),
                        borderRadius: BorderRadius.circular(40)),
                    padding: EdgeInsets.all(12),
                    child: Image.asset(
                      "assets/images/pngtree-search.png",
                      height: 50,
                    ),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class SearchTitle extends StatelessWidget {
  final String userName;
  final String userEmail;
  SearchTitle({required this.userName, required this.userEmail});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName,
              style: simpleTextStyle(),
            ),
            Text(
              userEmail,
              style: simpleTextStyle(),
            )
          ],
        ),
        Spacer(),
        Container(
          decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(30)),
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: Text("Messenger"),
        )
      ]),
    );
  }
}
