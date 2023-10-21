part of 'userbloc_bloc.dart';

abstract class UserblocEvent extends Equatable {
  const UserblocEvent();

  @override
  List<Object> get props => [];
}

class GetMyReports extends UserblocEvent {
  dynamic msg;
  GetMyReports(this.msg);
}

class ReportNow extends UserblocEvent {
  dynamic image;
  ReportNow(this.image);
}

class GetAnnouncement extends UserblocEvent {}

class GetMyReport extends UserblocEvent {
  dynamic id;
  GetMyReport(this.id);
}

class UpdateProfile extends UserblocEvent {
  dynamic password;
  dynamic email;
  dynamic name;
  UpdateProfile(this.password, this.email, this.name);
}

class UpdateComplaint extends UserblocEvent {
  final String id;
  final Map<String, dynamic> updatedData;
  UpdateComplaint(this.id, this.updatedData);
}

class DeleteReported extends UserblocEvent {
  dynamic id;
  DeleteReported(this.id);
}

class ReportNows extends UserblocEvent {}
