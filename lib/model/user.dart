import 'package:cloud_firestore/cloud_firestore.dart';


class UserModel {


   String? id;
   String? name;
   String? email;
   

  UserModel({ this.id, this.name, this.email, });

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    name = snapshot["name"];
    email = snapshot['email'];
    id = snapshot.id;

  }
}
