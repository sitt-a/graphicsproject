import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';
@JsonSerializable()
class User{
  @JsonKey(name: "_id")
   String userId;
   String name;
   String email;
   String password;
   String role;
  User({
      required this.userId,
      required this.name,
      required this.email,
      required this.password,
      required this.role,
    });

    factory User.fromJson(Map<String,dynamic> json) =>_$UserFromJson(json);
    Map<String,dynamic> toJson() =>_$UserToJson(this);
    Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'role': role,
    };
  }
}