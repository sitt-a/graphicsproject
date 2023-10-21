part of 'manager_bloc.dart';

abstract class ManagerblocState extends Equatable {
  const ManagerblocState();
  @override
  List<Object> get props => [];
}

class ManagerblocInitial extends ManagerblocState {}

class GetOngoingSucessful extends ManagerblocState {
  final complaintList;
  GetOngoingSucessful({this.complaintList});
}

class GetOngoingFailed extends ManagerblocState {}

class GetReportedSucessful extends ManagerblocState {
  final complaintList;
  GetReportedSucessful({this.complaintList});
}

class GetReportedFailed extends ManagerblocState {}

class GetSolvedSucessful extends ManagerblocState {
  final complaintList;
  GetSolvedSucessful({this.complaintList});
}

class GetSolvedFailed extends ManagerblocState {}

class DeleteSucessfull extends ManagerblocState {}

class DeleteFailed extends ManagerblocState {}

class MoveSuccessfull extends ManagerblocState {}

class MoveFailed extends ManagerblocState {}

// Announcement

class AnnouncementLoading extends ManagerblocState {}

class AnnouncementsLoadSuccess extends ManagerblocState {
  final List<Announcement> announcements;

  AnnouncementsLoadSuccess([this.announcements = const []]);

  @override
  List<Object> get props => [announcements];
}

class AnnouncementOperationSuccess extends ManagerblocState {
  final List<Announcement> Announcements;
  AnnouncementOperationSuccess([this.Announcements = const []]);
  @override
  List<Object> get props => [Announcements];
}

class AnnouncementOperationFailure extends ManagerblocState {
  final Object error;
  const AnnouncementOperationFailure(this.error);
  @override
  List<Object> get props => [error];
}
