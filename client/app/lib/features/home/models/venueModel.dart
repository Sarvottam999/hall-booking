// To parse this JSON data, do
//
//     final hall = hallFromJson(jsonString);

import 'dart:convert';

List<Hall> hallFromJson(String str) => List<Hall>.from(json.decode(str).map((x) => Hall.fromJson(x)));

String hallToJson(List<Hall> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Hall {
    String id;
    String name;
    String location;
    int capacity;
    List<Review> reviews;
    List<String> photos;
    String about;
    int pricePerPlate;
    int v;

    Hall({
        required this.id,
        required this.name,
        required this.location,
        required this.capacity,
        required this.reviews,
        required this.photos,
        required this.about,
        required this.pricePerPlate,
        required this.v,
    });

    factory Hall.fromJson(Map<String, dynamic> json) => Hall(
        id: json["_id"],
        name: json["name"],
        location: json["location"],
        capacity: json["capacity"],
        reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
        photos: List<String>.from(json["photos"].map((x) => x)),
        about: json["about"],
        pricePerPlate: json["pricePerPlate"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "location": location,
        "capacity": capacity,
        "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
        "photos": List<dynamic>.from(photos.map((x) => x)),
        "about": about,
        "pricePerPlate": pricePerPlate,
        "__v": v,
    };
}

class Review {
    double rating;
    Comment comment;
    String id;

    Review({
        required this.rating,
        required this.comment,
        required this.id,
    });

    factory Review.fromJson(Map<String, dynamic> json) => Review(
        rating: json["rating"]?.toDouble(),
        comment: commentValues.map[json["comment"]]!,
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "rating": rating,
        "comment": commentValues.reverse[comment],
        "_id": id,
    };
}

enum Comment {
    BEAUTIFUL_VENUE,
    GREAT_SERVICE
}

final commentValues = EnumValues({
    "Beautiful venue": Comment.BEAUTIFUL_VENUE,
    "Great service": Comment.GREAT_SERVICE
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
