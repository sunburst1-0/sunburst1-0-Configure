
import 'package:configure/jsonView/raiseMessage.dart';
import 'package:configure/jsonView/responseMessage.dart';

class IncidentMessage {
  RaiseMessage raiseMessage;
  ResponseMessage respondMessage;

  IncidentMessage({
    this.raiseMessage,
    this.respondMessage
  });


  factory IncidentMessage.fromJson(Map<String, dynamic> json) {
    return IncidentMessage(
      raiseMessage: json['raiseMessage'],
      respondMessage: json['respondMessage'],

    );
  }
}