import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:may_fair/core/network_services/firebase_services.dart';

abstract class CloudFirestoreServices {
  Future<void> addData(String collection, Map<String, dynamic> data);
  Future<List<Map<String, dynamic>>> getAllData(String collection);
  Future<Map<String, dynamic>?> getDataById(String collection, String docId);
  Future<void> updateData(
      String collection, String docId, Map<String, dynamic> newData);
  Future<void> deleteDataById(String collection, String docId);
}

class CloudFirestoreServicesImp implements CloudFirestoreServices {
  final FirebaseFactory firebaseFactory;

  CloudFirestoreServicesImp(this.firebaseFactory);

  /// Method to add data to a Firestore collection
  @override
  Future<void> addData(String collection, Map<String, dynamic> data) async {
    FirebaseFirestore firestore = firebaseFactory.getFirebaseFirestore();
    try {
      await firestore.collection(collection).add(data);
      print("Data added successfully");
    } catch (e) {
      print("Error adding data: $e");
    }
  }

  /// Method to get all documents from a Firestore collection
  @override
  Future<List<Map<String, dynamic>>> getAllData(String collection) async {
    List<Map<String, dynamic>> dataList = [];
    FirebaseFirestore firestore = firebaseFactory.getFirebaseFirestore();
    try {
      QuerySnapshot querySnapshot =
          await firestore.collection(collection).get();
      for (var doc in querySnapshot.docs) {
        dataList.add(doc.data() as Map<String, dynamic>);
      }
      print('get All Data Result is >>>>>>>>> $dataList');
    } catch (e) {
      print("Error getting data: $e");
    }
    return dataList;
  }

  /// Method to get a specific document by ID from a Firestore collection
  @override
  Future<Map<String, dynamic>?> getDataById(
      String collection, String docId) async {
    FirebaseFirestore firestore = firebaseFactory.getFirebaseFirestore();
    try {
      DocumentSnapshot docSnapshot =
          await firestore.collection(collection).doc(docId).get();
      if (docSnapshot.exists) {
        return docSnapshot.data() as Map<String, dynamic>?;
      } else {
        print("Document does not exist");
        return null;
      }
    } catch (e) {
      print("Error getting document: $e");
      return null;
    }
  }

  /// Method to update a document in a Firestore collection
  @override
  Future<void> updateData(
      String collection, String docId, Map<String, dynamic> newData) async {
    FirebaseFirestore firestore = firebaseFactory.getFirebaseFirestore();
    try {
      await firestore.collection(collection).doc(docId).update(newData);
      print("Data updated successfully");
    } catch (e) {
      print("Error updating data: $e");
    }
  }

  /// Method to delete a document from a Firestore collection
  @override
  Future<void> deleteDataById(String collection, String docId) async {
    FirebaseFirestore firestore = firebaseFactory.getFirebaseFirestore();
    try {
      await firestore.collection(collection).doc(docId).delete();
      print("Document deleted successfully");
    } catch (e) {
      print("Error deleting document: $e");
    }
  }
}
