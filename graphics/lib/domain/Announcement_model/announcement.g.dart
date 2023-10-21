// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Announcement _$ReportFromJson(Map<String, dynamic> json) => Announcement(
      announcementId: json['_id'] as String,
      title: json['title'] as String,
      author: json['author'] as String,
      body: json['body'] as String,
     
   
    );

Map<String, dynamic> _$ReportToJson(Announcement instance) => <String, dynamic>{
      '_id': instance.announcementId,
      'title': instance.title,
      'university': instance.author,
      'description': instance.body,
      
    };
