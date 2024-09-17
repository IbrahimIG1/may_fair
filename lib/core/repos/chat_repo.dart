import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:may_fair/core/helper/firebase_error_handler.dart';
import 'package:may_fair/core/models/message_model.dart';
import 'package:may_fair/core/network_services/chat_services.dart';
import 'package:may_fair/core/network_services/networking_result.dart';

class ChatRepo {
  final ChatServices chatServices;
  ChatRepo(this.chatServices);

  Future<ApiResult<void>> sendMessage({
    required String senderId,
    required String recieveId,
    required MessageModel message,
  })  async{
    try {
      final data = await chatServices.sendMessage(
          senderId: senderId,
          recieveId: recieveId,
          message: message);
          
      return ApiResult.success(data);
    } catch (error) {

      return ApiResult.failure(ApiErrorHandler.handleException(error));
    }
  }

  Future<ApiResult<QuerySnapshot<Map<String, dynamic>>>> getMessageStream(
      {required String chatId}) async {
    QuerySnapshot<Map<String, dynamic>>? querySnapshot;
    try {
      chatServices.getMessagesStream(chatId: chatId).listen((event) {
        querySnapshot = event;
      });
      return ApiResult.success(querySnapshot!);
      // return querySnapshot;
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handleException(error));
    }
  }

  Future<ApiResult<void>> getAllMessages(
      {required String collection, required String docId}) async {
    try {
      final data =
          chatServices.getMessages(collection: collection, docId: docId);
      return ApiResult.success(data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handleException(error));
    }
  }
}
