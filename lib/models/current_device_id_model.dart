
import 'dart:convert';

class CurrentDeviceIdModel {
  final String? currentDeviceId;

  CurrentDeviceIdModel({
    this.currentDeviceId,
  });

  factory CurrentDeviceIdModel.fromJson(String str) => CurrentDeviceIdModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CurrentDeviceIdModel.fromMap(Map<String, dynamic> json) => CurrentDeviceIdModel(
    currentDeviceId: json["current_device_id"],
  );

  Map<String, dynamic> toMap() => {
    "current_device_id": currentDeviceId,
  };
}
