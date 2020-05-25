class Warning {
  int id;
  String priority;
  String status;
  String warnMessage;
  DateTime  occurTime;

  Warning({
    this.id,
    this.priority,
    this.status,
    this.warnMessage,
    this.occurTime
  });


  factory Warning.fromJson(Map<String, dynamic> json) {
    return Warning(
      id: json['id'],
      priority: json['priority'],
      status: json['status'],
      warnMessage: json['warnMessage'],
      occurTime: json['occurTime'],
      
    );
  }
}