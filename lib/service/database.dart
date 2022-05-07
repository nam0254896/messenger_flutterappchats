import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  getUserByUserName(String username) async {
    return await FirebaseFirestore.instance
        .collection("user")
        .doc(username)
        .get();
  }

  upLoadUserInfor(userInforMap) {
    FirebaseFirestore.instance
        .collection("user")
        .add(userInforMap)
        .catchError((e) {
      print(e.toString());
    });
  }
}
