import 'package:cloud_firestore/cloud_firestore.dart';

Future<Map<String, List>> fetchData() async {
  final Map<String, List> data = {};

  // Obtener datos de la colección "users"
  CollectionReference usersRef = FirebaseFirestore.instance.collection("users");
  QuerySnapshot usersQuery = await usersRef.get();
  data['users'] = usersQuery.docs.map((doc) => doc.data()).toList();

  // Obtener datos de la colección "leagues"
  CollectionReference storeRef = FirebaseFirestore.instance.collection("store");
  QuerySnapshot storeQuery = await storeRef.get();
  data['store'] = storeQuery.docs.map((doc) => doc.data()).toList();

  // Obtener datos de la colección "foods"
  CollectionReference foodsRef = FirebaseFirestore.instance.collection("foods");
  QuerySnapshot foodsQuery = await foodsRef.get();
  data['foods'] = foodsQuery.docs.map((doc) => doc.data()).toList();

  return data;
}
