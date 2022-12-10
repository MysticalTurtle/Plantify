import 'dart:convert';

import 'package:recog_plantify/domain/entities/plant.dart';

AddRecordRequest addRecordRequestFromJson(String str) =>
    AddRecordRequest.fromJson(json.decode(str));

String addRecordRequestToJson(AddRecordRequest data) =>
    json.encode(data.toJson());

class AddRecordRequest {
  AddRecordRequest({
    required this.content,
  });

  final String content;

  factory AddRecordRequest.fromJson(Map<String, dynamic> json) =>
      AddRecordRequest(
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
      };

  factory AddRecordRequest.fromPlantRecord(PlantRecord plantRecord) {
    return AddRecordRequest(content: plantRecord.toJson().toString());
  }
}
