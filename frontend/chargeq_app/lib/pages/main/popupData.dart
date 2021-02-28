import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

var uuid = Uuid();

class PopupData {
  String travelReason = travelReasons[0];
  DateTime travelDateTime;
  String? fromAddress, toAddress;
  String repeat;
  bool isPriority;

  PopupData(
      {required this.isPriority,
      required this.travelDateTime,
      required this.travelReason,
      this.fromAddress,
      this.toAddress,
      required this.repeat});

  void prepareAndSendBackend() {
    //TODO
    var backendData = BackendData(
        stateOfCharge: 0.0,
        targetRange: 1,
        hoursToDeparture: 2,
        consumptionKwPerKm: 30.2,
        isPriority: true,
        maxChargingSpeed: 10,
        stationId: "alsd-d3fd-21d3");
  }
}

class BackendData {
  late String id;
  double stateOfCharge;
  int targetRange;
  int hoursToDeparture;
  double consumptionKwPerKm;
  bool isPriority;
  int maxChargingSpeed;
  String stationId;

  BackendData(
      {required this.stateOfCharge,
      required this.targetRange,
      required this.hoursToDeparture,
      required this.consumptionKwPerKm,
      required this.isPriority,
      required this.maxChargingSpeed,
      required this.stationId}) {
    this.id = uuid.v4();
  }

  Future<void> sendToBackend() async {
    Map<String, dynamic> jsonMap = {
      "_id": id,
      "_state_of_charge": stateOfCharge,
      "_target_range": targetRange,
      "_hours_to_departure": hoursToDeparture,
      "_consumption_kw_per_km": consumptionKwPerKm,
      "_is_priority": isPriority,
      "_max_charging_speed": maxChargingSpeed,
      "_station_id": stationId
    };

    final response = await http.post('TODO_address',
        headers: {HttpHeaders.contentTypeHeader: "application/json"}, body: jsonEncode(jsonMap));
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
    } else {
      throw Exception('sending feedback error: ${response.body}');
    }
  }
}

const List<String> travelReasons = ['Work', 'Home', "Doctor's office", "Undefined trip"];

const List<String> repeatCycles = ["never", "daily", "weekly", "monthly", "yearly"];