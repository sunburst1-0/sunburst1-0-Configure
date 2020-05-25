import 'package:configure/jsonView/warning.dart';
import 'package:configure/jsonView/appliance.dart';
import 'package:configure/jsonView/MobileOprator.dart';
import 'package:configure/jsonView/Incident.dart';

class SubMessage {
  Warning warning;
  Appliance applianceType;
  MobileOprator raisedPerson;
  MobileOprator respondPerson;
  Incident incident;

  SubMessage({
    this.warning,
    this.applianceType,
    this.raisedPerson,
    this.respondPerson,
    this.incident
  });


  factory SubMessage.fromJson(Map<String, dynamic> json) {
    return SubMessage(
      warning: json['warning'],
      applianceType: json['applianceType'],
      raisedPerson: json['raisedPerson'],
      respondPerson: json['respondPerson'],
      incident: json['incident'],

    );
  }
}