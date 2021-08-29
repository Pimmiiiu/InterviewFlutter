import 'dart:convert';

List<ProfileModel> profileModelFromJson(String str) => List<ProfileModel>.from(json.decode(str).map((x) => ProfileModel.fromJson(x)));

String profileModelToJson(List<ProfileModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProfileModel {
  ProfileModel({
    this.name,
    this.email,
    this.address,
    this.dob,
    this.photo
  });

  String? name;
  String? email;
  String? address;
  String? dob;
  String? photo;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    address: json["address"] == null ? null : json["address"],
    dob: json["dob"] == null ? null : json["dob"],
    photo: json["photo"] == null ? null : json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "address": address == null ? null : address,
    "dob": dob == null ? null : dob,
    "photo": photo == null ? null : photo,
  };
}
