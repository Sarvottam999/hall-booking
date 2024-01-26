//  lib/features/search

// To parse this JSON data, do
//
//     final hallBookedModel = hallBookedModelFromJson(jsonString);

import 'dart:convert';

List<HallBookedModel> hallBookedModelFromJson(String str) => List<HallBookedModel>.from(json.decode(str).map((x) => HallBookedModel.fromJson(x)));

String hallBookedModelToJson(List<HallBookedModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HallBookedModel {
    String hallName;
    String hallLocation;
    DateTime bookingDate;
    String status;

    HallBookedModel({
        required this.hallName,
        required this.hallLocation,
        required this.bookingDate,
        required this.status,
    });

    factory HallBookedModel.fromJson(Map<String, dynamic> json) => HallBookedModel(
        hallName: json["hallName"],
        hallLocation: json["hallLocation"],
        bookingDate: DateTime.parse(json["bookingDate"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "hallName": hallName,
        "hallLocation": hallLocation,
        "bookingDate": bookingDate.toIso8601String(),
        "status": status,
    };
}
