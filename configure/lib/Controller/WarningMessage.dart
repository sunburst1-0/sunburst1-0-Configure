import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:configure/jsonView/SubMessage.dart';
import 'package:configure/global.dart';


Global global =new Global() ;
String url=global.serverUrl;

Future<List<SubMessage>> getmessage() async {
  var response = await http.get(url+"/warn/all");

  if (response.statusCode == 200) {
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<SubMessage> listOfapplianceTypes = items.map<SubMessage>((json) {
      return SubMessage.fromJson(json);
    }).toList();
    print("200 appliance");
    return listOfapplianceTypes;
  } else {
    throw Exception('Failed to load internet');
  }
}
