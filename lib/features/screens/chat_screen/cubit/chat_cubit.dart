import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:may_fair/core/constants/constants.dart';
import 'package:may_fair/core/models/message_model.dart';
import 'package:may_fair/core/repos/chat_repo.dart';
import 'package:may_fair/features/screens/chat_screen/cubit/chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepo chatRepo;
  ChatCubit(this.chatRepo) : super(ChatInitial());
  static ChatCubit get(context) => BlocProvider.of(context);
  TextEditingController messageController = TextEditingController();
  void sendMessage({required String recieveId}) async {
    MessageModel messageModel = MessageModel(
        message: messageController.text,
        time: DateTime.now().toString(),
        senderId: userUId,
        receiverId: 'zXqxGnr1n8Ooec9Vk75tOkNjtUy2');

    final responseRecieveId = await chatRepo.sendMessage(
        senderId: messageModel.senderId,
        recieveId: messageModel.receiverId,
        message: messageModel);
    responseRecieveId.when(success: (data) {
      messageController.text = '';
      print('Send Data to Drivers Collection success');
      emit(SendMessageSuccessState());
    }, failure: (error) {
      print('Send Data to Drivers Collection Error');
      emit(SendMessageErrorState(error));
    });
  }
}
