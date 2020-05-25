import 'package:configure/jsonView/incidentMessage.dart';


class Incident {
  List<IncidentMessage> incident;


  Incident({
    this.incident

  });


  factory Incident.fromJson(Map<String, dynamic> json) {
    return Incident(
      incident: json['incident'],


    );
  }
}