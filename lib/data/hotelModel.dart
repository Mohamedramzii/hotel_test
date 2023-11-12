// To parse this JSON data, do
//
//     final hotelModel = hotelModelFromJson(jsonString);

import 'dart:convert';

List<HotelModel> hotelModelFromJson(String str) => List<HotelModel>.from(json.decode(str).map((x) => HotelModel.fromJson(x)));

String hotelModelToJson(List<HotelModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HotelModel {
    String? name;
    int? starts;
    int? price;
    String? currency;
    String? image;
    double? reviewScore;
    String? review;
    String? address;

    HotelModel({
        this.name,
        this.starts,
        this.price,
        this.currency,
        this.image,
        this.reviewScore,
        this.review,
        this.address,
    });

    factory HotelModel.fromJson(Map<String, dynamic> json) => HotelModel(
        name: json["name"],
        starts: json["starts"],
        price: json["price"],
        currency: json["currency"],
        image: json["image"],
        reviewScore: json["review_score"]?.toDouble(),
        review: json["review"],
        address: json["address"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "starts": starts,
        "price": price,
        "currency": currency,
        "image": image,
        "review_score": reviewScore,
        "review": review,
        "address": address,
    };
}
