class Appliance {
  int id;
  String type;

  Appliance({
    this.id,
    this.type
  });


  factory Appliance.fromJson(Map<String, dynamic> json) {
    return Appliance(
      id: json['id'],
      type: json['type'],

    );
  }
}