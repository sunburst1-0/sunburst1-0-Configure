class MobileOprator {
  int id;
  String name;
  String employeeNo;
  String mobileNo;

  MobileOprator({
    this.id,
    this.name,
    this.employeeNo,
    this.mobileNo
  });


  factory MobileOprator.fromJson(Map<String, dynamic> json) {
    return MobileOprator(
      id: json['id'],
      name: json['name'],
      employeeNo: json['employeeNo'],
      mobileNo: json['mobileNo'],

    );
  }
}