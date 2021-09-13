import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? name;
  String? email;
  String? imageUrl;
  String? age;
  String? gender;
  String? height;
  String? status;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.imageUrl,
      this.age,
      this.gender,
      this.height,
      this.status});

  UserModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    id = doc['uid'];
    name = doc['name'];
    email = doc['email'];
    imageUrl = doc['imageUrl'];
    age = doc['age'];
    gender = doc['gender'];
    height = doc['height'];
    status = doc['status'];
  }
}
