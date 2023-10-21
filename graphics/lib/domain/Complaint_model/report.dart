
import 'package:students_voice/domain/User_model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'report.g.dart';

@JsonSerializable(explicitToJson: true)
class Report{
  
  @JsonKey(name: "_id")
   String complaintId;
   String title;
   String university;
   String description;
   @JsonKey(name: "complain_to")
   String complainTo ;
   String status;
   User complaint_reporter ;

   Report({
      required this.complaintId,
      required this.title,
      required this.university,
      required this.description,
      required this.complainTo,
      required this.status,
      required this.complaint_reporter,

   });

    factory Report.fromJson(Map<String,dynamic> json) =>_$ReportFromJson(json);
    Map<String,dynamic> toJson() =>_$ReportToJson(this);
       
    Map<String, dynamic> toMap() {
    return {
      "id": complaintId,
      'title': title,
      'university': university,
      'description': description,
      'complain_to': complainTo,
      'status': status,
      'complaint_reporter': complaint_reporter,
    };
  }

}