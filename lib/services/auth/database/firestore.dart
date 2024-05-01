import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //get collection of orders
  final CollectionReference orders =
      FirebaseFirestore.instance.collection('Orders');

  //save to db
  Future<void> saveOrderToDatabase(String receipt) async {
    await orders.add({
      'data': DateTime.now(),
      'order': receipt,
    });
  }
}
