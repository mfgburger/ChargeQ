import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

class PopupData {
  String travelReason = travelReasons[0];
  DateTime travelDateTime;
  String fromAddress = "", toAddress = "";
  String repeat = repeatCycles[0];
  bool isPriority;

  PopupData(
      {this.isPriority,
      this.travelDateTime,
      this.travelReason,
      this.fromAddress,
      this.toAddress,
      this.repeat});

  void prepareAndSendBackend() {
    //TODO
    var backendData = BackendData();
  }
}

class BackendData {
  String id;
  double stateOfCharge;
  int targetRange;
  int hoursToDeparture;
  double consumptionKwPerKm;
  bool isPriority;
  int maxChargingSpeed;
  String stationId;

  BackendData(
      {this.stateOfCharge,
      this.targetRange,
      this.hoursToDeparture,
      this.consumptionKwPerKm,
      this.isPriority,
      this.maxChargingSpeed,
      this.stationId}) {
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
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body: jsonEncode(jsonMap));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    } else {
      throw Exception('sending feedback error: ${response.body}');
    }
  }
}

const List<String> travelReasons = [
  'Work',
  'Home',
  "Doctor's office",
  "Undefined trip"
];

const List<String> repeatCycles = [
  "never",
  "daily",
  "weekly",
  "monthly",
  "yearly"
];
