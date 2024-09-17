import 'package:may_fair/core/models/error_handler_model.dart';

abstract class ChatState {}

final class ChatInitial extends ChatState {}

final class LoadingChatState extends ChatState {}


final class SendMessageSuccessState extends ChatState {
  
  SendMessageSuccessState();
}
final class SendMessageErrorState extends ChatState {
   ApiErrorModel error;
  SendMessageErrorState(this.error);
}


// final class GetChatSuccessState extends ChatState {
//   final data;
//   GetChatSuccessState(this.data);
// }

// final class GetChatErrorState extends ChatState {
//   ApiErrorModel error;
//   GetChatErrorState(this.error);
// }
