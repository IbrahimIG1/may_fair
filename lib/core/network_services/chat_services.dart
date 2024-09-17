import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:may_fair/core/models/message_model.dart';
import 'package:may_fair/core/network_services/firebase_services.dart';

abstract class ChatServices {
  Future<void> sendMessage(
      {required String senderId,
      required String recieveId,
      required MessageModel message});
  Stream<QuerySnapshot<Map<String, dynamic>>> getMessagesStream(
      {required String chatId});
  Future<void> getMessages({
    required String collection,
    required String docId,
  });
}

class ChatServicesImp implements ChatServices {
  final FirebaseFactory firebaseFactory;

  ChatServicesImp(this.firebaseFactory);

  // Function to send a message
  @override
  Future<void> sendMessage(
      {required String senderId,
      required String recieveId,
      required MessageModel message}) async {
    FirebaseFirestore firestore = firebaseFactory.getFirebaseFirestore();

    //* Send Message to User 
    await firestore
        .collection("Users")
        .doc(senderId)
        .collection('chats')
        .doc(recieveId)
        .collection('messages')
        .add({
      'sender_id': message.senderId,
      'reciever_id': message.receiverId,
      'message': message.message,
      'time': message.time,
    });

    //* Send Message to Driver 
    await firestore
        .collection("Drivers")
        .doc(recieveId)
        .collection('chats')
        .doc(senderId)
        .collection('messages')
        .add({
      'sender_id': message.senderId,
      'reciever_id': message.receiverId,
      'message': message.message,
      'time': message.time,
    });
    print('Send Data From ${message.senderId} In Services ');
    print('Send Data to ${message.receiverId} In Services ');
  }

  // Function to get a stream of messages
  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getMessagesStream(
      {required String chatId}) {
    FirebaseFirestore firestore = firebaseFactory.getFirebaseFirestore();
    return firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('time')
        .snapshots();
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getMessages(
      {required String collection, required String docId}) async {
    FirebaseFirestore firestore = firebaseFactory.getFirebaseFirestore();
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firestore.collection(collection).get();
    return querySnapshot;
  }
}
