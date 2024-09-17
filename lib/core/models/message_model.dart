import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MessageModel {
  String message;
  String time;
  String senderId;
  String receiverId;
  MessageModel({
    required this.message,
    required this.time,
    required this.senderId,
    required this.receiverId,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'time': time,
      'sender_id': senderId,
      'reciever_id': receiverId,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      message: map['message'] as String,
      time: map['time'] as String,
      senderId: map['sender_id'] as String,
      receiverId: map['reciever_id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) => MessageModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
