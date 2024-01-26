// To parse this JSON data, do
//
//     final bookingModel = bookingModelFromJson(jsonString);

import 'dart:convert';

List<BookingModel> bookingModelFromJson(String str) => List<BookingModel>.from(json.decode(str).map((x) => BookingModel.fromJson(x)));

String bookingModelToJson(List<BookingModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BookingModel {
    String id;
    String userId;
    String hallId;
    DateTime bookingDate;
    String status;
    DateTime createdAt;
    DateTime updatedAt;
    // int v;

    BookingModel({
        required this.id,
        required this.userId,
        required this.hallId,
        required this.bookingDate,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        // required this.v,
    });

    factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
        id: json["_id"],
        userId: json["userId"],
        hallId: json["hallId"],
        bookingDate: DateTime.parse(json["bookingDate"]),
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        // v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "hallId": hallId,
        "bookingDate": bookingDate.toIso8601String(),
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        // "__v": v,
    };
}
