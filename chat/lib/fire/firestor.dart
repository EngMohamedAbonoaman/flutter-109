import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFireStoreService {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  // add data
  static Future<void> addData({
    required String tableName,
    required Map<String, dynamic> data,
  }) async {
    final reference = firestore.collection(tableName);
    await reference.add(data).then((value) => print(value.id));
  }

  static Future<void> updateData({
    required String tableName,
    required String id,
    required Map<String, dynamic> data,
  }) async {
    final reference = firestore.collection(tableName);
    await reference.doc(id).update(data);
  }

  static Future<void> deleteData({
    required String tableName,
    required String id,
  }) async {
    final reference = firestore.collection(tableName);
    await reference.doc(id).delete();
  }

  static Future<T> getDocData<T>({
    required String tableName,
    required String id,
  }) async {
    final reference = firestore.collection(tableName);
    print(reference.get());
    return reference.doc(id).get().then((value) => value.data() as T);
  }

  static Future<List<Map<String,dynamic>>> getDocsData<T>({
    required String tableName,
  }) async {
    final reference = firestore.collection(tableName);
    final snapshot = await reference.get();

    return snapshot.docs.map((e) => e.data()).toList();
  }
  // get one doc

  static Future<T?> getOneData<T>({
    required String tableName,
    required String pram,
    required dynamic pramValue,
    required T Function(Map<String, dynamic>, String id) fromJson,
  }) async {
    final reference = firestore.collection(tableName);
    final snapshot = await reference.where(pram, isEqualTo: pramValue).get();
    return fromJson(
      snapshot.docs.first.data(),
      snapshot.docs.first.id,
    );
  }
}
