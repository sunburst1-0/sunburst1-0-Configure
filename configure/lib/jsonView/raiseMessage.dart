class RaiseMessage {
  String message;
  DateTime msgResponseTime;

  RaiseMessage({
    this.message,
    this.msgResponseTime
  });


  factory RaiseMessage.fromJson(Map<String, dynamic> json) {
    return RaiseMessage(
      message: json['message'],
      msgResponseTime: json['msgResponseTime'],

    );
  }
}