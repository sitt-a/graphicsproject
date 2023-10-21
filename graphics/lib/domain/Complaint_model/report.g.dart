// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Report _$ReportFromJson(Map<String, dynamic> json) => Report(
      complaintId: json['_id'] as String,
      title: json['title'] as String,
      university: json['university'] as String,
      description: json['description'] as String,
      complainTo: json['complaint_to'] as String,
      status: json['status'] as String,
      complaint_reporter: User.fromJson(json['complaint_reporter'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
      '_id': instance.complaintId,
      'title': instance.title,
      'university': instance.university,
      'description': instance.description,
      'complaint_to': instance.complainTo,
       'status':instance.status,
      'complaint_reporter': instance.complaint_reporter.toJson(),
    };
