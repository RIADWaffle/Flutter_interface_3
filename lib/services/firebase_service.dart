import 'package:cloud_firestore/cloud_firestore.dart';

Future<List> getUsers() async {
  List usuarios = [];
  CollectionReference collectionRef =
      FirebaseFirestore.instance.collection("users");

  QuerySnapshot query = await collectionRef.get();

  for (var document in query.docs) {
    usuarios.add(document.data());
  }

  return usuarios;
}
