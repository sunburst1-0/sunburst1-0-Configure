class RoomSize {
  int id;
  String type;

  RoomSize({
    this.id,
    this.type
  });


  factory RoomSize.fromJson(Map<String, dynamic> json) {
    return RoomSize(
      id: json['id'],
      type: json['type'],

    );
  }
}