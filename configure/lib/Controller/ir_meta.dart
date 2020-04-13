import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:configure/jsonView/appliance.dart';
import 'package:configure/jsonView/roomSize.dart';
import 'package:configure/global.dart';



Global global =new Global() ;
String url=global.serverUrl;

Future<List<Appliance>> getappliance() async {
  var response = await http.get(url+"/aptype");

  if (response.statusCode == 200) {
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<Appliance> listOfapplianceTypes = items.map<Appliance>((json) {
      return Appliance.fromJson(json);
    }).toList();
    print("200 appliance");
    return listOfapplianceTypes;
  } else {
    throw Exception('Failed to load internet');
  }
}

Future<List<RoomSize>> getRoomSize() async {
  var response = await http.get(url+"/roomsize");


  if (response.statusCode == 200) {
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<RoomSize> listOfroomTypes = items.map<RoomSize>((json) {
      return RoomSize.fromJson(json);
    }).toList();

    return listOfroomTypes;
  } else {
    throw Exception('Failed to load internet');
  }
}