part of 'auth.dart';
Auth _$UserFromJson(Map<String, dynamic> json) => Auth(
      email: json['name'] as String,
      // email: json['email'] as String,
      password: json['password'] as String,
      token: json['token'] as String,
     
    );

Map<String, dynamic> _$UserToJson(Auth instance) => <String, dynamic>{
      // '_id': instance.userId,
      'email': instance.email,
      // 'email': instance.email,
      'password': instance.password,
      'token': instance.token,
      
    };
