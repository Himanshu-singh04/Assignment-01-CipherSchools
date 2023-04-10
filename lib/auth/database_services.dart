import 'package:cloud_firestore/cloud_firestore.dart';

class database_service {
  final String? uid;
  database_service({this.uid});

  final CollectionReference user_collection =
      FirebaseFirestore.instance.collection("users");
  final CollectionReference group_collection =
      FirebaseFirestore.instance.collection("groups");
  Future saving_user_data(String full_name, String email) async {
    return await user_collection.doc(uid).set({
      "fullname": full_name,
      "email": email,
      "groups": [],
      "profile_pic": "",
      "uid": uid,
    });
  }

  Future getting_user_data(String email) async {
    QuerySnapshot snapshot =
        await user_collection.where("email", isEqualTo: email).get();
    return snapshot;
  }

  get_user_groups() {}
}
