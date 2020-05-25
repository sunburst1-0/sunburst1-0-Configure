class ResponseMessage {
  String message;
  DateTime msgResponseTime;

  ResponseMessage({
    this.message,
    this.msgResponseTime
  });


  factory ResponseMessage.fromJson(Map<String, dynamic> json) {
    return ResponseMessage(
      message: json['message'],
      msgResponseTime: json['msgResponseTime'],

    );
  }
}