import 'package:configure/jsonView/SubMessage.dart';

class Message {
  List<SubMessage> subMessage;


  Message({
    this.subMessage,

  });


  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      subMessage: json['subMessage'],


    );
  }
}