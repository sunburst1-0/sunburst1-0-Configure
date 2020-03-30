import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:configure/jsonView/appliance.dart';
import 'package:configure/jsonView/roomSize.dart';
import 'package:configure/global.dart';


Global url;

Future<List<Appliance>> getappliance() async {
  var response = await http.get(url.serverUrl+"/aptype");

  if (response.statusCode == 200) {
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<Appliance> listOfapplianceTypes = items.map<Appliance>((json) {
      return Appliance.fromJson(json);
    }).toList();

    return listOfapplianceTypes;
  } else {
    throw Exception('Failed to load internet');
  }
}

Future<List<RoomSize>> getRoomSize() async {
  var response = await http.get(url.serverUrl+"/roomsize");

  if (response.statusCode == 200) {
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<RoomSize> listOfroomTypes = items.map<RoomSize>((json) {
      return Appliance.fromJson(json);
    }).toList();

    return listOfroomTypes;
  } else {
    throw Exception('Failed to load internet');
  }
}